import 'dart:math';

import 'package:flutter/material.dart';

class Particle extends StatefulWidget {
  const Particle({Key? key}) : super(key: key);

  @override
  State<Particle> createState() => _ParticleState();
}

class _ParticleState extends State<Particle> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;
  late Color _randomColor;
  final _random = Random();

  List<Alignment> alignments = [
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.topLeft,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
  ];

  @override
  void initState() {
    super.initState();

    _randomColor = Color.fromARGB(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256)
    );

    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);

    animation = Tween<double>(begin: 0, end: 300).animate(controller)..addStatusListener((status) => print('$status'));
    controller.forward();
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(  // Transform widget
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // perspective
        ..rotateX(Offset(_random.nextDouble(), _random.nextDouble()).dy)
        ..rotateY(Offset(_random.nextDouble(), _random.nextDouble()).dx),
      alignment: FractionalOffset.center,
      child: RotationTransition(
        turns: controller,
        child: Align(
          alignment: alignments[_random.nextInt(8)],
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              color: _randomColor
            ),
            height: 20.0,
            width: 20.0,
          ),
        ),
      ),
    );
  }
}

