import 'package:flutter/cupertino.dart';
import 'package:time_dose/models/Drug.dart';
import 'package:time_dose/services/saveLocal.dart';

class DrugData extends ChangeNotifier {
  List<Drug> drugList;

  SaveLocal saveLocal = SaveLocal();

  DrugData() {
    initializeDrugList();
  }

  Future<void> initializeDrugList() async {
    await saveLocal.initSharedPreferences();
    drugList = saveLocal.loadData();
    notifyListeners();
  }

  void addDrug(Drug newDrug) {
    drugList.add(newDrug);
    saveLocal.saveData(drugList);
    notifyListeners();
  }

  int drugCount() {
    return drugList == null ? 0 : drugList.length;
  }

  void deleteDrug(Drug drug) {
    drugList.remove(drug);
    saveLocal.saveData(drugList);
    notifyListeners();
  }
}
