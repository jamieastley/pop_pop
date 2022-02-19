import 'package:isar/isar.dart';
import 'package:pop_pop_sample/infrastructure/database/platform/isar_platform.dart';

abstract class BaseIsar implements IsarPlatform {
  const BaseIsar();

  @override
  Future<Isar> init(
    List<CollectionSchema<dynamic>> schemas, {
    bool enableInspector = false,
  });
}
