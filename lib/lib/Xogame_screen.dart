import 'package:flutter/material.dart';

import 'Game_header.dart';
import 'Xogame_bottom.dart';

class XoGameScreen extends StatefulWidget {
  static const String routeName = 'XogameScreen';

  @override
  State<XoGameScreen> createState() => _XoGameScreenState();
}

class _XoGameScreenState extends State<XoGameScreen> {
  int score1 = 0;

  int score2 = 0;

  List<String> boardState = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    ArgsGame? argsGame =
        ModalRoute.of(context)?.settings.arguments as ArgsGame?;
    String player_1 = argsGame?.player_1 ?? "Player_1";
    String player_2 = argsGame?.player_2 ?? "Player_2";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GameHeader(
                    namePlayer: "${player_1} (X)", score: "Score: $score1"),
                GameHeader(
                    namePlayer: "${player_2} (O)", score: "Score: $score2"),
              ],
            ),
          ),
          // RowOfBottom(postionXO_1: boardState[0], postionXO_2: boardState[1], postionXO_3: boardState[2]),
          // RowOfBottom(postionXO_1: boardState[3], postionXO_2: boardState[4], postionXO_3: boardState[5]),
          // RowOfBottom(postionXO_1: boardState[6], postionXO_2: boardState[7], postionXO_3: boardState[8]),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XogameBottom(
                  titleXO: boardState[0],
                  index: 0,
                  onClicked: onPressed,
                ),
                XogameBottom(
                  titleXO: boardState[1],
                  index: 1,
                  onClicked: onPressed,
                ),
                XogameBottom(
                  titleXO: boardState[2],
                  index: 2,
                  onClicked: onPressed,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XogameBottom(
                  titleXO: boardState[3],
                  index: 3,
                  onClicked: onPressed,
                ),
                XogameBottom(
                  titleXO: boardState[4],
                  index: 4,
                  onClicked: onPressed,
                ),
                XogameBottom(
                  titleXO: boardState[5],
                  index: 5,
                  onClicked: onPressed,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XogameBottom(
                  titleXO: boardState[6],
                  index: 6,
                  onClicked: onPressed,
                ),
                XogameBottom(
                  titleXO: boardState[7],
                  index: 7,
                  onClicked: onPressed,
                ),
                XogameBottom(
                  titleXO: boardState[8],
                  index: 8,
                  onClicked: onPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onPressed(int index) {
    print("clicked by bottom $index");
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      boardState[index] = "X";
    } else {
      boardState[index] = "O";
    }
    counter++;
    //checkWinner(boardState[index]);
    if (checkWinner("X")) {
      score1 += 5;
      print("the winner is x");
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          resetGame();
        });
      });
    } else if (checkWinner("O")) {
      score2 += 5;
      print("the winner is o");
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          resetGame();
        });
      });
    } else {
      // draw
      print("no winner ");

      if (counter == 9) {
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            resetGame();
          });
        });
      }
    }

    setState(() {});
  }

  bool checkWinner(String symboly) {
    for (int i = 0; i < boardState.length; i += 3) {
      if (boardState[i] == symboly &&
          boardState[i + 1] == symboly &&
          boardState[i + 2] == symboly) {
        return true;
      } //horizontal
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symboly &&
          boardState[i + 3] == symboly &&
          boardState[i + 6] == symboly) {
        return true;
      } //horizontal
    }
    if (boardState[0] == symboly &&
        boardState[4] == symboly &&
        boardState[8] == symboly) {
      return true;
    }
    if (boardState[2] == symboly &&
        boardState[4] == symboly &&
        boardState[6] == symboly) {
      return true;
    }
    return false;
  }

  void resetGame() {
    boardState = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
  }
}

class ArgsGame {
  String? player_1 = "Player 1";
  String? player_2 = "Player 1";

  ArgsGame({required this.player_1, required this.player_2});
}
