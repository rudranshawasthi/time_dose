import 'package:flutter/cupertino.dart';
import 'package:time_dose/models/Drug.dart';
import 'package:time_dose/services/drug_notification.dart';
import 'package:time_dose/services/saveLocal.dart';

class DrugData extends ChangeNotifier {
  List<Drug> drugList;
  int count;

  SaveLocal saveLocal = SaveLocal();
  DrugNotification drugNotification;

  DrugData() {
    initializeDrugList();
    drugNotification = DrugNotification();
  }

  Future<void> initializeDrugList() async {
    await saveLocal.initSharedPreferences();
    drugNotification.pendingNotif();
    drugList = saveLocal.loadData();
    if (drugList.length == 0) {
      count = 0;
    } else {
      count = saveLocal.loadCount();
    }
    notifyListeners();
  }

  void addDrug(Drug newDrug) async {
    count += 4;
    newDrug.notifId = count;
    drugNotification.addDrugNotification(newDrug);
    drugList.add(newDrug);
    saveLocal.saveData(drugList);
    saveLocal.saveCount(count);
    notifyListeners();
  }

  int drugCount() {
    return drugList == null ? 0 : drugList.length;
  }

  void deleteDrug(Drug drug) {
    drugNotification.cancelDrugNotification(drug);
    drugList.remove(drug);
    saveLocal.saveData(drugList);
    notifyListeners();
  }
}
