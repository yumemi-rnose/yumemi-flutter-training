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
    await WidgetsBinding.instance.endOfFrame.then((_) {
      // 0.5秒後遅延実行
      Future.delayed(
        const Duration(milliseconds: 500),
        () => {
          if (mounted)
            {
              _navigate(),
            },
        },
      );
    });
  }

  Future<void> _navigate() async {
    await Navigator.push(
      context,
      MaterialPageRoute<WeatherScreen>(
        builder: (context) => const WeatherScreen(),
      ),
    );
    await navigate();
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
