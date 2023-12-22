import 'package:flutter/material.dart';

class PhoneAuthWidget extends StatelessWidget {
  const PhoneAuthWidget(
      {super.key, required this.phoneController, required this.sendOTP});

  final TextEditingController phoneController;
  final Function() sendOTP;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Login",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          autofocus: true,
          controller: phoneController,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(10)),
            prefix: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '(+856)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: sendOTP,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0))),
              child: const Text('Send OTP')),
        )
      ],
    );
  }
}
