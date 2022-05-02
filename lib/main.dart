import 'package:flutter/material.dart';
import 'package:particle_containers/particle.dart';

void main() {
  runApp(const ParticleContainer());
}

class ParticleContainer extends StatelessWidget {
  const ParticleContainer({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Particle Container',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key,}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>  {

  final List _particles = [];

  void _addParticle() {
    _particles.add(const Particle());
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: const Icon(Icons.add),
        onPressed: () {
          _addParticle();
          setState(() {});
        },
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: _particles.whereType<Widget>().toList(),
        ),
      ),
    );
  }
}
