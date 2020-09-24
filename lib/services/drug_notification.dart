import 'package:time_dose/models/Drug.dart';
import 'notifications_plugin.dart';

class DrugNotification {
  NotificationPlugin notificationPlugin;

  DrugNotification() {
    notificationPlugin = NotificationPlugin();
    notificationPlugin.setOnNotificationClick();
  }

  void addDrugNotification(Drug drug) async {
    int index = drug.notifId;
    if (drug.morning)
      notificationPlugin.morningNotification(drug.name, index++);
    if (drug.afternoon)
      notificationPlugin.afternoonNotification(drug.name, index++);
    if (drug.evening)
      notificationPlugin.eveningNotification(drug.name, index++);
    if (drug.night) notificationPlugin.nightNotification(drug.name, index++);
  }

  void cancelDrugNotification(Drug drug) async {
    int index = drug.notifId;
    if (drug.morning) notificationPlugin.cancelNotification(index++);
    if (drug.afternoon) notificationPlugin.cancelNotification(index++);
    if (drug.evening) notificationPlugin.cancelNotification(index++);
    if (drug.night) notificationPlugin.cancelNotification(index);
  }
}
