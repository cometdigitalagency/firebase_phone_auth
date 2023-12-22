import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyOtpWidget extends StatelessWidget {
  const VerifyOtpWidget(
      {super.key, required this.verifyOtp, required this.resendOtp});
  final Function(String) verifyOtp;
  final Function() resendOtp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Your OTP has been sent",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        OtpTextField(
          numberOfFields: 6,
          fieldWidth: 40,
          borderColor: const Color(0xFF512DA8),
          showFieldAsBox: true,
          onSubmit: verifyOtp,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text('Have not received OTP yet?'),
        TextButton(onPressed: resendOtp, child: const Text('Resend OTP')),
      ],
    );
  }
}
