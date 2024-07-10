// ignore_for_file: must_be_immutable

import 'package:babikiss/models/Notification.dart';
import 'package:flutter/material.dart';

class NotificationDetailsPage extends StatefulWidget {
  NotificationDetailsPage({super.key, required this.notifSeclec});

  final MyNotification notifSeclec;

  @override
  State<NotificationDetailsPage> createState() => _NotificationDetailsPageState();
}

class _NotificationDetailsPageState extends State<NotificationDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.notifSeclec.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            widget.notifSeclec.message,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
