import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/domain/weather.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/ui/component/app_alert_dialog.dart';
import 'package:flutter_training/ui/screen/weather/weather_screen_state.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              Spacer(),
              _WeatherPanel(),
              _ControlPanel(),
            ],
          ),
        ),
      ),
    );
  }
}

class _WeatherPanel extends ConsumerWidget {
  const _WeatherPanel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weatherScreenStateProvider);

    return Column(
      children: [
        _WeatherImage(weatherType: state?.weatherType),
        _TemperatureLabels(
          max: state?.maxTemperature,
          min: state?.minTemperature,
        ),
      ],
    );
  }
}

class _ControlPanel extends ConsumerWidget {
  const _ControlPanel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Row(
            children: [
              _ControlButton(
                'Close',
                () {
                  Navigator.pop(context);
                },
              ),
              _ControlButton(
                'Reload',
                () {
                  try {
                    ref.read(weatherScreenStateProvider.notifier).fetch();
                  } on Exception catch (e) {
                    unawaited(_showAlertDialog(context, e));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
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
      return const AspectRatio(
        aspectRatio: 1,
        child: Placeholder(),
      );
    }
    return AspectRatio(
      aspectRatio: 1,
      child: switch (type) {
        WeatherType.sunny => SvgPicture.asset(Assets.icons.sunny),
        WeatherType.cloudy => SvgPicture.asset(Assets.icons.cloudy),
        WeatherType.rainy => SvgPicture.asset(Assets.icons.rainy),
      },
    );
  }
}

class _TemperatureLabels extends StatelessWidget {
  const _TemperatureLabels({int? max, int? min})
      : _max = max,
        _min = min;

  final int? _max;
  final int? _min;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelLarge;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _TepmeratureLabel(
          text: _min?.toString() ?? '**',
          style: textStyle?.copyWith(color: Colors.blue),
        ),
        _TepmeratureLabel(
          text: _max?.toString() ?? '**',
          style: textStyle?.copyWith(color: Colors.red),
        ),
      ],
    );
  }
}

class _TepmeratureLabel extends StatelessWidget {
  const _TepmeratureLabel({required String text, TextStyle? style})
      : _text = text,
        _style = style;

  final String _text;
  final TextStyle? _style;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          '$_text ℃',
          style: _style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  const _ControlButton(String text, VoidCallback? onPressed)
      : _text = text,
        _onPressed = onPressed;

  final String _text;
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelLarge;
    return Expanded(
      child: TextButton(
        onPressed: _onPressed,
        child: Text(
          _text,
          style: textStyle?.copyWith(color: Colors.blue),
        ),
      ),
    );
  }
}
