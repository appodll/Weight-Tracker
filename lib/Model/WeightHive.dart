import 'dart:ffi';

import 'package:hive/hive.dart';

part 'WeightHive.g.dart';

@HiveType(typeId: 0)
class Weighthive extends HiveObject {

  @HiveField(0)
  int id;

  @HiveField(1)
  String height;

  @HiveField(2)
  String weight;

  @HiveField(3)
  DateTime? dateTime;

  Weighthive({required this.id, required this.height, required this.weight,required this.dateTime});
}
