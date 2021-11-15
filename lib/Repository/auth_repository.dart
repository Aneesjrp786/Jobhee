import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  String _verificationCode;

  Future<void> SendVerificationCode() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+923165418131',
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
        _verificationCode = verificationID;
        print(_verificationCode);
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        _verificationCode = verificationID;
        print("Retrieval");
      },
      timeout: Duration(seconds: 60),
    );
  }
}
