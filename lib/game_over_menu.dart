import 'package:flappy_among_us/main.dart';
import 'package:flutter/material.dart';

class GameOverMenu extends StatelessWidget {
  const GameOverMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: const Color(0x66ffffff),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white, width: 2)),
          child: IconButton(
            onPressed: () {
              FlappyAmongUs().reset();
              FlappyAmongUs().overlays.clear();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 70,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
