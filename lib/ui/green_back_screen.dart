import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_training/ui/weather_screen.dart';

mixin AfterLayoutMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    unawaited(afterLayout());
  }

  Future<void> afterLayout() async {
    await WidgetsBinding.instance.endOfFrame.then((_) {
      completion();
    });
  }

  Future<void> completion();
}

class GreenBackScreen extends StatefulWidget {
  const GreenBackScreen({super.key});

  @override
  State<GreenBackScreen> createState() => _GreenBackScreenState();
}

class _GreenBackScreenState extends State<GreenBackScreen>
    with AfterLayoutMixin {
  @override
  Future<void> completion() async {
    await _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
    if (mounted) {
      await Navigator.push(
        context,
        MaterialPageRoute<WeatherScreen>(
          builder: (context) => const WeatherScreen(),
        ),
      );
      await _navigate();
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
