import 'package:flutter/material.dart';
import 'package:bluejobs_user/styles/responsive_utils.dart';


class CustomTextStyle {
  static const TextStyle regularTextBlack = TextStyle(
    fontSize: 12,
    letterSpacing: 0.5,
    fontFamily: 'Poppins',
    color: Colors.black,
  );

  static const TextStyle regularTextWhite = TextStyle(
    fontSize: 12,
    letterSpacing: 0.5,
    fontFamily: 'Poppins',
    color: Colors.white,
  );

  static const TextStyle semiBoldTextBlack = TextStyle(
    fontSize: 14,
    letterSpacing: 0.4,
    fontFamily: 'Poppins',
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle semiBoldTextWhite = TextStyle(
    fontSize: 14,
    letterSpacing: 0.4,
    fontFamily: 'Poppins',
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

class MessagingPage extends StatefulWidget {
  const MessagingPage({Key? key}) : super(key: key);

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
 // final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _messages = [
    {
      'name': 'Employer',
      'profileUrl': 'assets/images/meanne.jpg',
      'message':
          'Hello How are you? ahahahahhahahahahahaaaaaaa jsaheuyfeiyf ashsjhcguaskgviashvc hash '
    },
    {
      'name': 'Bob',
      'profileUrl': 'https://via.placeholder.com/150',
      'message': 'Are we still on for the meeting?'
    },
    {
      'name': 'Dads',
      'profileUrl': 'assets/images/dads.jpg',
      'message': 'Are we still on for the meeting?'
    },
     {
      'name': 'Glai',
      'profileUrl': 'https://via.placeholder.com/150',
      'message': 'Are we still on for the meeting?'
    },
  ];

  late List<Map<String, String>> _filteredMessages;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
        onPressed: () => Navigator.of(context).pop(), // Handle the back button press
      ),
      title: Text('Messages', style: CustomTextStyle.semiBoldTextWhite),
    ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                // Check if the current message is not the last one to decide whether to show the divider
                if (index != _messages.length - 1) {
                  return Column(
                    children: [
                      _buildMessageItem(
                        context,
                        message['name']!,
                        message['profileUrl']!,
                        message['message']!,
                      ),
                      Divider(
                        color: const Color.fromARGB(255, 109, 104, 104), // White line separator
                        thickness: 1, // Thickness of the line
                      ),
                    ],
                  );
                } else {
                  return _buildMessageItem(
                    context,
                    message['name']!,
                    message['profileUrl']!,
                    message['message']!,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

Widget _buildMessageItem(
      BuildContext context, String name, String profileUrl, String message) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: profileUrl.startsWith('http')
              ? NetworkImage(profileUrl)
              : AssetImage(profileUrl) as ImageProvider,
        ),
        title: Text(
          name,
          style: CustomTextStyle.semiBoldTextWhite
              .copyWith(fontSize: responsiveSize(context, 0.04)),
        ),
        subtitle: Text(
          message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyle.regularTextWhite,
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
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 30, 47),
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
        onPressed: () => Navigator.of(context).pop(), // Handle the back button press
      ),
        actions: <Widget>[
           IconButton(
            icon: Icon(Icons.video_call_rounded),
            color: Colors.white,
            onPressed: (){}),
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileSettingsPage(
                    name: widget.name,
                    profileUrl: widget.profileUrl,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: widget.profileUrl.startsWith('http')
                            ? NetworkImage(widget.profileUrl)
                            : AssetImage(widget.profileUrl) as ImageProvider,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.name,
                        style: CustomTextStyle.semiBoldTextWhite
                            .copyWith(fontSize: responsiveSize(context, 0.04)),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'You are mutuals on this app',
                        style: CustomTextStyle.regularTextWhite
                            .copyWith(fontSize: responsiveSize(context, 0.03)),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: _buildReply(widget.name, widget.initialMessage,
                            widget.profileUrl, false),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: _buildReply(
                            'You', 'Yes', 'assets/images/marlo.jpg', true),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildReply(
      String sender, String message, String profileUrl, bool isReply) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          isReply ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isReply)
          CircleAvatar(radius: 20, backgroundImage: AssetImage(profileUrl)),
        if (!isReply) const SizedBox(width: 10),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isReply
                  ? Colors.orange
                  : const Color.fromARGB(255, 19, 52, 77),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment:
                  isReply ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  sender,
                  style: CustomTextStyle.semiBoldTextWhite
                      .copyWith(fontSize: responsiveSize(context, 0.04)),
                ),
                const SizedBox(height: 5),
                Text(
                  message,
                  style: CustomTextStyle.regularTextWhite
                      .copyWith(fontSize: responsiveSize(context, 0.03)),
                ),
              ],
            ),
          ),
        ),
        if (isReply) const SizedBox(width: 10),
        if (isReply)
          CircleAvatar(radius: 20, backgroundImage: AssetImage(profileUrl)),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.image,
                color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {
              // Handle image selection
            },
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt,
                color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {
              // Handle camera selection
            },
          ),
          IconButton(
            icon:
                const Icon(Icons.mic, color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {
              // Handle voice message recording
            },
          ),
          IconButton(
            icon: const Icon(Icons.attach_file,
                color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {
              // Handle file selection
            },
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  // No need to set _isExpanded in this context
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                      
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Type a message',
                    hintStyle: CustomTextStyle.regularTextWhite,
                    border: InputBorder.none,
                  ),
                  style: CustomTextStyle.regularTextWhite,
                  onChanged: (text) {
                    // Handle message input
                  },
                ),
              ),
            ),
          ),
          IconButton(
            icon:
                const Icon(Icons.send, color: Color.fromARGB(255, 243, 107, 4)),
            onPressed: () {
              // Handle sending message
            },
          ),
        ],
      ),
    );
  }
}



