import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pop_pop_sample/infrastructure/database/platform/base_isar.dart';

BaseIsar getIsarPlatform() => const IsarIo();

class IsarIo extends BaseIsar {
  const IsarIo();

  @override
  Future<Isar> init(
    List<CollectionSchema<dynamic>> schemas, {
    bool enableInspector = false,
  }) async {
    final dir = await getApplicationSupportDirectory();
    return Isar.open(
      schemas: schemas,
      directory: dir.path,
      inspector: enableInspector,
    );
  }
}
