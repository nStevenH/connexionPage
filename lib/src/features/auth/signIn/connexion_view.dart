import 'package:connexion/src/constant/gradient.dart';
import 'package:connexion/src/features/auth/widgets/forgot_password.dart';
import 'package:connexion/src/features/auth/widgets/Logo.dart';
import 'package:connexion/src/features/auth/widgets/button/signUpOption.dart';
import 'package:connexion/src/features/auth/widgets/button/signin_signup_button.dart';
import 'package:connexion/src/features/auth/widgets/textfield_custom.dart';
import 'package:connexion/src/features/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final TextEditingController _emailTextController = TextEditingController();
final TextEditingController _passwordTextController = TextEditingController();

// ignore: camel_case_types
class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Email",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Password",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(
                  height: 8,
                ),
                forgotPassword(context),

                signUnSignUpButton(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text,).then((value) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const Home(),
                        ));
                  }).onError((error, stackTrace) {
                    if (kDebugMode) {
                      print("Error ${error.toString()}");
                    }
                  });
                }),

                signUpOption(context, '/Inscription'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}