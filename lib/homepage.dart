import 'package:flutter/material.dart';
import 'package:winter_arc/pages/meditationPage.dart';
import 'package:winter_arc/pages/nofapPage.dart';
import 'package:winter_arc/pages/toDoPage.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var secilenItem = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: sayfaSec(secilenItem),
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
          ),
        ],
      ),
    ));
  }

  sayfaSec(secilenSayfa) {
    if (secilenSayfa == 0) {
      return nofapPage();
    }
    if (secilenSayfa == 1) {
      return todoPage();
    }
    if (secilenSayfa == 2) {
      return meditationPage();
    }
  }
}
