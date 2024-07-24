import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/app_alert_dialog.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/weather.dart';
import 'package:flutter_training/weather_model.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherModel _model = WeatherModel(YumemiWeather());
  Weather? _weather;

  void fetchWeather(BuildContext context) {
    try {
      final weather = _model.fetchWeather();
      setState(() {
        _weather = weather;
      });
    } on Exception catch (e) {
      unawaited(_showAlertDialog(context, e));
    }
  }

  Future<void> _showAlertDialog(BuildContext context, Exception e) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AppAlertDialog(exception: e);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelLarge;

    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: _WeatherImage(weatherType: _weather?.weatherType),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            '${_weather?.minTemperature.toString() ?? '**'} ℃',
                            style: textStyle?.copyWith(color: Colors.blue),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            '${_weather?.maxTemperature.toString() ?? '**'} ℃',
                            style: textStyle?.copyWith(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Close',
                              style: textStyle?.copyWith(color: Colors.blue),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              fetchWeather(context);
                            },
                            child: Text(
                              'Reload',
                              style: textStyle?.copyWith(color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WeatherImage extends StatelessWidget {
  const _WeatherImage({
    WeatherType? weatherType,
  }) : _weatherType = weatherType;
  final WeatherType? _weatherType;

  @override
  Widget build(BuildContext context) {
    final type = _weatherType;

    if (type == null) {
      return const Placeholder();
    }

    return switch (type) {
      WeatherType.sunny => SvgPicture.asset(Assets.icons.sunny),
      WeatherType.cloudy => SvgPicture.asset(Assets.icons.cloudy),
      WeatherType.rainy => SvgPicture.asset(Assets.icons.rainy),
    };
  }
}
