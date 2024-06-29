// // import 'package:bluejobs_user/styles/custom_theme.dart';
// // import 'package:flutter/material.dart';
// // import 'package:bluejobs_user/models/message_model.dart';
// // import 'package:bluejobs_user/styles/textstyle.dart';
// // import 'package:bluejobs_user/styles/responsive_utils.dart';
// // import 'package:intl/intl.dart';

// // class MessagingPage extends StatefulWidget {
// //   @override
// //   _MessagingPageState createState() => _MessagingPageState();
// // }

// // class _MessagingPageState extends State<MessagingPage> {
// //   List<Message> messages = [
// //     Message(
// //       username: 'Employer',
// //       content: 'Hello, would you like to work for me?',
// //       date: '2023-04-01',
// //       backgroundImage: 'assets/images/meanne.jpg',
// //     ),
// //   ];
// // class _MessagingPageState extends State<MessagingPage> {
// //   List<Message> messages = [
// //     Message(
// //       username: 'Employer',
// //       content: 'Hello, would you like to work for me?',
// //       //date: '2023-04-01',
// //       date: DateTime.parse('2023-04-04'),
// //       backgroundImage: 'assets/images/employer.jpg', // Assuming you have an image for the employer
// //       isSentByUser: false,
// //     ),
// //     Message(
// //       username: 'Employee',
// //       content: 'Yes, I would love to work with you.',
// //       //date: '2023-04-02',
// //       date: DateTime.parse('2023-04-04'),
// //       backgroundImage: 'assets/images/employee.jpg', // Assuming you have an image for the employee
// //       isSentByUser: true,
// //     ),
// //     Message(
// //       username: 'Employer',
// //       content: 'Great Let\'s schedule our first meeting.',
// //       //date: '2023-04-03',
// //       date: DateTime.parse('2023-04-04'),
// //       backgroundImage: 'assets/images/employer.jpg',
// //       isSentByUser: false,
// //     ),
// //     Message(
// //       username: 'Employee',
// //       content: 'Sounds good. How about next Friday at 10 AM?',
// //       //date: '2023-04-04',
// //       date: DateTime.parse('2023-04-04'),
// //       backgroundImage: 'assets/images/employee.jpg',
// //       isSentByUser: true,
// //     ),
// //   ];
// // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Messages'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: messages.length,
// //         itemBuilder: (context, index) {
// //           return ListTile(
// //             leading: CircleAvatar(
// //               radius: 30,
// //               backgroundImage: AssetImage(messages[index].backgroundImage),
// //             ),
// //             title: Text(messages[index].username,
// //                 style: CustomTextStyle.semiBoldText
// //                     .copyWith(fontSize: responsiveSize(context, 0.04))),
// //             subtitle: Text(messages[index].content,
// //                 style: CustomTextStyle.regularText
// //                     .copyWith(fontSize: responsiveSize(context, 0.03))),
// //             trailing: Text(messages[index].date,
// //                 style: CustomTextStyle.lightText.copyWith(
// //                     fontSize: responsiveSize(context, 0.03))),
// //             onTap: () {
// //               // Navigate to the detailed message view
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) =>
// //                       MessageDetailPage(message: messages[index]),
// //                 ),
// //               );
// //             },
// //             onLongPress: () {
// //               // Show options to delete or mute the message
// //               showDialog(
// //                 context: context,
// //                 builder: (BuildContext context) {
// //                   return AlertDialog(
// //                     title: Text('Options'),
// //                     content: Column(
// //                       mainAxisSize: MainAxisSize.min,
// //                       children: [
// //                         ListTile(
// //                           title: Text('Delete'),
// //                           onTap: () {
// //                             // Implement delete functionality
// //                             Navigator.of(context).pop();
// //                           },
// //                         ),
// //                         ListTile(
// //                           title: Text('Mute'),
// //                           onTap: () {
// //                             // Implement mute functionality
// //                             Navigator.of(context).pop();
// //                           },
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               );
// //             },
// //           );
// //         },
// //       ),



// // class MessageDetailPage extends StatefulWidget {
// //   final Message message;

// //   const MessageDetailPage({Key? key, required this.message}) : super(key: key);

// //   @override
// //   _MessageDetailPageState createState() => _MessageDetailPageState();
// // }

