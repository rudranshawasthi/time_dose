import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_dose/models/Drug.dart';

class SaveLocal {
  SharedPreferences sharedPreferences;

  void initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveData(List<Drug> drugList) {
    List<String> stringList =
        drugList.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList('list', stringList);
  }

  List<Drug> loadData() {
    List<String> listString = sharedPreferences.getStringList('list');
    List<Drug> drugList = [];
    if (listString != null) {
      drugList =
          listString.map((item) => Drug.fromMap(json.decode(item))).toList();
    }
    return drugList;
  }
}
