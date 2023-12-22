import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "You're successfully logged in",
            style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 32),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            user?.phoneNumber ?? 'Null',
            style: const TextStyle(fontSize: 22),
          )
        ],
      ),
    );
  }
}
