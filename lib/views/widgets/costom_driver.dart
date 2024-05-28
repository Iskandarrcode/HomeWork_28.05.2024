import 'package:dars5/views/screens/home_screen.dart';
import 'package:dars5/views/screens/settings_screen.dart';
import 'package:dars5/views/screens/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        AppBar(
          title: const Text("MENU"),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) {
                return HomeScreen();
              }));
            },
            child: const Row(
              children: [
                Icon(Icons.home),
                SizedBox(width: 40),
                Text(
                  "Home",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) {
                return ToDoScreen();
              }));
            },
            child: const Row(
              children: [
                Icon(Icons.today_outlined),
                SizedBox(width: 40),
                Text(
                  "ToDo",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return Placeholder();
              }));
            },
            child: const Row(
              children: [
                Icon(Icons.note_alt_outlined),
                SizedBox(width: 40),
                Text(
                  "Note",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) {
                return SettingsScreen();
              }));
            },
            child: const Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 40),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
