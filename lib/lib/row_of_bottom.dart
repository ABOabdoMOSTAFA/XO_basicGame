import 'package:flutter/material.dart';

import 'Xogame_bottom.dart';

class RowOfBottom extends StatelessWidget {
  String postionXO_1;
  String postionXO_2;
  String postionXO_3;

  RowOfBottom(
      {required this.postionXO_1,
      required this.postionXO_2,
      required this.postionXO_3});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          XogameBottom(
            titleXO: postionXO_1,
            index: 0,
            onClicked: onPressed,
          ),
          XogameBottom(
            titleXO: postionXO_2,
            index: 1,
            onClicked: onPressed,
          ),
          XogameBottom(
            titleXO: postionXO_3,
            index: 2,
            onClicked: onPressed,
          ),
        ],
      ),
    );
  }

  void onPressed(int index) {}
}