// // class _MessageDetailPageState extends State<MessageDetailPage> {
// //   final TextEditingController _messageController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       body: Column(
// //         crossAxisAlignment: CrossAxisAlignment.stretch,
// //         children: [
// //           Expanded(
// //             child: SingleChildScrollView(
// //               child: Padding(
// //                 padding: EdgeInsets.all(10.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: [
// //                     SizedBox(height: 60),
// //                     CircleAvatar(
// //                       radius: 50,
// //                       backgroundImage:
// //                           AssetImage(widget.message.backgroundImage),
// //                     ),
// //                     SizedBox(height: 10),
// //                     Text(
// //                       widget.message.username,
// //                       style: TextStyle(
// //                         color: Color.fromARGB(255, 0, 0, 0),
// //                         fontSize: responsiveSize(context, 0.05),
// //                       ),
// //                       textAlign: TextAlign.center,
// //                     ),
// //                     SizedBox(height: 10),
// //                     Text(
// //                       'You are both mutuals on this app',
// //                       style: TextStyle(
// //                         color: Color.fromARGB(255, 0, 0, 0),
// //                         fontSize: responsiveSize(context, 0.03),
// //                       ),
// //                       textAlign: TextAlign.center,
// //                     ),
// //                     SizedBox(height: 10),
// //                     Padding(
// //                       padding: const EdgeInsets.all(10),
// //                       child: Row(
// //                         children: [
// //                           CircleAvatar(
// //                             radius: 20,
// //                             backgroundImage:
// //                                 AssetImage(widget.message.backgroundImage),
// //                           ),
// //                           SizedBox(width: 10),
// //                           Expanded(
// //                             child: Container(
// //                               padding: EdgeInsets.all(10),
// //                               decoration: BoxDecoration(
// //                                 color: Colors.grey[200],
// //                                 borderRadius: BorderRadius.circular(10),
// //                               ),
// //                               child: Text(
// //                                 widget.message.content,
// //                                 style: CustomTextStyle.regularText.copyWith(
// //                                     fontSize: responsiveSize(context, 0.04)),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: TextField(
// //                     controller: _messageController,
// //                     decoration: customInputDecoration(
// //                       'Type your message here...',
// //                     ),
// //                   ),
// //                 ),
// //                 IconButton(
// //                   icon: Icon(Icons.send, color: Colors.orange),
// //                   onPressed: () {
// //                     // Handle send message logic here
// //                     print(_messageController.text);
// //                     _messageController.clear();
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(height: 20),
// //         ],
// //       ),
// //     );
// //   };
// // }

// import 'package:bluejobs_user/styles/custom_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:bluejobs_user/models/message_model.dart';
// import 'package:bluejobs_user/styles/textstyle.dart';
// import 'package:bluejobs_user/styles/responsive_utils.dart';
// import 'package:intl/intl.dart';

// class MessagingPage extends StatefulWidget {
//   @override
//   _MessagingPageState createState() => _MessagingPageState();
// }

// class _MessagingPageState extends State<MessagingPage> {
//   List<Message> messages = [
//     Message(
//       username: 'Employer',
//       content: 'Hello, would you like to work for me?',
//       date: DateTime.parse('2023-04-04'),
//       backgroundImage: 'assets/images/employer.jpg',
//       isSentByUser: false,
//     ),
//     Message(
//       username: 'Employee',
//       content: 'Yes, I would love to work with you.',
//       date: DateTime.parse('2023-04-04'),
//       backgroundImage: 'assets/images/employee.jpg',
//       isSentByUser: true,
//     ),
//     Message(
//       username: 'Employer',
//       content: 'Great Let\'s schedule our first meeting.',
//       date: DateTime.parse('2023-04-04'),
//       backgroundImage: 'assets/images/employer.jpg',
//       isSentByUser: false,
//     ),
//     Message(
//       username: 'Employee',
//       content: 'Sounds good. How about next Friday at 10 AM?',
//       date: DateTime.parse('2023-04-04'),
//       backgroundImage: 'assets/images/employee.jpg',
//       isSentByUser: true,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Messages'),
//       ),
//       body: ListView.builder(
//         itemCount: messages.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: CircleAvatar(
//               radius: 30,
//               backgroundImage: AssetImage(messages[index].backgroundImage),
//             ),
//             title: Text(messages[index].username,
//                 style: CustomTextStyle.semiBoldText
//                    .copyWith(fontSize: responsiveSize(context, 0.04))),
//             subtitle: Text(messages[index].content,
//                 style: CustomTextStyle.regularText
//                    .copyWith(fontSize: responsiveSize(context, 0.03))),
//             // trailing: Text(messages[index].date,
//             //     style: CustomTextStyle.lightText.copyWith(
//             //         fontSize: responsiveSize(context, 0.03))),
//             trailing: Text(
//   DateFormat('yyyy-MM-dd – kk:mm').format(messages[index].date),
//   style: CustomTextStyle.lightText.copyWith(
//       fontSize: responsiveSize(context, 0.03)),
// ),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       MessageDetailPage(message: messages[index]),
//                 ),
//               );
//             },
//             onLongPress: () {
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: Text('Options'),
//                     content: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         ListTile(
//                           title: Text('Delete'),
//                           onTap: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                         ListTile(
//                           title: Text('Mute'),
//                           onTap: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class MessageDetailPage extends StatefulWidget {
//   final Message message;

