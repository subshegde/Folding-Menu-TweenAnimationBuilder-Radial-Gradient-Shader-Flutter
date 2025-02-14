import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen'),),
      backgroundColor: Colors.white,
      body: const SafeArea(child: Column(children: [],)),
    );
  }
}