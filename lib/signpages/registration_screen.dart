import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salhurry/Main/screenmain.dart';
import 'package:salhurry/signpages/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "Registration_screen";

  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email '),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password '),
            ),
            const SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
                child: const Text('Register'),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  //Create new Account
                  try {
                    await _auth
                        .createUserWithEmailAndPassword(
                            email: email, password: password)
                        .then((value) {
                      setState(() {
                        showSpinner = false;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenMain()));
                      print('Successfully Created');
                    });
                  } catch (e) {
                    print(e);
                  }
                })
          ],
        ),
      ),
    );
  }
}
