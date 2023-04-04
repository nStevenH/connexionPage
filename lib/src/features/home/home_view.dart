import 'package:connexion/src/constant/gradient.dart';
import 'package:connexion/src/features/auth/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _surnameTextController = TextEditingController();
  final TextEditingController _ageTextController = TextEditingController();

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

                  reusableTextField(
                    "Nom",
                    Icons.person_outline,
                    false,
                    _surnameTextController,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  reusableTextField(
                      "Prénom",
                      Icons.person_outline,
                      false,
                      _nameTextController,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  reusableTextField(
                      "Age",
                      Icons.person_outline,
                      false,
                      _ageTextController,
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
