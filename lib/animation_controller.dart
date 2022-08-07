import 'dart:math';
import 'package:flutter/material.dart';

class animationController extends StatefulWidget {
  const animationController({Key? key}) : super(key: key);

  @override
  State<animationController> createState() => _animationControllerState();
}

class _animationControllerState extends State<animationController>
    with TickerProviderStateMixin {
  late AnimationController _animationControllerStone;
  late AnimationController _animationControllerPikachu;
  //make another controller for pikachu
  late Animation _moveLRAnimation;
  late Animation _moveUDAnimation;

  @override
  void initState() {
    super.initState();
    _animationControllerStone =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    //_animationController.addListener(()=>setState((){}));
    _animationControllerStone.repeat(reverse: true);
    _moveLRAnimation =
        Tween<double>(begin: -100, end: 100).animate(_animationControllerStone);

    _animationControllerPikachu =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animationControllerPikachu.repeat(
      reverse: true,
    );

    _moveUDAnimation = Tween<double>(begin: 20, end: -100)
        .animate(_animationControllerPikachu);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
            animation: _animationControllerStone,
            builder: (_, Widget? child) {
              return Column(
                children: [
                  Transform.translate(
                    offset: Offset(_moveLRAnimation.value, 150),
                    child: Center(
                      child: Container(
                        child: Image.asset('assets/stone.png'),
                        width: 100,
                        height: 80,
                      ),
                    ),
                  ),
                ],
              );
            }),
        AnimatedBuilder(
            animation: _animationControllerPikachu,
            builder: (_, Widget? child) {
              return Column(
                children: [
                  Transform.translate(
                    offset: Offset(0.0, _moveUDAnimation.value),
                    child: Center(
                      child: Container(
                        child: Image.asset('assets/jump.png'),
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }

  @override
  void dispose() {
    _animationControllerStone.dispose();
    super.dispose();
  }
}
