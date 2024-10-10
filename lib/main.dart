import 'package:flutter/material.dart';
import 'package:xo_game_1/lib/home_screen_game.dart';

import 'lib/Xogame_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        XoGameScreen.routeName: (context) => XoGameScreen(),
        HomeScreenGame.routeName: (context) => HomeScreenGame()
      },
      initialRoute: XoGameScreen.routeName,
    );
  }
}
