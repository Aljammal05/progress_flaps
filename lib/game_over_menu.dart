import 'package:flappy_among_us/main.dart';
import 'package:flutter/material.dart';

bool mainMenu = false;

class GameOverMenu extends StatelessWidget {
  GameOverMenu({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: const Color(0x66ffffff),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white, width: 2)
                ),
                child: IconButton(
                  onPressed: () {
                    mainMenu = true;
                    FlappyAmongUs().overlays.add("MainMenu");
                  },
                  icon: const Icon(
                    Icons.home_filled,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
