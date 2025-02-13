import 'package:dars5/controllers/todo_controllers.dart';
import 'package:dars5/notifiers/todo_notifier.dart';
import 'package:dars5/views/widgets/costom_driver.dart';
import 'package:dars5/views/widgets/todo_widgets/todo_add.dart';
import 'package:dars5/views/widgets/todo_widgets/todo_edit.dart';
import 'package:dars5/views/widgets/todo_widgets/todo_item.dart';
import 'package:flutter/material.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    ToDoController toDoControllerr = TodoNotifier.of(context);
    return ListenableBuilder(
      listenable: toDoControllerr,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text("ToDo"),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return ToDoAdd(
                        toDoController: toDoControllerr,
                      );
                    });
              },
              icon: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: toDoControllerr.list.length,
                itemBuilder: (context, index) {
                  return TodoItem(
                    title: toDoControllerr.list[index].title,
                    onDelete: () {
                      toDoControllerr.todoRemove(index);
                      setState(() {}); // Ensure the screen updates
                    },
                    onEdit: () async {
                      Map<String, dynamic>? data = await showDialog(
                          context: context,
                          builder: (ctx) {
                            return ToDoEdit(
                              toDoControllerr: toDoControllerr,
                              index: index,
                            );
                          });

                      if (data != null) {
                        toDoControllerr.todoEdit(
                          index,
                          data["id"],
                          data["title"],
                          data["description"],
                        );
                        setState(() {}); // Ensure the screen updates
                      }
                    },
                    dateTime: toDoControllerr.list[index].dates,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
