import 'package:drift/drift.dart';
import '../models/models.dart';
part 'database_service.g.dart';

@DriftDatabase(tables: [Setting])
class DatabaseService extends _$DatabaseService {
  DatabaseService(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await into(setting)
            .insert(SettingCompanion.insert(key: 'first_time', value: '1'));
      },
    );
  }
}
