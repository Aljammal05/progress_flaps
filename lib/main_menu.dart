import 'dart:async';

import 'package:flappy_among_us/main.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  bool vis = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 2000), () => setState(() => vis = true));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: vis ? 1.0 : 0.0,
      duration: const Duration(seconds: 2),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fitHeight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            const Text(
              "Choose your character",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Cooper-Black",
                  fontSize: 25,
                  color: Colors.white),
            ),
            TextButton(onPressed: (){
              FlappyAmongUs().prepare(0);
              FlappyAmongUs().overlays.clear();
            }, child: Text("go"),)
          ],
        ),
      ),
    );
  }
}
