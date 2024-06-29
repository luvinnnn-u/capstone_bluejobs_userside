import 'package:flutter/material.dart';
import 'package:bluejobs_user/styles/custom_inkwell_forhome.dart';
import 'package:bluejobs_user/styles/responsive_utils.dart';
import 'package:bluejobs_user/styles/textstyle.dart';
import 'profile_page.dart'; // Import your ProfilePage

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _postController = TextEditingController();

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  void navigateToProfilePage() {
    // Navigate to profile page
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: navigateToProfilePage, // Navigate to profile page on tap
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/marlo.jpg'), // Replace with your profile picture asset
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Employee', // Replace with the user's name
                        style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04)),
                      ),
                      Text(
                        'Lives in Tabaco City', // Replace with the user's location
                        style: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.03)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _postController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'What\'s on your mind?',
              hintStyle: CustomTextStyle.regularText.copyWith(fontSize: responsiveSize(context, 0.04))
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: CustomInkwellForHomeButtonllButton(
                onTap: () {
                  // Add your post submission logic here
                  final postContent = _postController.text;
                  if (postContent.isNotEmpty) {
                    // Implement post submission
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Post submitted: $postContent')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Uh oh, you cant do an empty post')),
                    );
                  }
                },
                child: const Text('Post'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
