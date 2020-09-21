import 'package:flutter/cupertino.dart';
import 'package:time_dose/models/Drug.dart';
import 'package:time_dose/services/saveLocal.dart';
import 'package:time_dose/services/notifications.dart';

class DrugData extends ChangeNotifier {
  List<Drug> drugList;

  SaveLocal saveLocal = SaveLocal();
  NotificationPlugin notificationPlugin = NotificationPlugin();

  DrugData() {
    initializeDrugList();
    notificationPlugin.setOnNotificationClick();
  }

  Future<void> initializeDrugList() async {
    await saveLocal.initSharedPreferences();
    drugList = saveLocal.loadData();
    notifyListeners();
  }

  void addDrug(Drug newDrug) async {
    drugList.add(newDrug);
    await notificationPlugin.showNotification();
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
