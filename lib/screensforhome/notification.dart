// import 'package:flutter/material.dart';
// import 'package:bluejobs_user/styles/textstyle.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationItem {
//   final String message;
//   final DateTime date;

//   NotificationItem({required this.message, required this.date});
// }

// class NotificationsPage extends StatefulWidget {
//   const NotificationsPage({Key? key}) : super(key: key);

//   @override
//   State<NotificationsPage> createState() => _NotificationsPageState();
// }

// class _NotificationsPageState extends State<NotificationsPage> {
//   final List<NotificationItem> notifications = [
//     NotificationItem(
//       message: 'Employer2 wants to connect with you',
//       date: DateTime(2024, 6, 28),
//     ),
//     NotificationItem(
//       message: 'Your application has been approved',
//       date: DateTime(2024, 6, 27),
//     ),
//     NotificationItem(
//       message: 'Employer commented on your post',
//       date: DateTime(2024, 6, 26),
//     ),
//     NotificationItem(
//       message: 'Today is Mary Anne\'s birthday',
//       date: DateTime(2024, 6, 25),
//     ),
//     NotificationItem(
//       message: 'New job listing available',
//       date: DateTime(2024, 6, 24),
//     ),
//     NotificationItem(
//       message: 'Welcome to BlueJobs',
//       date: DateTime(2024, 6, 24),
//     ),
//   ];

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   @override
//   void initState() {
//     super.initState();
//     initializeNotifications();
//   }

//   void initializeNotifications() {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//     );

//     flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> showNotification(String message) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       //'your_channel_description',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'BlueJobs Notification',
//       message,
//       platformChannelSpecifics,
//       payload: 'item x',
//     );
//   }

//   Future<void> _refreshNotifications() async {
//     // Simulate network call
//     await Future.delayed(Duration(seconds: 2));
//     setState(() {
//       // Update the notifications list
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: RefreshIndicator(
//         onRefresh: _refreshNotifications,
//         child: notifications.isEmpty
//             ? Center(
//                 child: Text('No notifications', style: CustomTextStyle.regularText),
//               )
//             : ListView.builder(
//                 itemCount: notifications.length,
//                 itemBuilder: (context, index) {
//                   final notification = notifications[index];
//                   return ListTile(
//                     leading: _getLeadingIcon(notification.message),
//                     title: Text(notification.message, style: CustomTextStyle.regularText),
//                     subtitle: Text(
//                       '${notification.date.day}/${notification.date.month}/${notification.date.year}',
//                       style: CustomTextStyle.regularText,
//                     ),
//                     trailing: notification.message == 'Employer2 wants to connect with you'
//                         ? OutlinedButton(
//                             style: OutlinedButton.styleFrom(
//                               foregroundColor: Colors.blue,
//                               side: BorderSide(color: Colors.blue),
//                             ),
//                             onPressed: () {
//                               // Handle accept action
//                               showNotification('You accepted the connection request');
//                             },
//                             child: Text('Accept'),
//                           )
//                         : null,
//                     onTap: () {
//                       // Handle tapping on a notification
//                       showNotification(notification.message);
//                     },
//                   );
//                 },
//               ),
//       ),
//     );
//   }

//   Widget _getLeadingIcon(String message) {
//     switch (message) {
//       case 'Your application has been approved':
//         return Icon(Icons.check_circle, size: 50, color: Color.fromARGB(255, 7, 30, 47));
//       case 'New job listing available':
//         return Icon(Icons.group_work, size: 50, color: Color.fromARGB(255, 7, 30, 47));
//       case 'Welcome to BlueJobs':
//         return Icon(Icons.ac_unit, size: 50, color: Color.fromARGB(255, 7, 30, 47));
//       default:
//         return CircleAvatar(
//           radius: 30,
//           backgroundImage: AssetImage('assets/images/meanne.jpg'),
//         );
//     }
//   }
// }


import 'package:bluejobs_user/styles/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:bluejobs_user/styles/textstyle.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
    NotificationItem(
      message: 'Welcome to BlueJobs',
      date: DateTime(2024, 6, 24),
    ),
  ];

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initializeNotifications();
  }

  void initializeNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      //'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'BlueJobs Notification',
      message,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  Future<void> _refreshNotifications() async {
    // Simulate network call
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // Update the notifications list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
       appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 30, 47),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Customize the back button icon and color
          onPressed: () =>
              Navigator.of(context).pop(), // Handle the back button press
        ),
        title: Text('Notifications', style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04))),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshNotifications,
        child: notifications.isEmpty
            ? Center(
                child: Text('No notifications', style: CustomTextStyle.regularText),
              )
            : ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return ListTile(
                    leading: _getLeadingIcon(notification.message),
                    title: Text(notification.message, style: CustomTextStyle.regularText),
                    subtitle: Text(
                      '${notification.date.day}/${notification.date.month}/${notification.date.year}',
                      style: CustomTextStyle.regularText,
                    ),
                    trailing: notification.message == 'Employer2 wants to connect with you'
                        ? OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 243, 107, 4),
                              side: BorderSide(color: const Color.fromARGB(255, 243, 107, 4)),
                            ),
                            onPressed: () {
                              // Handle accept action
                              showNotification('You accepted the connection request');
                            },
                            child: Text('Accept', style: CustomTextStyle.regularText,),
                            

                          )
                        : null,
                    onTap: () {
                      // Handle tapping on a notification
                      showNotification(notification.message);
                    },
                  );
                },
              ),
      ),
    );
  }

  Widget _getLeadingIcon(String message) {
    switch (message) {
      case 'Your application has been approved':
        return Icon(Icons.check_circle, size: 50, color: Color.fromARGB(255, 243, 107, 4));
      case 'New job listing available':
        return Icon(Icons.group_work, size: 50, color: Color.fromARGB(255, 243, 107, 4));
      case 'Welcome to BlueJobs':
        return Icon(Icons.ac_unit, size: 50, color: Color.fromARGB(255, 243, 107, 4));
      default:
        return CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/meanne.jpg'),
        );
    }
  }
}


