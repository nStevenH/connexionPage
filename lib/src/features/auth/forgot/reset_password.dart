import 'package:connexion/src/constant/gradient.dart';
import 'package:connexion/src/features/auth/widgets/firebaseButton.dart';
import 'package:connexion/src/features/auth/widgets/Logo.dart';
import 'package:connexion/src/features/auth/widgets/textfield_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              0,
            ),
            child: Column(
                children: <Widget>[
                  logoWidget(
                    'assets/logo/logo_light.png',
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  reusableTextField(
                    "Enter Email ID",
                    Icons.person_outline,
                    false,
                    _emailTextController,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  firebaseButton(context, "Reset password", (){
                    FirebaseAuth.instance.
                    sendPasswordResetEmail(email: _emailTextController.text).
                    then((value) => Navigator.of(context).pop());
                  })
                ]
            ),
          ),
        ),
      ),
    );
  }
}
