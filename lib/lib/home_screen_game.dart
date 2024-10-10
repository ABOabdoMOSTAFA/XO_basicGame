import 'package:flutter/material.dart';
import 'package:xo_game_1/lib/Xogame_screen.dart';

class HomeScreenGame extends StatelessWidget {
  static const String routeName = "HomeScreenGame";
  late String p1Name;
  late String p2Name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text) {
                p1Name = text;
                print(text);
              },
              decoration: InputDecoration(
                  labelText: "Player 1 Name",
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text) {
                p2Name = text;
                print(text);
              },
              decoration: InputDecoration(
                  labelText: "Player 2 Name",
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent))),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, XoGameScreen.routeName,
                    arguments: ArgsGame(player_1: p1Name, player_2: p2Name));
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: Text(
                "Game",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
