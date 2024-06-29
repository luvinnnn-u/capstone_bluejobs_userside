import 'package:bluejobs_user/styles/textstyle.dart';
import 'package:flutter/material.dart';
//mport 'package:bluejobs_user/styles/customtextstyle.dart'; // Updated import based on your class name

class NotificationItem {
  final String message;
  final DateTime date;

  NotificationItem({required this.message, required this.date});
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<NotificationItem> notifications = [
    NotificationItem(
      message: 'Employer2 wants to connect with you',
      date: DateTime(2024, 6, 28),
    ),
    NotificationItem(
      message: 'Your application has been approved',
      date: DateTime(2024, 6, 27),
    ),
    NotificationItem(
      message: 'Employer commented on your post',
      date: DateTime(2024, 6, 26),
    ),
    NotificationItem(
      message: 'Today is Mary Anne\'s birthday',
      date: DateTime(2024, 6, 25),
    ),
    NotificationItem(
      message: 'New job listing available',
      date: DateTime(2024, 6, 24),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings page or show settings dialog
            },
          ),
        ],
      ),
      body: notifications.isEmpty
        ? Center(
              child: Text('No notifications', style: CustomTextStyle.regularText), // Use regularText style here
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: notification.message == 'Your application has been approved'
                      ? Icon(Icons.check_circle, size: 50, color: const Color.fromARGB(255, 7, 30, 47))
                        : notification.message == 'New job listing available'
                          ? Icon(Icons.group_work, size: 50, color: const Color.fromARGB(255, 7, 30, 47))
                            : CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('assets/images/meanne.jpg'),
                              ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notification.message, style: CustomTextStyle.regularText), // Apply regularText style here
                        if (index == 0 || index == 1) // Only show buttons for the top notifications
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.blue,
                                    side: BorderSide(color: Colors.blue),
                                  ),
                                  onPressed: () {
                                    // Handle accept action
                                  },
                                  child: Text('Accept'),
                                ),
                                SizedBox(width: 8),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    side: BorderSide(color: Colors.grey),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    // Handle delete action
                                  },
                                  child: Text('Delete'),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    subtitle: Text(
                      '${notification.date.day}/${notification.date.month}/${notification.date.year}',
                      style: CustomTextStyle.semiBoldText, // Use semiBoldText for subtitle
                    ),
                    onTap: () {
                      // Handle tapping on a notification
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your logic for handling notifications refresh or other actions
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}