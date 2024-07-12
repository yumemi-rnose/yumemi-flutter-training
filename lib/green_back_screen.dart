import 'package:flutter/material.dart';

class GreenBackScreen extends StatefulWidget {
  const GreenBackScreen({super.key});

  @override
  State<GreenBackScreen> createState() => _GreenBackScreenState();
}

class _GreenBackScreenState extends State<GreenBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.green,),
    );
  }
}
