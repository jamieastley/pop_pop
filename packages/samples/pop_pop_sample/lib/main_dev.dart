import 'package:flutter/material.dart';
import 'package:pop_pop_sample/app.dart';
import 'package:pop_pop_sample/core/consts/environment.dart';
import 'package:pop_pop_sample/core/utils/injector.dart';

Future<void> main() async {
  await Injector.init(
    Environment.dev,
    appRunner: () => runApp(const App()),
  );
}
