import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_training/weather_screen.dart';

class GreenBackScreen extends StatefulWidget {
  const GreenBackScreen({super.key});

  @override
  State<GreenBackScreen> createState() => _GreenBackScreenState();
}

class _GreenBackScreenState extends State<GreenBackScreen> {
  @override
  void initState() {
    super.initState();
    unawaited(navigate());
  }

  Future<void> navigate() async {
    await WidgetsBinding.instance.endOfFrame;
    await Future.delayed(const Duration(milliseconds: 500), () {});
    if (mounted) {
      await Navigator.push(
        context,
        MaterialPageRoute<WeatherScreen>(
          builder: (context) => const WeatherScreen(),
        ),
      );
      await navigate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
