import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winter_arc/login_register_auth/auth_service.dart';

import 'login_register_auth/login_page.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    final _auth = AuthService();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('HomePage'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () async {
                  await _auth.signout();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const loginPage(),
                    ),
                  );
                },
                child: Text('Log Out'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
