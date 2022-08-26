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

  int selectedSkin = 0;

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
          children: [
            const Text(
              "Choose your character",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Cooper-Black",
                  fontSize: 25,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                skinWidget(
                  image: const AssetImage('assets/images/JO_skin.png'),
                  skinIndex: 0,
                ),
                const SizedBox(
                  width: 20,
                ),
                skinWidget(
                  image: const AssetImage('assets/images/PS_skin.png'),
                  skinIndex: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            MaterialButton(
              onPressed: () {
                FlappyAmongUs().prepare(selectedSkin);
                FlappyAmongUs().overlays.clear();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff164D89)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 20),
                  child: Text(
                    "START",
                    style: TextStyle(
                        fontFamily: "Cooper-Black",
                        fontSize: 22,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget skinWidget({required ImageProvider image, required int skinIndex}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSkin = skinIndex;
        });
      },
      child: Container(
        height: screenWidth / 2.5,
        width: screenWidth / 2.5,
        decoration: BoxDecoration(
          color: skinIndex == selectedSkin
              ? const Color(0x55ffffff)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color:
                  skinIndex == selectedSkin ? Colors.white : Colors.transparent,
              width: 3),
          image: DecorationImage(image: image, fit: BoxFit.fitHeight),
        ),
      ),
    );
  }
}
