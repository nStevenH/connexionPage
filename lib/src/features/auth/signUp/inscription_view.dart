import 'package:connexion/src/constant/gradient.dart';
import 'package:connexion/src/features/auth/signIn/connexion_view.dart';
import 'package:connexion/src/features/auth/widgets/Logo.dart';
import 'package:connexion/src/features/auth/widgets/button/signin_signup_button.dart';
import 'package:connexion/src/features/auth/widgets/textfield_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);

  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

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
                  "Enter UserName",
                  Icons.person_outline,
                  false,
                  _userNameTextController,
                ),
                const SizedBox(
                  height: 20,
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
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signUnSignUpButton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                  // ignore: avoid_print
                      .then((value) {
                    if (kDebugMode) {
                      print("Created new account");
                    }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignInView(),
                        ));
                  }).onError((error, stackTrace) {
                    if (kDebugMode) {
                      print("Error ${error.toString()}");
                    }
                  });
                }
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
