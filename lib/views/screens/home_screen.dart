import 'package:dars5/models/son.dart';
import 'package:dars5/notifiers/son_taminlovchi.dart';
import 'package:dars5/views/widgets/costom_driver.dart';
import 'package:dars5/views/widgets/text_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SonTaminlovchi(
      son: Son(0),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(149, 45, 48, 74),
            title: const Text("Home Screen"),
          ),
          drawer: const CustomDrawer(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ListenableBuilder(
                  listenable: SonTaminlovchi.uzingniQaytar(context).son,
                  builder: (context, child) {
                    return Text(
                      SonTaminlovchi.uzingniQaytar(context)
                          .son
                          .qiymat
                          .toString(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              const TextWidget(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: SonTaminlovchi.uzingniQaytar(context).son.increment,
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
