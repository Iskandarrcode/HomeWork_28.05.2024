// // ignore: file_names
// import 'package:dars5/controllers/note_controller.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class NoteAdd extends StatefulWidget {
//   NoteController noteController = NoteController();
//    NoteAdd({super.key, required this.noteController});

//   @override
//   State<NoteAdd> createState() => _NoteAddState();
// }

// class _NoteAddState extends State<NoteAdd> {
//   final TextEditingController idController = TextEditingController();
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController contentController = TextEditingController();

//   final _formkey = GlobalKey<FormState>();

//   String title = "";
//   DateTime? selectedDate;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: const Color.fromARGB(255, 27, 42, 107),
//       title: const Text("Add todo"),
//       content: Form(
//         key: _formkey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               controller: idController,
//               textInputAction: TextInputAction.next,
//               decoration: const InputDecoration(
//                 label: Text("ID"),
//               ),
//               validator: (value) {
//                 if (value == null || value.trim().isEmpty) {
//                   return "Input ID";
//                 }
//                 return null;
//               },
//               onSaved: (newTodo) {
//                 if (newTodo != null) {
//                   title = newTodo;
//                 }
//               },
//             ),
//             TextFormField(
//               controller: titleController,
//               textInputAction: TextInputAction.next,
//               decoration: const InputDecoration(
//                 label: Text("Title"),
//               ),
//               validator: (value) {
//                 if (value == null || value.trim().isEmpty) {
//                   return "Input Title";
//                 }
//                 return null;
//               },
//               onSaved: (newTodo) {
//                 if (newTodo != null) {
//                   title = newTodo;
//                 }
//               },
//             ),
//             TextFormField(
//               controller: contentController,
//               textInputAction: TextInputAction.next,
//               decoration: const InputDecoration(
//                 label: Text("Description"),
//               ),
//               validator: (value) {
//                 if (value == null || value.trim().isEmpty) {
//                   return "Input Description";
//                 }
//                 return null;
//               },
//               onSaved: (newTodo) {
//                 if (newTodo != null) {
//                   title = newTodo;
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text("Bekor qilish"),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             if (_formkey.currentState!.validate()) {
//               _formkey.currentState!.save();
//               widget.noteController.noteAdd(
//                 idController.text,
//                 titleController.text,
//                 contentController.text,
//                 DateTime.now(),
//               );
//               Navigator.pop(context);
//             }
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue,
//             foregroundColor: Colors.white,
//           ),
//           child: const Text("Qo'shish"),
//         )
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:dars5/controllers/note_controller.dart';

class NoteAdd extends StatefulWidget {
  final NoteController noteController;

  NoteAdd({Key? key, required this.noteController}) : super(key: key);

  @override
  _NoteAddState createState() => _NoteAddState();
}

class _NoteAddState extends State<NoteAdd> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 27, 42, 107),
      title: const Text("Add Note"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: idController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "ID",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter an ID";
                }
                return null;
              },
            ),
            TextFormField(
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter a title";
                }
                return null;
              },
            ),
            TextFormField(
              controller: contentController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Description",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter a description";
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.noteController.noteAdd(
                idController.text,
                titleController.text,
                contentController.text,
                DateTime.now(),
              );
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text("Add"),
        ),
      ],
    );
  }
}
