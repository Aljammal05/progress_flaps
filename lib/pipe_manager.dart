import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_among_us/main.dart';
import 'package:flappy_among_us/pipes.dart';

late Timer timer;

class PipeManager extends PositionComponent {
  Sprite lowerPipeImage;
  Sprite upperPipeImage;
  Random random = Random();

  PipeManager({required this.lowerPipeImage , required this.upperPipeImage}) {
    timer = Timer(2, onTick: () {
      _spawnPipes();
    }, repeat: true);
  }

  void _spawnPipes() {

    double rng = random.nextDouble()*screenHeight*0.75 + screenHeight*0.25;

    Pipe lowerPipe = Pipe(
      sprite: lowerPipeImage,
      anchor: Anchor.topCenter,
      position: Vector2(screenWidth + 200 ,rng),
    );

    Pipe upperPipe = Pipe(
      sprite: upperPipeImage,
      anchor: Anchor.bottomCenter,
      position: Vector2(screenWidth + 200 ,rng- screenHeight*0.25),
    );

    add(upperPipe);
    add(lowerPipe);
  }

  void reset(){
    timer.reset();
    removeAll(children);
    timer.start();
  }

  @override
  void onMount() {
    super.onMount();
    timer.start();
  }

  @override
  void update(double dt) {
    super.update(dt);
    timer.update(dt);
  }
}
