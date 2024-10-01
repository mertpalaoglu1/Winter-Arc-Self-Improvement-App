import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winter_arc/login_register_auth/register_page.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
                child: Text('LOCK IN.',
                    style: GoogleFonts.oswald(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Login to your account',
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
                    'Login',
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
                      "You don't have an account?",
                      style: GoogleFonts.oswald(fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const registerPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Register',
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
