import 'package:flame/components.dart' hide Timer;
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_among_us/main_menu.dart';
import 'package:flappy_among_us/score_text.dart';
import 'package:flappy_among_us/pipe_manager.dart';
import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/services.dart';

import 'splash.dart';
import 'player.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(GameWidget(
    game: FlappyAmongUs(),
    initialActiveOverlays: const ["Splash"],
    overlayBuilderMap: {
      "Splash": (_, FlappyAmongUs game) => const Splash(),
      "MainMenu" :(_,FlappyAmongUs game) => const MainMenu(),
      "PauseMenu" : (_, FlappyAmongUs game) => Container(),
    },
  ));
}

late final double screenWidth;
late final double screenHeight;
int highScore = 0;
int score = 0;
double gravity = 2;

class FlappyAmongUs extends FlameGame
    with HasTappableComponents, HasCollisionDetection {

  static final FlappyAmongUs _instance =
  FlappyAmongUs._privateConstructor();

  FlappyAmongUs._privateConstructor();

  factory FlappyAmongUs() {
    return _instance;
  }

  late Player character;
  late PipeManager pipeManager ;
  bool gameOver = false ;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    screenWidth = size[0];
    screenHeight = size[1];

  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    character.jumping();
  }

  Future<void> prepare(int skin) async {

    ParallaxComponent background = await ParallaxComponent.load(
      [ParallaxImageData("background.png")],
      repeat: ImageRepeat.repeat,
      baseVelocity: Vector2(50, 0),
      size: Vector2(screenWidth, screenHeight),
    );
    add(background);

    pipeManager = PipeManager(
        lowerPipeImage: await loadSprite("pipe_up.png"),
    upperPipeImage: await loadSprite("pipe_down.png"),
    );
    add(pipeManager);

    character = Player(
    sprite: skin == 0?await loadSprite("JO_skin.png"):await loadSprite("PL_skin.png"),
    );
    add(character);
    add(ScoreText());


    FlameAudio.bgm.play("song.mp3");
  }

  void pause(){
    pauseEngine();
    FlameAudio.bgm.pause();
  }

  void resume(){
    resumeEngine();
    FlameAudio.bgm.resume();
  }

  void reset(){
    gameOver = false;
    gravity = 2;
    removeAll(children);
    prepare(0);
    timer.reset();
  }

  @override
  void update( double dt){
    super.update(dt);
    if(gameOver){
      if(score>highScore) {
        highScore = score;
      }
      reset();
    }
  }

}