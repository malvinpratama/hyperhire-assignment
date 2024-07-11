import 'package:drift/drift.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class SettingsRepository {
  SettingsRepository(DatabaseService databaseService)
      : _db = databaseService,
        super();

  final DatabaseService _db;

  Future<SettingData?> getSettingByKey(String key) async {
    return await (_db.select(_db.setting)
          ..where((tbl) => tbl.key.equals(key))
          ..limit(1))
        .get()
        .then(
      (result) {
        if (result.isNotEmpty) {
          return result[0];
        } else {
          return null;
        }
      },
    );
  }

  Future<TransactionDbModel> updateSettingByKey(
      String key, String value) async {
    return await (_db.update(_db.setting)..where((tbl) => tbl.key.equals(key)))
        .write(SettingCompanion(value: Value(value)))
        .then(
      (value) {
        return TransactionDbModel(model: this, isSuccess: true, error: '');
      },
    ).catchError((e) {
      return TransactionDbModel(
          model: this, isSuccess: false, error: e.toString());
    });
  }
}
