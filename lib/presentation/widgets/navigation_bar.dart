import 'package:flutter/material.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: const TextStyle(color: Colors.black),
      unselectedLabelStyle: const TextStyle(color: Colors.black),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blue), label: 'home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.wallet, color: Colors.blue), label: 'wallet'),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.blue),
            label: 'notification'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.blue), label: 'account')
      ],
    );
  }
}
