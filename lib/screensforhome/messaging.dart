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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: ListView(
        children: [
          _buildMessageItem(
            context,
            'Employer',
            'assets/images/meanne.jpg',
            'Hello How are you? ahahahahhahahahahahaaaaaaa jsaheuyfeiyf ashsjhcguaskgviashvc hashxvascgasuk hahsahshsh imisss yiu ',
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
      title: Text(
        name,
        style: CustomTextStyle.semiBoldTextBlack.copyWith(fontSize: responsiveSize(context, 0.04)), // Use black text for the message list
      ),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: CustomTextStyle.regularTextBlack, // Use black text for the message list
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
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
                        radius: 40,
                        backgroundImage: widget.profileUrl.startsWith('http')
                            ? NetworkImage(widget.profileUrl)
                            : AssetImage(widget.profileUrl) as ImageProvider,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.name,
                        style: CustomTextStyle.semiBoldTextBlack.copyWith(fontSize: responsiveSize(context, 0.04)),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'You are mutuals on this app',
                        style: CustomTextStyle.regularTextBlack.copyWith(fontSize: responsiveSize(context, 0.03)),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: _buildReply(widget.name, widget.initialMessage, widget.profileUrl, false),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: _buildReply('You', 'Yes', 'assets/images/marlo.jpg', true),
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

  Widget _buildReply(String sender, String message, String profileUrl, bool isReply) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: isReply ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isReply) CircleAvatar(radius: 20, backgroundImage: AssetImage(profileUrl)),
        if (!isReply) const SizedBox(width: 10),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isReply ? Colors.orange : const Color.fromARGB(255, 19, 52, 77),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: isReply ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  sender,
                  style: CustomTextStyle.semiBoldTextWhite.copyWith(fontSize: responsiveSize(context, 0.04)),
                ),
                const SizedBox(height: 5),
                Text(
                  message,
                  style: CustomTextStyle.regularTextWhite.copyWith(fontSize: responsiveSize(context, 0.03)),
                ),
              ],
            ),
          ),
        ),
        if (isReply) const SizedBox(width: 10),
        if (isReply) CircleAvatar(radius: 20, backgroundImage: AssetImage(profileUrl)),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.image, color: Color.fromARGB(255, 243, 107, 4)),
            onPressed: () {
              // Handle image selection
            },
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Color.fromARGB(255, 243, 107, 4)),
            onPressed: () {
              // Handle camera selection
            },
          ),
          IconButton(
            icon: const Icon(Icons.mic, color: Color.fromARGB(255, 243, 107, 4)),
            onPressed: () {
              // Handle voice message recording
            },
          ),
          IconButton(
            icon: const Icon(Icons.attach_file, color: Color.fromARGB(255, 243, 107, 4)),
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
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type your message here',
                    border: InputBorder.none,
                    hintStyle: CustomTextStyle.regularTextBlack.copyWith(fontSize: responsiveSize(context, 0.03)),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color.fromARGB(255, 243, 107, 4)),
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

  const ProfileSettingsPage({Key? key, required this.name, required this.profileUrl}) : super(key: key);

  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                style: CustomTextStyle.semiBoldTextBlack.copyWith(fontSize: responsiveSize(context, 0.04)),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.person, color: Color.fromARGB(255, 19, 52, 77)),
                title: const Text('View Profile', style: CustomTextStyle.regularTextBlack,),
                onTap: () {
                  // Handle view profile
                  print('View Profile');
                },
              ),
              ListTile(
                leading: const Icon(Icons.block, color: Color.fromARGB(255, 19, 52, 77)),
                title: const Text('Block this conversation', style: CustomTextStyle.regularTextBlack),
                onTap: () {
                  _showBlockConfirmationDialog(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Color.fromARGB(255, 19, 52, 77)),
                title: const Text('Delete this conversation', style: CustomTextStyle.regularTextBlack),
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
          title: const Text('Block this conversation', style: CustomTextStyle.regularTextBlack),
          content: Text('Are you sure you want to block ${widget.name}?', style: CustomTextStyle.regularTextBlack),
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
          title: const Text('Delete this conversation', style: CustomTextStyle.regularTextBlack),
          content: const Text('Are you sure you want to delete this conversation?', style: CustomTextStyle.regularTextBlack),
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
