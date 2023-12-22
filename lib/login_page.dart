import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phone_auth/show_error_dialog.dart';
import 'package:firebase_phone_auth/home_page.dart';
import 'package:firebase_phone_auth/phone_auth_widget.dart';
import 'package:firebase_phone_auth/verify_otp_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  bool isSent = false;
  String? verificationID;
  int? resendToken;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
              child: isSent
                  ? VerifyOtpWidget(
                      verifyOtp: (String otpText) async {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationID ?? '',
                                smsCode: otpText);
                        try {
                          await auth
                              .signInWithCredential(credential)
                              .then((value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(
                                          user: value.user,
                                        )));
                          });
                        } catch (e) {
                          showErrorDialog(context, e.toString());
                        }
                      },
                      resendOtp: () async {
                        await auth.verifyPhoneNumber(
                            phoneNumber: '+856${phoneController.text}',
                            forceResendingToken: resendToken,
                            verificationCompleted:
                                (PhoneAuthCredential credential) async {
                              try {
                                await auth
                                    .signInWithCredential(credential)
                                    .then((value) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage(
                                                user: value.user,
                                              )));
                                });
                              } catch (e) {
                                showErrorDialog(context, e.toString());
                              }
                            },
                            verificationFailed:
                                (FirebaseAuthException exception) {
                              showErrorDialog(
                                  context, exception.message.toString());
                            },
                            codeSent: (String verificationId, int? token) {
                              setState(() {
                                isSent = true;
                                verificationID = verificationId;
                                resendToken = token;
                              });
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {
                              setState(() {
                                isSent = true;
                                verificationID = verificationId;
                              });
                            });
                      },
                    )
                  : PhoneAuthWidget(
                      phoneController: phoneController,
                      sendOTP: () async {
                        await auth.verifyPhoneNumber(
                            phoneNumber: '+856${phoneController.text}',
                            forceResendingToken: resendToken,
                            verificationCompleted:
                                (PhoneAuthCredential credential) async {
                              try {
                                await auth
                                    .signInWithCredential(credential)
                                    .then((value) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage(
                                                user: value.user,
                                              )));
                                });
                              } catch (e) {
                                showErrorDialog(context, e.toString());
                              }
                            },
                            verificationFailed:
                                (FirebaseAuthException exception) {
                              showErrorDialog(
                                  context, exception.message.toString());
                            },
                            codeSent: (String verificationId, int? token) {
                              setState(() {
                                isSent = true;
                                verificationID = verificationId;
                                resendToken = token;
                              });
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {
                              setState(() {
                                isSent = true;
                                verificationID = verificationId;
                              });
                            });
                      },
                    )),
        ),
      ),
    );
  }
}


