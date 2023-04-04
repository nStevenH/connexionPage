import 'package:connexion/src/features/auth/signUp/inscription_view.dart';
import 'package:flutter/material.dart';


Row signUpOption(BuildContext context, String route) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Don't have account?",
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpView()),
          );
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}
