import 'package:isar/isar.dart';
import 'package:pop_pop_sample/infrastructure/database/platform/isar_stub.dart'
    if (dart.library.io) 'package:pop_pop_sample/infrastructure/database/platform/isar_io.dart'
    if (dart.library.html) 'package:pop_pop_sample/infrastructure/database/platform/isar_web.dart';

abstract class IsarPlatform {
  Future<Isar> init(
    List<CollectionSchema<dynamic>> schemas, {
    bool enableInspector = false,
  });

  factory IsarPlatform() => getIsarPlatform();
}
