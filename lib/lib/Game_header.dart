import 'package:flutter/material.dart';

class GameHeader extends StatelessWidget {
  String namePlayer;

  String score;

  GameHeader({required this.namePlayer, required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          namePlayer,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        Text(
          score,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ],
    );
  }
}
