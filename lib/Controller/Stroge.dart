import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weighttracker/Model/WeightHive.dart';

class HiveStroge {
  static final weightBox = Hive.box("weight_box");

  static Future<void> strogeInitialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(WeighthiveAdapter());
    await Hive.openBox("weight_box");
  }

  static Future<void> saveHiveStroge({key, value}) async {
    weightBox.put(key, value);
  }

  static Future<dynamic> getHiveStroge({key, defaultValue}) async {
    return weightBox.get(key, defaultValue: defaultValue);
  }

  static Future<void> deleteHiveStroge({key}) async {
    weightBox.delete(key);
  }
}
