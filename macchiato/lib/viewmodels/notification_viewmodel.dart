import 'package:flutter/material.dart';

class NotificationViewModel extends ChangeNotifier {
  int _notificationCount = 0;

  int get notificationCount => _notificationCount;

  void setNotificationCount(int count) {
    _notificationCount = count;
    notifyListeners();
  }

  void incrementNotificationCount() {
    _notificationCount++;
    notifyListeners();
  }

  void clearNotifications() {
    _notificationCount = 0;
    notifyListeners();
  }
}
