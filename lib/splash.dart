import 'dart:async';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        FlappyAmongUs().overlays.add("MainMenu");
        FlappyAmongUs().mainMenuMusic(false);
        setState(() => isVisibleScreen = false);
      },
    );

    Timer(
      const Duration(milliseconds: 500),
      () => setState(() => isVisibleLogo = !isVisibleLogo),
    );
    Timer(
      const Duration(milliseconds: 1400),
      () => setState(() => isVisibleLogoTitle = !isVisibleLogoTitle),
    );
    Timer(
      const Duration(milliseconds: 2000),
      () => setState(() => isVisibleText = !isVisibleText),
    );
  }

  bool isVisibleScreen = true;
  bool isVisibleLogo = false;
  bool isVisibleLogoTitle = false;
  bool isVisibleText = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: AnimatedOpacity(
          opacity: isVisibleScreen ? 1.0 : 0.0,
          duration: const Duration(seconds: 2),
          child: Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: .9,
                center: Alignment.center,
                colors: [Colors.grey.shade700, Colors.black],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  AnimatedOpacity(
                    opacity: isVisibleLogo ? 1.0 : 0.0,
                    duration: const Duration(seconds: 2),
                    child: Container(
                      height: 280,
                      width: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/JO_skin.png'),
                        ),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: isVisibleLogoTitle ? 1.0 : 0.0,
                    duration: const Duration(seconds: 2),
                    child: Container(
                      height: 100,
                      width: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/progress_flaps.png'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  AnimatedOpacity(
                    opacity: isVisibleText ? 1.0 : 0.0,
                    duration: const Duration(seconds: 2),
                    child: const Text(
                      "Developed By : \nFaris Ansara\nAbdelrahman Aljammal",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Cooper-Black",
                        fontSize: 18,
                        color: Color(0xff808594),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
