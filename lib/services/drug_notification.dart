import 'package:time_dose/models/Drug.dart';
import 'notifications_plugin.dart';

class DrugNotification {
  NotificationPlugin notificationPlugin;

  DrugNotification() {
    notificationPlugin = NotificationPlugin();
    notificationPlugin.setOnNotificationClick();
  }

  void addDrugNotification(Drug drug) async {
    if (drug.morning) notificationPlugin.morningNotification(drug.name);
    if (drug.afternoon) notificationPlugin.afternoonNotification(drug.name);
    if (drug.evening) notificationPlugin.eveningNotification(drug.name);
    if (drug.night) notificationPlugin.nightNotification(drug.name);
    print(await notificationPlugin.getPendingNotificationCount());
  }
}
