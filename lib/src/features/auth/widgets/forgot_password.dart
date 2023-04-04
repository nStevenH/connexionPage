import 'package:connexion/src/features/auth/forgot/reset_password.dart';
import 'package:flutter/material.dart';

Widget forgotPassword(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    alignment: Alignment.bottomRight,
    child: TextButton(
      child: const Text(
        textAlign: TextAlign.right,
        'Forgot password?',
        style: TextStyle(color: Colors.white70),
      ),
      onPressed: ()=> Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ResetPassword(),
      )),
    ),
  );
}