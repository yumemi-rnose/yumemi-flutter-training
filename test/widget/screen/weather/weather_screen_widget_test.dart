import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_test/flutter_svg_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/domain/app_exceptions.dart';
import 'package:flutter_training/domain/weather.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/ui/component/app_alert_dialog.dart';
import 'package:flutter_training/ui/screen/weather/weather_screen.dart';
import 'package:flutter_training/ui/screen/weather/weather_screen_state.dart';

void setUp(WidgetTester tester) {
  tester.view.devicePixelRatio = 1.0;
  tester.view.physicalSize = const Size(1080, 2220);
}

void resetSize(WidgetTester tester) {
  tester.view.resetPhysicalSize();
  tester.view.resetDevicePixelRatio();
}

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

    final testData = {
      'sunny': Weather(
        weatherType: WeatherType.sunny,
        maxTemperature: 10,
        minTemperature: 0,
      ),
      'cloudy': Weather(
        weatherType: WeatherType.cloudy,
        maxTemperature: 10,
        minTemperature: 0,
      ),
      'rainy': Weather(
        weatherType: WeatherType.rainy,
        maxTemperature: 10,
        minTemperature: 0,
      ),
    };
    testData.forEach((key, value) {
      testWidgets('view should display image $key when weather type is $key',
          (tester) async {
        setUp(tester);
        final state = MockWeatherScreenState(weather: value);

        // ウィジェットをリフレッシュ
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              weatherScreenStateProvider.overrideWith(() => state),
            ],
            child: const MaterialApp(
              home: ProviderScope(child: WeatherScreen()),
            ),
          ),
        );

        await tester.tap(find.byKey(const Key('Reload')));
        await tester.pumpAndSettle();

        final path = switch (value.weatherType) {
          WeatherType.sunny => Assets.icons.sunny,
          WeatherType.cloudy => Assets.icons.cloudy,
          WeatherType.rainy => Assets.icons.rainy,
        };
        final asset = SvgPicture.asset(path);
        expect(find.svg(asset.bytesLoader), findsOneWidget);

        // 最高気温
        expect(find.text('10 ℃'), findsOneWidget);
        // 最低気温
        expect(find.text('0 ℃'), findsOneWidget);
        addTearDown(() => resetSize(tester));
      });
    });
    testWidgets('view should display alert dialog when fetch is exception',
        (tester) async {
      setUp(tester);

      final state = MockExceptionThrowableWeatherScreenState();
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            weatherScreenStateProvider.overrideWith(() => state),
          ],
          child: const MaterialApp(
            home: ProviderScope(child: WeatherScreen()),
          ),
        ),
      );

      await tester.tap(find.byKey(const Key('Reload')));
      await tester.pumpAndSettle();

      expect(find.byKey(alertDialogKey), findsOneWidget);
      expect(find.text('WeatherUnknownException'), findsOneWidget);
      addTearDown(() => resetSize(tester));
    });
  });
}

class MockWeatherScreenState extends WeatherScreenState {
  MockWeatherScreenState({required Weather weather})
      : _weather = weather,
        super();

  final Weather _weather;

  @override
  Weather? build() {
    return null;
  }

  @override
  void fetch() {
    state = _weather;
  }
}

class MockExceptionThrowableWeatherScreenState extends WeatherScreenState {
  MockExceptionThrowableWeatherScreenState() : super();

  @override
  Weather? build() {
    return null;
  }

  @override
  void fetch() {
    throw WeatherUnknownException();
  }
}