class ProfileSettingsPage extends StatefulWidget {
  final String name;
  final String profileUrl;

  const ProfileSettingsPage(
      {Key? key, required this.name, required this.profileUrl})
      : super(key: key);

  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
        onPressed: () => Navigator.of(context).pop(), // Handle the back button press
      ),
      title: Text('Message Settings', style: CustomTextStyle.semiBoldTextWhite),
    ),
      body: SafeArea(
        child: Padding(
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
              const SizedBox(height: 10),
              Text(
                widget.name,
                style: CustomTextStyle.semiBoldTextWhite
                    .copyWith(fontSize: responsiveSize(context, 0.04)),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.person,
                    color:  Color.fromARGB(255, 243, 107, 4)),
                title: const Text(
                  'View Profile',
                  style: CustomTextStyle.regularTextWhite,
                ),
                onTap: () {
                  // Handle view profile
                  print('View Profile');
                },
              ),
              ListTile(
                leading: const Icon(Icons.block,
                    color:  Color.fromARGB(255, 243, 107, 4)),
                title: const Text('Block this conversation',
                    style: CustomTextStyle.regularTextWhite),
                onTap: () {
                  _showBlockConfirmationDialog(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete,
                    color:  Color.fromARGB(255, 243, 107, 4)),
                title: const Text('Delete this conversation',
                    style: CustomTextStyle.regularTextWhite),
                onTap: () {
                  _showDeleteConfirmationDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _showBlockConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Block this conversation',
              style: CustomTextStyle.regularTextBlack),
          content: Text('Are you sure you want to block ${widget.name}?',
              style: CustomTextStyle.regularTextBlack),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes', style: CustomTextStyle.regularTextBlack),
              onPressed: () {
                // Handle block action
                Navigator.of(context).pop();
                setState(() {
                  // Update state to reflect that the user is blocked
                  print('Blocked');
                });
              },
            ),
            TextButton(
              child: const Text('No', style: CustomTextStyle.regularTextBlack),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete this conversation',
              style: CustomTextStyle.regularTextBlack),
          content: const Text(
              'Are you sure you want to delete this conversation?',
              style: CustomTextStyle.regularTextBlack),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes', style: CustomTextStyle.regularTextBlack),
              onPressed: () {
                // Handle delete action
                Navigator.of(context).pop();
                setState(() {
                  // Update state to reflect that the conversation is deleted
                  print('Deleted');
                });
              },
            ),
            TextButton(
              child: const Text('No', style: CustomTextStyle.regularTextBlack),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:bluejobs_user/styles/responsive_utils.dart';


// class CustomTextStyle {
//   static const TextStyle regularTextBlack = TextStyle(
//     fontSize: 12,
//     letterSpacing: 0.5,
//     fontFamily: 'Poppins',
//     color: Colors.black,
//   );

//   static const TextStyle regularTextWhite = TextStyle(
//     fontSize: 12,
//     letterSpacing: 0.5,
//     fontFamily: 'Poppins',
//     color: Colors.white,
//   );

//   static const TextStyle semiBoldTextBlack = TextStyle(
//     fontSize: 14,
//     letterSpacing: 0.4,
//     fontFamily: 'Poppins',
//     color: Colors.black,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle semiBoldTextWhite = TextStyle(
//     fontSize: 14,
//     letterSpacing: 0.4,
//     fontFamily: 'Poppins',
//     color: Colors.white,
//     fontWeight: FontWeight.bold,
//   );
// }

// class MessagingPage extends StatefulWidget {
//   const MessagingPage({Key? key}) : super(key: key);

//   @override
//   State<MessagingPage> createState() => _MessagingPageState();
// }

// class _MessagingPageState extends State<MessagingPage> {
//  // final TextEditingController _searchController = TextEditingController();
//   final List<Map<String, String>> _messages = [
//     {
//       'name': 'Employer',
//       'profileUrl': 'assets/images/meanne.jpg',
//       'message':
//           'Hello How are you? ahahahahhahahahahahaaaaaaa jsaheuyfeiyf ashsjhcguaskgviashvc hash '
//     },
//     {
//       'name': 'Bob',
//       'profileUrl': 'https://via.placeholder.com/150',
//       'message': 'Are we still on for the meeting?'
//     },
//     {
//       'name': 'Dads',
//       'profileUrl': 'assets/images/dads.jpg',
//       'message': 'Are we still on for the meeting?'
//     },
//      {
//       'name': 'Glai',
//       'profileUrl': 'https://via.placeholder.com/150',
//       'message': 'Are we still on for the meeting?'
//     },
//   ];

//   late List<Map<String, String>> _filteredMessages;

//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(
//       backgroundColor: Color.fromARGB(255, 7, 30, 47),
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
//         onPressed: () => Navigator.of(context).pop(), // Handle the back button press
//       ),
//       title: Text('Messages', style: CustomTextStyle.semiBoldTextWhite),
//     ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 // Check if the current message is not the last one to decide whether to show the divider
//                 if (index != _messages.length - 1) {
//                   return Column(
//                     children: [
//                       _buildMessageItem(
//                         context,
//                         message['name']!,
//                         message['profileUrl']!,
//                         message['message']!,
//                       ),
//                       Divider(
//                         color: const Color.fromARGB(255, 109, 104, 104), // White line separator
//                         thickness: 1, // Thickness of the line
//                       ),
//                     ],
//                   );
//                 } else {
//                   return _buildMessageItem(
//                     context,
//                     message['name']!,
//                     message['profileUrl']!,
//                     message['message']!,
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// Widget _buildMessageItem(
//       BuildContext context, String name, String profileUrl, String message) {
//     return Container(
//       child: ListTile(
//         leading: CircleAvatar(
//           radius: 30,
//           backgroundImage: profileUrl.startsWith('http')
//               ? NetworkImage(profileUrl)
//               : AssetImage(profileUrl) as ImageProvider,
//         ),
//         title: Text(
//           name,
//           style: CustomTextStyle.semiBoldTextWhite
//               .copyWith(fontSize: responsiveSize(context, 0.04)),
//         ),
//         subtitle: Text(
//           message,
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//           style: CustomTextStyle.regularTextWhite,
//         ),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ConversationPage(
//                 name: name,
//                 profileUrl: profileUrl,
//                 initialMessage: message,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class ConversationPage extends StatefulWidget {
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
//   State<ConversationPage> createState() => _ConversationPageState();
// }

// class _ConversationPageState extends State<ConversationPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 7, 30, 47),
//         leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
//         onPressed: () => Navigator.of(context).pop(), // Handle the back button press
//       ),
//         actions: <Widget>[
//            IconButton(
//             icon: Icon(Icons.video_call_rounded),
//             color: Colors.white,
//             onPressed: (){}),
//           IconButton(
//             icon: const Icon(Icons.settings),
//             color: Colors.white,
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ProfileSettingsPage(
//                     name: widget.name,
//                     profileUrl: widget.profileUrl,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 45,
//                         backgroundImage: widget.profileUrl.startsWith('http')
//                             ? NetworkImage(widget.profileUrl)
//                             : AssetImage(widget.profileUrl) as ImageProvider,
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         widget.name,
//                         style: CustomTextStyle.semiBoldTextWhite
//                             .copyWith(fontSize: responsiveSize(context, 0.04)),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         'You are mutuals on this app',
//                         style: CustomTextStyle.regularTextWhite
//                             .copyWith(fontSize: responsiveSize(context, 0.03)),
//                       ),
//                       const SizedBox(height: 20),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: _buildReply(widget.name, widget.initialMessage,
//                             widget.profileUrl, false),
//                       ),
//                       const SizedBox(height: 20),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: _buildReply(
//                             'You', 'Yes', 'assets/images/marlo.jpg', true),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             _buildBottomBar(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildReply(
//       String sender, String message, String profileUrl, bool isReply) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment:
//           isReply ? MainAxisAlignment.end : MainAxisAlignment.start,
//       children: [
//         if (!isReply)
//           CircleAvatar(radius: 20, backgroundImage: AssetImage(profileUrl)),
//         if (!isReply) const SizedBox(width: 10),
//         Flexible(
//           child: Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: isReply
//                   ? Colors.orange
//                   : const Color.fromARGB(255, 19, 52, 77),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment:
//                   isReply ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   sender,
//                   style: CustomTextStyle.semiBoldTextWhite
//                       .copyWith(fontSize: responsiveSize(context, 0.04)),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   message,
//                   style: CustomTextStyle.regularTextWhite
//                       .copyWith(fontSize: responsiveSize(context, 0.03)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (isReply) const SizedBox(width: 10),
//         if (isReply)
//           CircleAvatar(radius: 20, backgroundImage: AssetImage(profileUrl)),
//       ],
//     );
//   }


// import 'package:flutter/material.dart';
// import 'package:bluejobs_user/styles/responsive_utils.dart';

// class CustomTextStyle {
//   static const TextStyle regularTextBlack = TextStyle(
//     fontSize: 12,
//     letterSpacing: 0.5,
//     fontFamily: 'Poppins',
//     color: Colors.black,
//   );

//   static const TextStyle regularTextWhite = TextStyle(
//     fontSize: 12,
//     letterSpacing: 0.5,
//     fontFamily: 'Poppins',
//     color: Colors.white,
//   );

//   static const TextStyle semiBoldTextBlack = TextStyle(
//     fontSize: 14,
//     letterSpacing: 0.4,
//     fontFamily: 'Poppins',
//     color: Colors.black,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle semiBoldTextWhite = TextStyle(
//     fontSize: 14,
//     letterSpacing: 0.4,
//     fontFamily: 'Poppins',
//     color: Colors.white,
//     fontWeight: FontWeight.bold,
//   );
// }

// class MessagingPage extends StatefulWidget {
  
//   const MessagingPage({Key? key}) : super(key: key);

//   @override
//   State<MessagingPage> createState() => _MessagingPageState();
// }

// class _MessagingPageState extends State<MessagingPage> {
  
//   final List<Map<String, String>> _messages = [
//     {
//       'name': 'Employer',
//       'profileUrl': 'assets/images/meanne.jpg',
//       'message': 'Hello How are you? ahahahahhahahahahahaaaaaaa jsaheuyfeiyf ashsjhcguaskgviashvc hash '
//     },
//     {
//       'name': 'Bob',
//       'profileUrl': 'https://via.placeholder.com/150',
//       'message': 'Are we still on for the meeting?'
//     },
//     {
//       'name': 'Dads',
//       'profileUrl': 'assets/images/dado.jpg',
//       'message': 'Are we still on for the meeting?'
//     },
//     {
//       'name': 'Glai',
//       'profileUrl': 'https://via.placeholder.com/150',
//       'message': 'Are we still on for the meeting?'
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 7, 30, 47),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text('Messages', style: CustomTextStyle.semiBoldTextWhite),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 return Column(
//                   children: [
//                     _buildMessageItem(
//                       context,
//                       message['name']!,
//                       message['profileUrl']!,
//                       message['message']!,
//                     ),
//                     if (index != _messages.length - 1)
//                       Divider(
//                         color: const Color.fromARGB(255, 109, 104, 104),
//                         thickness: 1,
//                       ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMessageItem(
//       BuildContext context, String name, String profileUrl, String message) {
//     return Container(
//       child: ListTile(
//         leading: CircleAvatar(
//           radius: 30,
//           backgroundImage: profileUrl.startsWith('http')
//               ? NetworkImage(profileUrl)
//               : AssetImage(profileUrl) as ImageProvider,
//         ),
//         title: Text(
//           name,
//           style: CustomTextStyle.semiBoldTextWhite
//               .copyWith(fontSize: responsiveSize(context, 0.04)),
//         ),
//         subtitle: Text(
//           message,
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//           style: CustomTextStyle.regularTextWhite,
//         ),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ConversationPage(
//                 name: name,
//                 profileUrl: profileUrl,
//                 initialMessage: message,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class ConversationPage extends StatefulWidget {
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
//   State<ConversationPage> createState() => _ConversationPageState();
// }

// class _ConversationPageState extends State<ConversationPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 7, 30, 47),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.video_call_rounded),
//             color: Colors.white,
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.settings),
//             color: Colors.white,
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ProfileSettingsPage(
//                     name: widget.name,
//                     profileUrl: widget.profileUrl,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 45,
//                         backgroundImage: widget.profileUrl.startsWith('http')
//                             ? NetworkImage(widget.profileUrl)
//                             : AssetImage(widget.profileUrl) as ImageProvider,
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         widget.name,
//                         style: CustomTextStyle.semiBoldTextWhite
//                             .copyWith(fontSize: responsiveSize(context, 0.04)),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         'You are mutuals on this app',
//                         style: CustomTextStyle.regularTextWhite
//                             .copyWith(fontSize: responsiveSize(context, 0.03)),
//                       ),
//                       const SizedBox(height: 20),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: _buildReply(widget.name, widget.initialMessage, widget.profileUrl, false),
//                       ),
//                       const SizedBox(height: 20),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: _buildReply('You', 'Yes', 'assets/images/marlo.jpg', true),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             _buildBottomBar(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildReply(String sender, String message, String profileUrl, bool isReply) {
//     return GestureDetector(
//       onLongPress: () {
//         _showMessageOptions(sender, isReply, message);
//       },
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: isReply ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: [
//           if (!isReply)
//             CircleAvatar(radius: 20, backgroundImage: AssetImage(profileUrl)),
//           if (!isReply) const SizedBox(width: 10),
//           Flexible(
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: isReply ? Colors.orange : const Color.fromARGB(255, 19, 52, 77),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 crossAxisAlignment: isReply ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     sender,
//                     style: CustomTextStyle.semiBoldTextWhite.copyWith(fontSize: responsiveSize(context, 0.04)),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     message,
//                     style: CustomTextStyle.regularTextWhite.copyWith(fontSize: responsiveSize(context, 0.03)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           if (isReply) const SizedBox(width: 10),
//           if (isReply)
//             CircleAvatar(radius: 20, backgroundImage: AssetImage(profileUrl)),
//         ],
//       ),
//     );
//   }

//   void _showMessageOptions(String sender, bool isReply, String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(isReply ? 'Your Message Options' : 'Employer Message Options'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: Text(isReply ? 'Edit' : 'Reply'),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   if (isReply) {
//                     // Handle edit action
//                     print('Editing message: $message');
//                     // Implement editing logic here (e.g., showing a text field)
//                   } else {
//                     // Handle reply action
//                     print('Replying to: $message');
//                   }
//                 },
//               ),
//               ListTile(
//                 title: const Text('Unsend'),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   print('Unsending message: $message');
//                   // Implement unsend logic
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

//   String _messageText = '';

// Widget _buildBottomBar(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Row(
//       children: [
//         IconButton(
//           icon: const Icon(Icons.image, color: Color.fromARGB(255, 255, 255, 255)),
//           onPressed: () {
//             // Handle image selection
//           },
//         ),
//         IconButton(
//           icon: const Icon(Icons.camera_alt, color: Color.fromARGB(255, 255, 255, 255)),
//           onPressed: () {
//             // Handle camera selection
//           },
//         ),
//         IconButton(
//           icon: const Icon(Icons.mic, color: Color.fromARGB(255, 255, 255, 255)),
//           onPressed: () {
//             // Handle voice message recording
//           },
//         ),
//         IconButton(
//           icon: const Icon(Icons.attach_file, color: Color.fromARGB(255, 255, 255, 255)),
//           onPressed: () {
//             // Handle file selection
//           },
//         ),
//         Expanded(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
//             ),
//             child: TextField(
//               decoration: const InputDecoration(
//                 hintText: 'Type a message',
//                 hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
//                 border: InputBorder.none,
//               ),
//               style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
//               onChanged: (text) {
//                 setState(() {
//                   _messageText = text; // Capture the message input
//                 });
//               },
//             ),
//           ),
//         ),
//         IconButton(
//           icon: const Icon(Icons.send, color: Color.fromARGB(255, 243, 107, 4)),
//           onPressed: () {
//             if (_messageText.isNotEmpty) {
//               // Handle sending message logic
//               print('Sending message: $_messageText');
//               setState(() {
//                 _messageText = ''; // Clear input after sending
//               });
//             }
//           },
//         ),
//       ],
//     ),
//   );
// }






// class ProfileSettingsPage extends StatefulWidget {
//   final String name;
//   final String profileUrl;

//   const ProfileSettingsPage(
//       {Key? key, required this.name, required this.profileUrl})
//       : super(key: key);

//   @override
//   _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
// }

// class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//       backgroundColor: Color.fromARGB(255, 7, 30, 47),
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
//         onPressed: () => Navigator.of(context).pop(), // Handle the back button press
//       ),
//       title: Text('Message Settings', style: CustomTextStyle.semiBoldTextWhite),
//     ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 40,
//                 backgroundImage: widget.profileUrl.startsWith('http')
//                     ? NetworkImage(widget.profileUrl)
//                     : AssetImage(widget.profileUrl) as ImageProvider,
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 widget.name,
//                 style: CustomTextStyle.semiBoldTextWhite
//                     .copyWith(fontSize: responsiveSize(context, 0.04)),
//               ),
//               const SizedBox(height: 20),
//               ListTile(
//                 leading: const Icon(Icons.person,
//                     color:  Color.fromARGB(255, 243, 107, 4)),
//                 title: const Text(
//                   'View Profile',
//                   style: CustomTextStyle.regularTextWhite,
//                 ),
//                 onTap: () {
//                   // Handle view profile
//                   print('View Profile');
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.block,
//                     color:  Color.fromARGB(255, 243, 107, 4)),
//                 title: const Text('Block this conversation',
//                     style: CustomTextStyle.regularTextWhite),
//                 onTap: () {
//                   _showBlockConfirmationDialog(context);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.delete,
//                     color:  Color.fromARGB(255, 243, 107, 4)),
//                 title: const Text('Delete this conversation',
//                     style: CustomTextStyle.regularTextWhite),
//                 onTap: () {
//                   _showDeleteConfirmationDialog(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }


//   void _showBlockConfirmationDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Block this conversation',
//               style: CustomTextStyle.regularTextBlack),
//           content: Text('Are you sure you want to block ${widget.name}?',
//               style: CustomTextStyle.regularTextBlack),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Yes', style: CustomTextStyle.regularTextBlack),
//               onPressed: () {
//                 // Handle block action
//                 Navigator.of(context).pop();
//                 setState(() {
//                   // Update state to reflect that the user is blocked
//                   print('Blocked');
//                 });
//               },
//             ),
//             TextButton(
//               child: const Text('No', style: CustomTextStyle.regularTextBlack),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showDeleteConfirmationDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Delete this conversation',
//               style: CustomTextStyle.regularTextBlack),
//           content: const Text(
//               'Are you sure you want to delete this conversation?',
//               style: CustomTextStyle.regularTextBlack),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Yes', style: CustomTextStyle.regularTextBlack),
//               onPressed: () {
//                 // Handle delete action
//                 Navigator.of(context).pop();
//                 setState(() {
//                   // Update state to reflect that the conversation is deleted
//                   print('Deleted');
//                 });
//               },
//             ),
//             TextButton(
//               child: const Text('No', style: CustomTextStyle.regularTextBlack),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


