import 'package:flappy_among_us/main.dart';
import 'package:flutter/material.dart';


class GameOverMenu extends StatelessWidget {
  const GameOverMenu({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: const Color(0xff333333),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Score : $score",style: const TextStyle(
                    fontFamily: "Cooper-Black",
                    fontSize: 25,
                    color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("High Score : $highScore",style: const TextStyle(
                    fontFamily: "Cooper-Black",
                    fontSize: 25,
                    color: Colors.white),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
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
                    const SizedBox(width: 15,),
                    Material(
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
                  ],
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
