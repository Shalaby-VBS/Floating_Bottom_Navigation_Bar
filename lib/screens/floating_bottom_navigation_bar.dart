import 'package:floating_navigation_bar/screens/notifications_screen.dart';
import 'package:floating_navigation_bar/screens/profile_screen.dart';
import 'package:floating_navigation_bar/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class FloatingBottomNavigationBar extends StatefulWidget {
  const FloatingBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<FloatingBottomNavigationBar> createState() => _FloatingBottomNavigationBarState();
}

class _FloatingBottomNavigationBarState extends State<FloatingBottomNavigationBar> {
  int screenIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const NotificationsScreen(),
    const SettingsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  Stack(
        children: [
          _screens.elementAt(screenIndex),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Align(
              alignment: const Alignment(0.0,1.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(14)),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  backgroundColor: Colors.white12,
                  currentIndex: screenIndex,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.grey[400],
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  iconSize: MediaQuery.of(context).size.width * 0.058,
                  selectedFontSize: MediaQuery.of(context).size.width * 0.03,
                  unselectedFontSize: MediaQuery.of(context).size.width * 0.026,
                  onTap: (index) {
                    setState(() {
                      screenIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.notifications),
                      label: 'Notifications',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
