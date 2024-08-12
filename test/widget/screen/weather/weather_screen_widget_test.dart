import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_test/flutter_svg_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/domain/weather.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/ui/screen/weather/weather_screen.dart';
import 'package:flutter_training/ui/screen/weather/weather_screen_state.dart';

void main() {
  group('weather_screen ui test', () {
    testWidgets(
        'view should image is placeholder and Label is ** ℃ when state is null',
        (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: ProviderScope(child: WeatherScreen()),
          ),
        ),
      );

      final placeholder = find.byWidgetPredicate((widget) {
        return widget is Placeholder;
      });
      final temperatureLabel = find.text('** ℃');

      expect(placeholder, findsOneWidget);
      expect(temperatureLabel, findsNWidgets(2));
    });
  });
}