//   const MessageDetailPage({Key? key, required this.message}) : super(key: key);

//   @override
//   _MessageDetailPageState createState() => _MessageDetailPageState();
// }

// class _MessageDetailPageState extends State<MessageDetailPage> {
//   final TextEditingController _messageController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 60),
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundImage:
//                           AssetImage(widget.message.backgroundImage),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       widget.message.username,
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         fontSize: responsiveSize(context, 0.05),
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'You are both mutuals on this app',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         fontSize: responsiveSize(context, 0.03),
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 20,
//                             backgroundImage:
//                                 AssetImage(widget.message.backgroundImage),
//                           ),
//                           SizedBox(width: 10),
//                           Expanded(
//                             child: Container(
//                               padding: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[200],
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Text(
//                                 widget.message.content,
//                                 style: CustomTextStyle.regularText.copyWith(
//                                     fontSize: responsiveSize(context, 0.04)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(
//                       hintText: 'Type your message here...',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send, color: Colors.orange),
//                   onPressed: () {
//                     print(_messageController.text);
//                     _messageController.clear();
//                   },
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class MessagingPage extends StatefulWidget {
//   const MessagingPage({super.key});

//   @override
//   State<MessagingPage> createState() => _MessagingPageState();
// }

// class _MessagingPageState extends State<MessagingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),

//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MessagingPage(),
//   ));
// }

// class MessagingPage extends StatefulWidget {
//   const MessagingPage({super.key});

//   @override
//   State<MessagingPage> createState() => _MessagingPageState();
// }

// class _MessagingPageState extends State<MessagingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Messages'),
//       ),
//       body: ListView(
//         children: [
//           _buildMessageItem(
//             context,
//             'Employer',
//             'assets/images/meanne.jpg',
//             'Hello! How are you?',
//           ),
//           _buildMessageItem(
//             context,
//             'Bob',
//             'https://via.placeholder.com/150',
//             'Are we still on for the meeting?',
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMessageItem(BuildContext context, String name, String profileUrl, String message) {
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundImage: profileUrl.startsWith('http')
//             ? NetworkImage(profileUrl)
//             : AssetImage(profileUrl) as ImageProvider,
//       ),
//       title: Text(name),
//       subtitle: Text(message),
//       trailing: PopupMenuButton<String>(
//         onSelected: (value) {
//           // Handle menu item selection
//           if (value == 'delete') {
//             // Delete this chat
//           } else if (value == 'mute') {
//             // Mute this chat
//           }
//         },
//         itemBuilder: (BuildContext context) {
//           return {'Delete this chat', 'Mute this chat'}.map((String choice) {
//             return PopupMenuItem<String>(
//               value: choice.toLowerCase().replaceAll(' ', '_'),
//               child: Text(choice),
//             );
//           }).toList();
//         },
//       ),
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ConversationPage(
//               name: name,
//               profileUrl: profileUrl,
//               initialMessage: message,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class ConversationPage extends StatelessWidget {
//   final String name;
//   final String profileUrl;
//   final String initialMessage;

//   const ConversationPage({
//     Key? key,
//     required this.name,
//     required this.profileUrl,
//     required this.initialMessage,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(name),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 40,
//               backgroundImage: profileUrl.startsWith('http')
//                   ? NetworkImage(profileUrl)
//                   : AssetImage(profileUrl) as ImageProvider,
//             ),
//             SizedBox(height: 10),
//             Text(
//               name,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'You are mutuals on this app',
//               style: TextStyle(color: Colors.grey),
//             ),
//             SizedBox(height: 20),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: _buildReply(name, initialMessage, profileUrl, false),
//             ),
//             SizedBox(height: 20),
//             Align(
//               alignment: Alignment.centerRight,
//               child: _buildReply('You', 'Yes', 'assets/images/marlo.jpg', true),
//             ),
//             Spacer(),
//             _buildBottomBar(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildReply(String sender, String message, String profileUrl, bool isReply) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: isReply ? MainAxisAlignment.end : MainAxisAlignment.start,
//       children: [
//         if (!isReply) CircleAvatar(radius: 20, backgroundImage: AssetImage(profileUrl)),
//         if (!isReply) SizedBox(width: 10),
//         Container(
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: isReply ? Colors.orange : Colors.blue,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             crossAxisAlignment: isReply ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//             children: [
//               Text(
//                 sender,
//                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 message,
//                 style: TextStyle(color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//         if (isReply) SizedBox(width: 10),
//         if (isReply) CircleAvatar(radius: 20, backgroundImage: AssetImage(profileUrl)),
//       ],
//     );
//   }

//   Widget _buildBottomBar(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           IconButton(
//             icon: Icon(Icons.image),
//             onPressed: () {
//               // Handle image selection
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.camera_alt),
//             onPressed: () {
//               // Handle camera selection
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.mic),
//             onPressed: () {
//               // Handle voice message recording
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.attach_file),
//             onPressed: () {
//               // Handle file selection
//             },
//           ),
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Type your message here',
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () {
//               // Handle sending message
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//goods na yan sa taas

import 'package:flutter/material.dart';



class MessagingPage extends StatefulWidget {
  const MessagingPage({super.key});

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: ListView(
        children: [
          _buildMessageItem(
            context,
            'Employer',
            'assets/images/meanne.jpg',
            'Hello! How are you?',
          ),
          _buildMessageItem(
            context,
            'Bob',
            'https://via.placeholder.com/150',
            'Are we still on for the meeting?',
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(BuildContext context, String name, String profileUrl, String message) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: profileUrl.startsWith('http')
            ? NetworkImage(profileUrl)
            : AssetImage(profileUrl) as ImageProvider,
      ),
      title: Text(name),
      subtitle: Text(message),
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          // Handle menu item selection
          if (value == 'delete') {
            // Delete this chat
          } else if (value == 'mute') {
            // Mute this chat
          }
        },
        itemBuilder: (BuildContext context) {
          return {'Delete this chat', 'Mute this chat'}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice.toLowerCase().replaceAll(' ', '_'),
              child: Text(choice),
            );
          }).toList();
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConversationPage(
              name: name,
              profileUrl: profileUrl,
              initialMessage: message,
            ),
          ),
        );
      },
    );
  }
}

