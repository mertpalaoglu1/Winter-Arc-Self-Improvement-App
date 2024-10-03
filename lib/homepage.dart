import 'package:easy_count_timer/easy_count_timer.dart';
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
  var _attempt = 0;
  var secilenItem = 0;
  var timeController = CountTimerController();
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            selectedIconTheme: IconThemeData(size: 30),
            currentIndex: secilenItem,
            onTap: (index) {
              setState(() {
                secilenItem = index;
              });
            },
            selectedLabelStyle: TextStyle(color: Colors.red),
            selectedFontSize: 18,
            unselectedFontSize: 15,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                label: 'Nofap',
                icon: Icon(
                  Icons.access_alarm_rounded,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.access_alarm_rounded,
                  color: Colors.lightBlueAccent,
                ),
              ),
              BottomNavigationBarItem(
                label: 'To do',
                icon: Icon(
                  Icons.checklist,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.checklist,
                  color: Colors.lightBlueAccent,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Meditation',
                icon: Icon(
                  Icons.accessibility,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.accessibility,
                  color: Colors.lightBlueAccent,
                ),
              )
            ]),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: Text(
                'NOFAP TIMER',
                style: GoogleFonts.oswald(fontSize: 80),
              ),
            ),
            Text(
              'Do not relapse, remember why you started!',
              style: GoogleFonts.oswald(fontSize: 20),
            ),
            Center(
              child: Container(
                color: Colors.grey,
                child: CountTimer(
                  spacerWidth: 10,
                  hoursDescription: 'Hours',
                  secondsDescription: 'Secs',
                  minutesDescription: 'Mins',
                  timeTextStyle: TextStyle(fontSize: 30),
                  colonsTextStyle: TextStyle(fontSize: 10),
                  descriptionTextStyle: TextStyle(fontSize: 20),
                  controller: timeController,
                  format: CountTimerFormat.daysHoursMinutesSeconds,
                ),
              ),
            ),
            Text('Attempt: ${_attempt}',
                style: GoogleFonts.oswald(fontSize: 23)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Relapse Button', style: GoogleFonts.oswald(fontSize: 23)),
                IconButton(
                    iconSize: 80,
                    onPressed: () {
                      timeController.restart();
                      _attempt = _attempt + 1;
                      setState(() {});
                    },
                    icon: const Icon(Icons.restart_alt_rounded)),
              ],
            ),
            TextButton(
              onPressed: () async {
                await _auth.signout();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const loginPage(),
                  ),
                );
              },
              child: Text(
                'Log Out',
                style: TextStyle(color: Colors.black87),
              ),
            )
          ],
        ),
      ),
    );
  }
}
