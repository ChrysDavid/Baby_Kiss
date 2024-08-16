import 'package:babikiss/models/Notification.dart';

List<MyNotification> demoNotif = [
      MyNotification(
        title: "Notification 1",
        message: "Ceci est la notification 1.",
        dateSend: DateTime.now(),
      ),
      MyNotification(
        title: "Notification 1",
        message: "Ceci est la notification 1.",
        dateSend: DateTime.now(),
      ),
      
      MyNotification(
        title: "Notification 2",
        message: "Ceci est la notification 2.",
        dateSend: DateTime.now().subtract(Duration(days: 1)),
      ),
      MyNotification(
        title: "Notification 2",
        message: "Ceci est la notification 2.",
        dateSend: DateTime.now().subtract(Duration(days: 1)),

      ),
      MyNotification(
        title: "Notification 2",
        message: "Ceci est la notification 2.",
        dateSend: DateTime.now().subtract(Duration(days: 1)),
      ),

      MyNotification(
        title: "Notification 2",
        message: "Ceci est la notification 2.",
        dateSend: DateTime.now().subtract(Duration(days: 2)),
      ),
      MyNotification(
        title: "Notification 2",
        message: "Ceci est la notification 2.",
        dateSend: DateTime.now().subtract(Duration(days: 2)),
      ),
      MyNotification(
        title: "Notification 2",
        message: "Ceci est la notification 2.",
        dateSend: DateTime.now().subtract(Duration(days: 3)),
      ),
    ];