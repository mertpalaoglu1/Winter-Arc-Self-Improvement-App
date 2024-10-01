import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class registerPage extends StatefulWidget {
  const registerPage({Key? key}) : super(key: key);

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
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
                child: Text('LOCK IN.',
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
                  onPressed: () {},
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
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: GoogleFonts.oswald(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
