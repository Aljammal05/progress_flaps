import 'dart:async';
import 'package:flappy_among_us/camera.dart';
import 'package:flappy_among_us/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

int selectedSkin = 0;
int selectedPipeSkin = 0;
bool bgMusic = true;

class _MainMenuState extends State<MainMenu> {
  bool vis = false;
  Icon? icon;

  Future<void> savePrefs(bool _bgMusic) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("bgMusic", _bgMusic);
    setState(() {
      bgMusic = _bgMusic;
    });
  }

  Future<void> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bgMusic = prefs.getBool("bgMusic") ?? true;
    setState(() {});
    print(bgMusic.toString());
    if (bgMusic) {
      icon = Icon(Icons.music_off);
    } else {
      icon = Icon(Icons.music_note);
    }
  }

  final ButtonStyle style = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      )));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 1000), () => setState(() => vis = true));
    bgMusic;
    getSharedPrefs();
    FlappyAmongUs().mainMenuMusic(false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: vis ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1000),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fitHeight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: style,
                    onPressed: () {
                        FlappyAmongUs().overlays.add("FaceRecognition");
                      },
                      child: const Icon(Icons.add)),
                ElevatedButton(
                    style: style,
                    onPressed: () {
                      if (bgMusic!) {
                        setState(() {
                          bgMusic = false;
                          icon = Icon(Icons.music_note);
                          savePrefs(bgMusic!);
                        });
                        FlappyAmongUs().mainMenuMusic(false);
                      } else {
                        setState(() {
                          bgMusic = true;
                          icon = Icon(Icons.music_off);
                          savePrefs(bgMusic!);
                        });
                        FlappyAmongUs().mainMenuMusic(false);
                      }
                    },
                    child: icon)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: const Color(0xdd333333),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
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
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            skinWidget(
                              image: const AssetImage(
                                  'assets/images/anas_skin.png'),
                              skinIndex: 0,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            skinWidget(
                              image: const AssetImage(
                                  'assets/images/issa_skin.png'),
                              skinIndex: 1,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            skinWidget(
                              image:
                                  const AssetImage('assets/images/JO_skin.png'),
                              skinIndex: 2,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            skinWidget(
                              image:
                                  const AssetImage('assets/images/PS_skin.png'),
                              skinIndex: 3,
                            ),
                            skinWidget(
                              image: const AssetImage(
                                  'assets/images/abood_skin.png'),
                              skinIndex: 4,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            skinWidget(
                              image: const AssetImage(
                                  'assets/images/samir_skin.png'),
                              skinIndex: 5,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            skinWidget(
                              image: const AssetImage(
                                  'assets/images/sabanekh_skin.png'),
                              skinIndex: 6,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: const Color(0xdd333333),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      const Text(
                        "Choose your pipe skin",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Cooper-Black",
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            pipeSkinWidget(
                                image: const AssetImage(
                                    'assets/images/green_pipe.png'),
                                pipeSkinIndex: 0,
                                unlockScore: 0),
                            const SizedBox(
                              width: 20,
                            ),
                            pipeSkinWidget(
                                image: const AssetImage(
                                    'assets/images/silver_pipe.png'),
                                pipeSkinIndex: 1,
                                unlockScore: 0),
                            const SizedBox(
                              width: 20,
                            ),
                            pipeSkinWidget(
                                image: const AssetImage(
                                    'assets/images/gold_pipe.png'),
                                pipeSkinIndex: 2,
                                unlockScore: 1000),
                            const SizedBox(
                              width: 20,
                            ),
                            pipeSkinWidget(
                                image: const AssetImage(
                                    'assets/images/neon_pipe.png'),
                                pipeSkinIndex: 3,
                                unlockScore: 2500),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            MaterialButton(
              onPressed: () {
                FlappyAmongUs().overlays.clear();
                FlappyAmongUs().prepare(selectedSkin, selectedPipeSkin);
                FlappyAmongUs().resume();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff164D89)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
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
        height: 150,
        width: 150,
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

  Widget pipeSkinWidget(
      {required ImageProvider image,
      required int pipeSkinIndex,
      required int unlockScore}) {
    return GestureDetector(
      onTap: () {
        if (unlockScore <= highScore!) {
          setState(() {
            selectedPipeSkin = pipeSkinIndex;
          });
        }
      },
      child: Stack(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: const Color(0x55ffffff),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: pipeSkinIndex == selectedPipeSkin
                      ? Colors.white
                      : Colors.transparent,
                  width: 3),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Image(
                image: image,
              ),
            ),
          ),
          unlockScore > highScore!
              ? Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: const Color(0x55000000),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.lock,
                        size: 70,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "score $unlockScore \nto unlock",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: "Cooper-Black",
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
