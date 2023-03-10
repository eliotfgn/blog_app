import 'package:blog/screens/create_task_screen.dart';
import 'package:blog/screens/notifications_screen.dart';
import 'package:blog/screens/tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  final int currentIndex;

  const BottomNavigation(this.currentIndex, {Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, TasksScreen.routeName);
            break;
          case 2:
            Navigator.pushReplacementNamed(context, CreateTaskScreen.routeName);
            break;
          case 3:
            Navigator.pushReplacementNamed(
                context, NotificationsScreen.routeName);
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      iconSize: 25,
      selectedItemColor: Colors.red,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.grey,
      enableFeedback: true,
      currentIndex: widget.currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.house),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.solidCalendar),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.circlePlus),
          label: 'Events Organizers',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.solidBell),
          label: 'About us',
        ),
      ],
      backgroundColor: Colors.white,
    );
  }
}
