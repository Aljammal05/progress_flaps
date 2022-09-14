import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappy_among_us/main.dart';
import 'package:flutter/material.dart';

class Player extends SpriteComponent with CollisionCallbacks {
  Player({required sprite}) {
    super.anchor = Anchor.center;
    super.position = Vector2(screenWidth / 3, screenHeight / 2);
    super.sprite = sprite;
    super.size = Vector2(60, 50);
    super.angle = 0;
  }

  @override
  Future<void> onLoad() async {
    final defaultPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke;
    ShapeHitbox hitBox = CircleHitbox(
      radius: 15,
      anchor: Anchor.center,
      position: Vector2(width / 2, height / 2),
    )
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitBox);
  }

  void falling(double dt) {
    if (y < screenHeight - height * 0.75) {
      add(MoveEffect.by(
          Vector2(0, gravity), EffectController(duration: 0.0001)));
      gravity += 0.1;
      angle += dt;
    }
  }

  void jumping() {
    if (y > 100 + height * 0.75) {
      add(MoveEffect.by(Vector2(0, -100), EffectController(duration: 0.2)));
      add(RotateEffect.to(
        -0.9,
        EffectController(
          duration: .2,
          infinite: false,
        ),
      ));
    }
    gravity = 2;
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Falling
    falling(dt);
  }

  void reset() {
    position = Vector2(screenWidth / 3, screenHeight / 2);
    angle = 0;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    FlappyAmongUs().gameOver = true;
  }
}
