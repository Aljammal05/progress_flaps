import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_among_us/main.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class InsultScreen extends StatefulWidget {
  const InsultScreen({Key? key}) : super(key: key);

  @override
  State<InsultScreen> createState() => _InsultScreenState();
}

class _InsultScreenState extends State<InsultScreen> {
  bool isTapped = false;
  late AudioPool dontTry, alfadi;

  @override
  void initState() {
    super.initState();
    _audioInit();
    Future.delayed(
      const Duration(milliseconds: 2),
      () => _updateSize(),
    );
    Future.delayed(
      const Duration(milliseconds: 600),
      () {
        if(FlappyAmongUs().hasSupportVibrate){
         Future.delayed(Duration(milliseconds: 200),(){
           Vibration.vibrate(duration: 150,amplitude: 255);
         });

        }
        FlappyAmongUs().stamp.start();
      },
    );
    Future.delayed(
      const Duration(milliseconds: 1200),
      () => score > 500 ? dontTry.start() : alfadi.start(),
    );

    Future.delayed(const Duration(seconds: 3), () {
      FlappyAmongUs().overlays.add("GameOverMenu");
    });
  }

  _updateSize() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  _audioInit() async {
    dontTry = await FlameAudio.createPool(
      'sfx/dont_try.mp3',
      minPlayers: 1,
      maxPlayers: 1,
    );
    alfadi = await FlameAudio.createPool(
      'sfx/3lfadi.mp3',
      minPlayers: 1,
      maxPlayers: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: screenHeight / 2 - screenWidth * 0.425,
        left: screenWidth / 2 - screenWidth * 0.425,
        child: Center(
          child: AnimatedContainer(
            height: isTapped ? screenWidth * 0.85 : screenWidth * 4,
            width: isTapped ? screenWidth * 0.85 : screenWidth * 4,
            duration: const Duration(seconds: 1),
            curve: Curves.elasticInOut,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/${(score > 500) ? 'لا تحاول' : 'عالفاظي'}.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
