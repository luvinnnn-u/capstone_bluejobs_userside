import 'package:flutter/material.dart';
import 'package:bluejobs_user/screensforhome/notification.dart';
import 'package:bluejobs_user/styles/textstyle.dart';
import 'package:bluejobs_user/styles/responsive_utils.dart';

enum UserType { employer, regularUser }

class Post {
  final String avatarImagePath;
  final String username;
  final String content;
  final String place;
  final bool isEmployer;

  Post({
    required this.avatarImagePath,
    required this.username,
    required this.content,
    required this.place,
    required this.isEmployer,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _commentController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Map<int, bool> _showCommentInput = {};

  final List<Post> posts = [
    Post(
      avatarImagePath: 'assets/images/meanne.jpg',
      username: 'Employer',
      content: 'Hi I am looking for a plumber who can work for me. Will work mainly on leaking pipes on the sink. 500 pesos would be the payment.',
      place: 'Lives in Albay',
      isEmployer: true,
    ),
    Post(
      avatarImagePath: 'assets/images/marlo.jpg',
      username: 'Employee',
      content: 'Hi I am looking for work. 500 pesos would be the payment.',
      place: 'Lives in Albay',
      isEmployer: false,
    ),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handlePopupMenuItem(String value, int index) {
    switch (value) {
      case 'edit':
        // Add logic to edit the post
        break;
      case 'delete':
        // Add logic to delete the post
        setState(() {
          posts.removeAt(index);
        });
        break;
      case 'hide':
        // Add logic to hide the post
        break;
      case 'report':
        // Add logic to report the post
        break;
      default:
        // Handle unexpected values
        break;
    }
  }

  void _handleSharePost(int index) {
    // Add logic to share the post
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            _scrollController.animateTo(
              0.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
            );
          },
          child: Image.asset('assets/images/bluejobs.png'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0), // Adjust padding as needed
        child: ListView.builder(
          controller: _scrollController,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            // Initialize the visibility state for this post if it's not already set
            if (!_showCommentInput.containsKey(index)) {
              _showCommentInput[index] = false;
            }
            return Card(
              color: const Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 4.0,
              margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(post.avatarImagePath),
                          radius: 40,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.username,
                                style: CustomTextStyle.semiBoldText.copyWith(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: responsiveSize(context, 0.05),
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_pin,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    post.place,
                                    style: CustomTextStyle.regularText.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            _handlePopupMenuItem(value, index);
                          },
                          itemBuilder: (BuildContext context) {
                            return post.isEmployer
                                ? [
                                    const PopupMenuItem<String>(
                                      value: 'hide',
                                      child: Text('Do not show me this post'),
                                    ),
                                    const PopupMenuItem<String>(
                                      value: 'report',
                                      child: Text('Report this post'),
                                    ),
                                  ]
                                : [
                                    const PopupMenuItem<String>(
                                      value: 'edit',
                                      child: Text('Edit my post'),
                                    ),
                                    const PopupMenuItem<String>(
                                      value: 'delete',
                                      child: Text('Delete my post'),
                                    ),
                                  ];
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      post.content,
                      style: CustomTextStyle.regularText,
                    ),
                    const SizedBox(height: 15),
                    // Render different buttons based on user type
                    post.isEmployer
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Handle button press
                                },
                                child: Container(
                                  height: 53,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 7, 30, 47),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Apply Now',
                                      style: CustomTextStyle.regularText.copyWith(
                                        color: Colors.white,
                                        fontSize: responsiveSize(context, 0.03),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  // Handle button press
                                },
                                child: Container(
                                  height: 53,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.orange,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Save for Later',
                                      style: CustomTextStyle.regularText.copyWith(
                                        color: const Color.fromARGB(255, 0, 0, 0),
                                        fontSize: responsiveSize(context, 0.03),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Add logic for liking the post
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.thumb_up_alt_rounded),
                                    const SizedBox(width: 5),
                                    Text(
                                      'React',
                                      style: CustomTextStyle.regularText,
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // Toggle visibility of comment input field and post button for this post
                                  setState(() {
                                    _showCommentInput[index] = !_showCommentInput[index]!;
                                  });
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.comment),
                                    const SizedBox(width: 5),
                                    Text(
                                      'Comment',
                                      style: CustomTextStyle.regularText,
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _handleSharePost(index);
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.share),
                                    const SizedBox(width: 5),
                                    Text(
                                      'Share',
                                      style: CustomTextStyle.regularText,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                    // Visibility widget for comment input
                    const SizedBox(height: 15,),
                    Visibility(
                      visible: _showCommentInput[index] ?? false,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: 53,
                              child: TextFormField(
                                controller: _commentController,
                                decoration: const InputDecoration(
                                  hintText: 'Write your comment...',
                                  hintStyle: CustomTextStyle.regularText,
                                  border: OutlineInputBorder(),
                                ),
                                minLines: 1,
                                maxLines: 3,
                                textAlignVertical: TextAlignVertical.center,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 53,
                            width: 70,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 
7, 30, 47),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: InkWell(
                              onTap: () {
                                // Add logic for posting the comment
                              },
                              child: Center(
                                child: Text(
                                  'Post',
                                  style: CustomTextStyle.regularText.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

