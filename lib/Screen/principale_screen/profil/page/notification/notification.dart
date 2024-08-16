import 'package:babikiss/Screen/principale_screen/profil/page/notification/notif_detail.dart';
import 'package:babikiss/models/Notification.dart';
import 'package:babikiss/models/data/notification_liste.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotifScreen extends StatelessWidget {
  static String routeName = "/notification";

  const NotifScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: NotifCustom(),
      ),
    );
  }
}

class NotifCustom extends StatelessWidget {
  const NotifCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Triez les notifications par date (la plus récente en premier)
    demoNotif.sort((a, b) => b.dateSend.compareTo(a.dateSend));

    // Créez des groupes de notifications par date
    Map<String, List<MyNotification>> groupedNotifications = {};
    demoNotif.forEach((notification) {
      String formattedDate = _formatDate(notification.dateSend);
      if (!groupedNotifications.containsKey(formattedDate)) {
        groupedNotifications[formattedDate] = [];
      }
      groupedNotifications[formattedDate]!.add(notification);
    });

    return ListView.builder(
      itemCount: groupedNotifications.length,
      itemBuilder: (BuildContext context, int index) {
        String formattedDate = groupedNotifications.keys.elementAt(index);
        List<MyNotification> notifications = groupedNotifications[formattedDate]!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                formattedDate,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationDetailsPage(
                          notifSeclec: notifications[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        notifications[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        notifications[index].message,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    DateTime now = DateTime.now();
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return "Aujourd'hui";
    } else if (date.year == now.year && date.month == now.month && date.day == now.day - 1) {
      return "Hier";
    } else {
      return DateFormat.yMMMMd().format(date);
    }
  }
}