class ConversationPage extends StatefulWidget {
  final String name;
  final String profileUrl;
  final String initialMessage;

  const ConversationPage({
    Key? key,
    required this.name,
    required this.profileUrl,
    required this.initialMessage,
  }) : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: Text(widget.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: widget.profileUrl.startsWith('http')
                  ? NetworkImage(widget.profileUrl)
                  : AssetImage(widget.profileUrl) as ImageProvider,
            ),
            SizedBox(height: 10),
            Text(
              widget.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'You are mutuals on this app',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: _buildReply(widget.name, widget.initialMessage, widget.profileUrl, false),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: _buildReply('You', 'Yes', 'assets/images/marlo.jpg', true),
            ),
            Spacer(),
            _buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildReply(String sender, String message, String profileUrl, bool isReply) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: isReply ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isReply) CircleAvatar(radius: 20, backgroundImage: AssetImage(profileUrl)),
        if (!isReply) SizedBox(width: 10),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isReply ? Colors.orange : Color.fromARGB(255, 19, 52, 77),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: isReply ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 5),
              Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        if (isReply) SizedBox(width: 10),
        if (isReply) CircleAvatar(radius: 20, backgroundImage: AssetImage(profileUrl)),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          if (!_isExpanded) ...[
            IconButton(
              icon: Icon(Icons.image),
              onPressed: () {
                // Handle image selection
              },
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                // Handle camera selection
              },
            ),
            IconButton(
              icon: Icon(Icons.mic),
              onPressed: () {
                // Handle voice message recording
              },
            ),
            IconButton(
              icon: Icon(Icons.attach_file),
              onPressed: () {
                // Handle file selection
              },
            ),
          ],
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = true;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type your message here',
                    border: InputBorder.none,
                  ),
                  onTap: () {
                    setState(() {
                      _isExpanded = true;
                    });
                  },
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Color.fromARGB(255, 19, 52, 77)),
            onPressed: () {
              // Handle sending message
            },
          ),
        ],
      ),
    );
  }
}
