import 'package:dars5/notifiers/son_taminlovchi.dart';
import 'package:flutter/material.dart';

class InnerTextWidget extends StatelessWidget {
  const InnerTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListenableBuilder(
        listenable: SonTaminlovchi.uzingniQaytar(context).son,
        builder: (ctx, child) {
          return Text(
            SonTaminlovchi.uzingniQaytar(context).son.qiymat.toString(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      ),
    );
  }
}