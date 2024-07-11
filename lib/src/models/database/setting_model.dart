import 'package:drift/drift.dart';

class Setting extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
}

// class SettingModel {
//   static const kTableName = 'setting';

//   SettingModel({
//     required this.key,
//     required this.value,
//   });

//   final String key;
//   final String value;

//   factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
//         key: json['key'],
//         value: json['value'],
//       );

//   Map<String, dynamic> toJson() => {
//         'key': key,
//         'value': value,
//       };

//   Future<TransactionDbModel<SettingModel>> save() async {
//     try {
//       final data = toJson();
//       final database = await DatabaseService.database;

//       await database.insert(
//         SettingModel.kTableName,
//         data,
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//       return TransactionDbModel(model: this, isSuccess: true, error: '');
//     } catch (e) {
//       return TransactionDbModel(
//           model: this, isSuccess: false, error: e.toString());
//     }
//   }

//   Future<TransactionDbModel<SettingModel>> update() async {
//     try {
//       final data = toJson();
//       final database = await DatabaseService.database;

//       await database.update(
//         SettingModel.kTableName,
//         data,
//         where: 'key = ?',
//         whereArgs: [key],
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//       return TransactionDbModel(model: this, isSuccess: true, error: '');
//     } catch (e) {
//       return TransactionDbModel(
//           model: this, isSuccess: false, error: e.toString());
//     }
//   }
// }
