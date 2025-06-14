import 'dart:convert';

import 'package:get/get.dart';
import 'package:weighttracker/Controller/Stroge.dart';
import 'package:weighttracker/Model/WeightHive.dart';

class Weightcontroller {
  var initial_kg = 0.0.obs;
  var date_picker = DateTime.now().obs;
  RxList<Weighthive> all_weight_info = <Weighthive>[].obs;

  Future<void> save_weight({weight, height}) async {
    var result = await HiveStroge.getHiveStroge(key: "weight_info");
    var weight_list = [];
    weight_list = result ?? [];
    weight_list.add(
      Weighthive(
        id: weight_list.length,
        height: height,
        weight: weight,
        dateTime: date_picker.value,
      ),
    );
    await HiveStroge.saveHiveStroge(key: "weight_info", value: weight_list);
    Get.offNamed("/dashboard");
  }

  Future<void> get_weight({key}) async {
    all_weight_info.clear();
    var result = await HiveStroge.getHiveStroge(key: key);

    for (Weighthive item in result) {
      all_weight_info.add(
        Weighthive(
          id: item.id,
          height: item.height,
          weight: item.weight,
          dateTime: item.dateTime,
        ),
      );
    }
    initial_kg.value = double.parse(all_weight_info.last.weight);
    print(result);
  }
}
