import 'package:baby_madics/navigation_home_screen.dart';
import 'package:baby_madics/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpScreen extends StatefulWidget {
  bool _isInit = true;
  var _contact = " ";

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool hasChangeDependencies = false;
  String _verificationCode;
  String smsOTP;
  String uid;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ImageField(),
                SizedBox(height: screenHeight * 0.02),
                _VerificationTextField(),
                SizedBox(height: screenHeight * 0.02),
                _DigitLabel(),
                SizedBox(height: screenHeight * 0.04),
                _VerificationCodeField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget._isInit) {
      widget._contact =
          '${ModalRoute.of(context).settings.arguments as String}';
      _SendVerificationCode(widget._contact);
      widget._isInit = false;
    }
  }

  Widget _ImageField() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Image.asset(
      'assets/images/registration.png',
      height: screenHeight * 0.3,
      fit: BoxFit.contain,
    );
  }

  Widget _VerificationTextField() {
    return const Text(
      'Verification',
      style: TextStyle(fontSize: 28, color: Colors.black),
    );
  }

  Widget _DigitLabel() {
    return Text(
      'Enter A 6 digit number that was sent to ${widget._contact}',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
    );
  }

  Widget _VerificationCodeField() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenWidth > 600 ? screenWidth * 0.2 : 16),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.5), //(x,y)
              blurRadius: 4.0,
            ),
          ],
          borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          darkRoundedPinPut(),
          SizedBox(
            height: screenHeight * 0.04,
          ),
          GestureDetector(
            onTap: () {
              _verifyOTP();
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 253, 188, 51),
                borderRadius: BorderRadius.circular(36),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Verify',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _SendVerificationCode(String contact) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: contact,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            print("User Logged In");
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print("e.message");
        print(e.message);
      },
      codeSent: (String verificationID, int resendToken) {
        setState(() {
          _verificationCode = verificationID;
          print(_verificationCode);
        });
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        setState(() {
          _verificationCode = verificationID;
          print("Retrieval");
        });
      },
      timeout: Duration(seconds: 60),
    );
  }

  Widget darkRoundedPinPut() {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(20.0),
    );
    return PinPut(
      eachFieldWidth: 40.0,
      eachFieldHeight: 40.0,
      withCursor: true,
      fieldsCount: 6,
      submittedFieldDecoration: pinPutDecoration,
      selectedFieldDecoration: pinPutDecoration,
      followingFieldDecoration: pinPutDecoration,
      pinAnimationType: PinAnimationType.scale,
      onSubmit: (String pin) {
        smsOTP = pin as String;
      },
      textStyle: const TextStyle(color: Colors.white, fontSize: 14.0),
    );
  }

  Future<void> _verifyOTP() async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationCode, smsCode: smsOTP))
          .then((value) async {
        if (value.user != null) {
          print("Pass to home page");
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavigationHomeScreen()),
          );
        }
      });
    } catch (e) {
      print("SOMETHING WRONG");
      FocusScope.of(context).unfocus();
    }
  }
}
