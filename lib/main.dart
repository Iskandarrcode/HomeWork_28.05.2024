import 'package:dars5/controllers/settings_controllers.dart';
import 'package:dars5/controllers/todo_controllers.dart';
import 'package:dars5/notifiers/settings_notifier.dart';
import 'package:dars5/notifiers/todo_notifier.dart';
import 'package:dars5/views/screens/todo_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {
    return TodoNotifier(
      toDoController: ToDoController(),
      child: SettingsNotifier(
        settingsController: SettingsController(),
        child: Builder(builder: (context) {
          return ListenableBuilder(
            listenable: SettingsNotifier.of(context),
            builder: (ctx, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primaryColor: Colors.blue,
                ),
                darkTheme: ThemeData.dark(),
                themeMode: SettingsNotifier.of(context).settings.themeMode,
                home: const ToDoScreen(),
              );
            },
          );
        }),
      ),
    );
  }
}
