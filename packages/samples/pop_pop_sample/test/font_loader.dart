import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Allows loading font files within widget tests.
///
/// Be sure to not declare a [TextStyle.package] value anywhere as this breaks golden tests.
Future<void> loadFontAsset({
  required String fontPath,
  required String fontFamilyName,
}) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final file = File(fontPath);
  debugPrint('Reading file from: ${file.absolute}');
  final bytesSync = file.readAsBytesSync();

  final bytes = Future<ByteData>.value(bytesSync.buffer.asByteData());

  await (FontLoader(fontFamilyName)..addFont(bytes)).load();
}
