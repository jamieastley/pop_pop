import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pop_pop_sample/core/ui/app_theme.dart';
import 'package:pop_pop_sample/core/utils/app_config.dart';
import 'package:pop_pop_sample/pages/menu.dart';

import '../mocks/mock_app_config.dart';

void main() {
  final mockConfig = MockAppConfig();
  late final DeviceBuilder builder;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        widget: _MaterialWrapper(
          themeData: AppTheme.lightTheme,
          child: const Menu(),
        ),
        name: 'Menu - light',
      )
      ..addScenario(
        widget: _MaterialWrapper(
          themeData: AppTheme.darkTheme,
          child: const Menu(),
        ),
        name: 'Menu - dark',
      );
  });

  setUp(() async {
    when(() => mockConfig.appVersion).thenReturn('1.0.0');
    when(() => mockConfig.isGameConfigEnabled).thenReturn(false);
    when(() => mockConfig.isHighScoreEnabled).thenReturn(false);
    GetIt.I.registerSingleton<AppConfig>(mockConfig);

    await loadAppFonts();
  });

  tearDown(() {
    GetIt.I.reset();
    reset(mockConfig);
  });

  group('Menu page:', () {
    group('(default config)', () {
      testWidgets('Verify expected widgets are found', (tester) async {
        await tester.pumpWidget(_MaterialWrapper(
          themeData: AppTheme.lightTheme,
          child: const Menu(),
        ));

        expect(find.byKey(const Key('pop_pop_title')), findsOneWidget);
        expect(find.byKey(const Key('play_button')), findsOneWidget);
        expect(find.byKey(const Key('high_scores_button')), findsNothing);
        expect(find.byKey(const Key('bubble_image')), findsNWidgets(2));
        expect(find.text('1.0.0'), findsOneWidget);
      });

      testGoldens('Verify menu goldens', (tester) async {
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(tester, 'menu_multiple_devices');
      });
    });

    group('(features enabled)', () {
      setUp(() {
        when(() => mockConfig.isHighScoreEnabled).thenReturn(true);
      });

      testWidgets('Verify expected widgets are found', (tester) async {
        await tester.pumpWidget(_MaterialWrapper(
          themeData: AppTheme.lightTheme,
          child: const Menu(),
        ));

        expect(find.byKey(const Key('pop_pop_title')), findsOneWidget);
        expect(find.byKey(const Key('play_button')), findsOneWidget);
        expect(find.byKey(const Key('high_scores_button')), findsOneWidget);
        expect(find.byKey(const Key('bubble_image')), findsNWidgets(2));
      });

      testGoldens('Verify menu goldens', (tester) async {
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(
            tester, 'menu_multiple_devices_features_enabled');
      });
    });
  });
}

class _MaterialWrapper extends StatelessWidget {
  final ThemeData themeData;
  final Widget child;

  const _MaterialWrapper({
    required this.themeData,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: child,
      );
}
