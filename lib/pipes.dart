import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_among_us/main.dart';
import 'package:flutter/material.dart';


class Pipe extends SpriteComponent {
  Pipe(
      {required sprite,required Anchor anchor , required position}){
    super.sprite = sprite;
    super.anchor = anchor;
    super.position = position;
    super.size = Vector2(40, screenHeight);
  }

  @override
  Future<void> onLoad() async {
    final defaultPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke;
    ShapeHitbox hitBox = RectangleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitBox);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(!isVisible) {
      removeFromParent();
    }
    position += Vector2(-dt*150, 0);

  }

  bool get isVisible {
    return x + width > 0;
  }

}
