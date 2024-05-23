import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class ReminderModel extends ChangeNotifier {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  String _selectedDay = 'Monday';
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedActivity = 'Wake up';

  final List<String> daysOfWeek = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];

  final List<String> activities = [
    'Wake up', 'Go to gym', 'Breakfast', 'Meetings', 'Lunch', 'Quick nap', 'Go to library', 'Dinner', 'Go to sleep'
  ];

  ReminderModel() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  String get selectedDay => _selectedDay;
  TimeOfDay get selectedTime => _selectedTime;
  String get selectedActivity => _selectedActivity;

  void setSelectedDay(String day) {
    _selectedDay = day;
    notifyListeners();
  }

  void setSelectedTime(TimeOfDay time) {
    _selectedTime = time;
    notifyListeners();
  }

  void setSelectedActivity(String activity) {
    _selectedActivity = activity;
    notifyListeners();
  }

  Future<void> scheduleNotification() async {
    if (_selectedDay.isNotEmpty && _selectedTime != null && _selectedActivity.isNotEmpty) {
      final now = DateTime.now();
      final scheduledTime = DateTime(now.year, now.month, now.day, _selectedTime.hour, _selectedTime.minute);
      
      var androidDetails = const AndroidNotificationDetails(
        'channelId',
        'channelName',
        channelDescription: 'channelDescription',
        importance: Importance.high,
        playSound: true,
      );

      var scheduledTimeZone = tz.TZDateTime.from(scheduledTime, tz.local);

      var notificationDetails = NotificationDetails(android: androidDetails);

      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Reminder',
        'Time for $_selectedActivity',
        scheduledTimeZone,
        notificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }

  Future<List<PendingNotificationRequest>> getScheduledNotifications() async {
    return await flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }
}
