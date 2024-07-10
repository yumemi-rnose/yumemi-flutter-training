import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/weather_model.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherModel _model = WeatherModel(YumemiWeather());
  WeatherType _weatherType = WeatherType.none;

  void updateWeatherType() {
    setState(() {
      _weatherType = _model.fetchCondition();
    });
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
                      child: _WeatherImage(weatherType: _weatherType),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              '** ℃',
                              style: textStyle?.copyWith(color: Colors.blue),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              '** ℃',
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
                              onPressed: () { },
                              child: Text(
                                'Close',
                                style: textStyle?.copyWith(color: Colors.blue),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () => { updateWeatherType() },
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
  const _WeatherImage({required this.weatherType});
  final WeatherType weatherType;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<WeatherType>('weatherType', weatherType),
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (weatherType) {
      WeatherType.none => const Placeholder(),
      WeatherType.sunny => SvgPicture.asset(Assets.icons.sunny),
      WeatherType.cloudy => SvgPicture.asset(Assets.icons.cloudy),
      WeatherType.rainy => SvgPicture.asset(Assets.icons.rainy),
    };
  }
}
