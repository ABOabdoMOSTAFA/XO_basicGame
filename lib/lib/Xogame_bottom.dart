import 'package:flutter/material.dart';

typedef onClick = void Function(int index);

class XogameBottom extends StatelessWidget {
  String titleXO;
  onClick onClicked;
  int index;

  XogameBottom(
      {required this.titleXO, required this.index, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        child: ElevatedButton(
            onPressed: () {
              onClicked(index);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, shape: LinearBorder.bottom()),
            child: Text(
              titleXO,
              style: TextStyle(color: Colors.white, fontSize: 32),
            )),
      ),
    );
  }
}
