import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winter_arc/login_register_auth/auth_service.dart';
import 'package:winter_arc/login_register_auth/login_page.dart';
import '../homepage.dart';

class registerPage extends StatefulWidget {
  const registerPage({Key? key}) : super(key: key);

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();

  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('DONT GIVE UP.',
                    style: GoogleFonts.oswald(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Register a new account',
                  style: GoogleFonts.oswald(fontSize: 20),
                ),
              ),
              SafeArea(
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                      icon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                      labelText: 'Email'),
                  controller: _email,
                ),
              ),
              SafeArea(
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                      focusColor: Colors.grey,
                      icon: Icon(Icons.password_outlined),
                      border: OutlineInputBorder(),
                      labelText: 'Password'),
                  controller: _password,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.grey)),
                  onPressed: _signup,
                  child: Text(
                    'Register',
                    style: GoogleFonts.oswald(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.oswald(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const loginPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.oswald(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _signup() async {
    final user =
        await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
    if (user != null) {
      log("User Created Succesfully");
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const homePage(),
        ),
      );
    }
  }
}
