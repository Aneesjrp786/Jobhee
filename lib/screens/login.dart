import 'package:baby_madics/Design/Shade.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> clickOnLogin(BuildContext context) async {
    if (_contactEditingController.text.isEmpty) {
      showErrorDialog(context, 'Contact number can\'t be empty.');
    } else {
      String contact = '+92' + _contactEditingController.text;
      // Navigator.pop(context);
      final responseMessage =
          await Navigator.pushNamed(context, '/otpScreen', arguments: contact);
      if (responseMessage != null) {
        showErrorDialog(context, responseMessage as String);
      }
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    // set up the AlertDialog
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Yes'),
          onPressed: () {
            // Navigator.of(context).pop();
          },
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  final _contactEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
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
                const Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Text(
                  'Enter your mobile number to receive a verification code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                _NumberTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _ImageField() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Image.asset(
      'assets/images/feedbackImage.png',
      height: screenHeight * 0.3,
      fit: BoxFit.contain,
    );
  }

  Widget _NumberTextField() {
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
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(
                color: Shade.nearlyBlue,
              ),
              borderRadius: BorderRadius.circular(36),
            ),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text("+92"),
                SizedBox(
                  width: screenWidth * 0.01,
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Contact Number',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 13.5),
                    ),
                    keyboardType: TextInputType.number,
                    controller: _contactEditingController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomButton(this.clickOnLogin),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final clickOnLogin;

  // ignore: sort_constructors_first
  const CustomButton(this.clickOnLogin);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clickOnLogin(context);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Shade.nearlyBlue,
          borderRadius: BorderRadius.circular(36),
        ),
        alignment: Alignment.center,
        child: const Text(
          'Send OTP',
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
      ),
    );
  }
}
