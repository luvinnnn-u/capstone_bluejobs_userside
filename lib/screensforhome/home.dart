// import 'package:flutter/material.dart';
// import 'package:bluejobs_user/screensforhome/notification.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             _scrollController.animateTo(
//               0.0,
//               duration: Duration(milliseconds: 500),
//               curve: Curves.easeOut,
//             );
//           },
//           child: Image.asset('assets/images/bluejobs.png'),
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => NotificationsPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: CustomScrollView(
//         controller: _scrollController,
//         slivers: <Widget>[
//           SliverList(
//             delegate: SliverChildListDelegate([
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Image.network(
//                               'https://scontent.fmnl8-1.fna.fbcdn.net/v/t39.30808-6/434586987_1134899767538606_8222820044524326290_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHMggKBYrJZzuV6m7nNuR9ufpF50vbfbth-kXnS9t9u2ELh2U8W5LAmi43B4Ro_pZBh9b-Yr_rxZjbV_yaWQh2q&_nc_ohc=mUqoZRVLFM8Q7kNvgGemt-D&_nc_oc=AdidU0-Q2QRIIKOYSHR2qXNE9Z7d6Edi87SeDybdTh22-jhpy11uWrX-ccgtrMVMI4w&_nc_ht=scontent.fmnl8-1.fna&oh=00_AfBwcX597DrDAlQIJTxZMeS6n3gFPzvzs3ApJw4l1MOMxA&oe=662E9D5B',
//                               width: 50,
//                               height:
//                                   50), // Replace with actual profile picture URL
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           const Expanded(
//                             child: Text(
//                               'Employer',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       const Text(
//                         'Hi I am looking for a plumber who can work for me. Will work mainly on leaking pipes on the sink. 500 pesos would be the payment.',
//                         style: TextStyle(fontStyle: FontStyle.normal),
//                       ),
//                       const SizedBox(height: 10),
//                        Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           InkWell(
//               onTap: () {
//                 // Handle button press
//               },
//               child: Container(
//                 height: 53,
//                 width: 177, // Adjust width as needed
//                 decoration: BoxDecoration(
//                  color: Color.fromARGB(255, 7, 30, 47), // Background color
//                  borderRadius: BorderRadius.circular(5), // Border radius
//                 ),
//                 child: Center(
//                  child: Text(
//                     'Apply Now',
//                     style: TextStyle(
//                       color: Colors.white, // Text color
//                       fontSize: 16,
//                     ),
//                  ),
//                 ),
//               ),
//             ),
//             SizedBox(width: 10), // Space between buttons
//             // Save for Later Button
//             InkWell(
//               onTap: () {
//                 // Handle button press
//               },
//               child: Container(
//                 height: 53,
//                 width: 177, // Adjust width as needed
//                 decoration: BoxDecoration(
//                  border: Border.all(
//                     color: Colors.orange, // Border color
//                     width: 2, // Border width
//                  ),
//                  borderRadius: BorderRadius.circular(5), // Border radius
//                  color: Colors.white, // Background color
//                 ),
//                 child: Center(
//                  child: Text(
//                     'Save for Later',
//                     style: TextStyle(
//                       color: Colors.black, // Text color
//                       fontSize: 16,
//                     ),
//                  ),
//                 ),
//               ),
//             ),

//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               // Add more posts here
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:bluejobs_user/screensforhome/notification.dart';
import 'package:bluejobs_user/styles/textstyle.dart';
import 'package:bluejobs_user/styles/responsive_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _showCommentInput =
      false; // Flag to control the visibility of the comment input
  final TextEditingController _commentController =
      TextEditingController(); // Controller for the comment input

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            _scrollController.animateTo(
              0.0,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOut,
            );
          },
          child: Image.asset('assets/images/bluejobs.png'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            15.0, 20.0, 15.0, 20.0), // Adjust padding as needed
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation:
                      4.0, // Add a slight shadow for better card separation
                  margin: const EdgeInsets.fromLTRB(
                      0.0, 10.0, 0.0, 10.0), // Remove margin for inner padding
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/meanne.jpg'), // Use AssetImage for local images
                              radius: 40,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Employer',
                              style: //CustomTextStyle.semiBoldText
                                  CustomTextStyle.regularText.copyWith(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: responsiveSize(context, 0.04)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Hi I am looking for a plumber who can work for me. Will work mainly on leaking pipes on the sink. 500 pesos would be the payment.',
                          style: CustomTextStyle.regularText,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                // Handle button press
                              },
                              child: Container(
                                height: 53,
                                width: 165, // Adjust width as needed
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(
                                      255, 7, 30, 47), // Background color
                                  borderRadius:
                                      BorderRadius.circular(5), // Border radius
                                ),
                                child: Center(
                                  child: Text(
                                    'Apply Now',
                                    // style: TextStyle(
                                    //   color: Colors.white, // Text color
                                    //   fontSize: 16,
                                    // ),
                                    style: CustomTextStyle.regularText.copyWith(
                                        color: Colors.white,
                                        fontSize:
                                            responsiveSize(context, 0.03)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10), // Space between buttons
                            InkWell(
                              onTap: () {
                                // Handle button press
                              },
                              child: Container(
                                height: 53,
                                width: 165, // Adjust width as needed
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.orange, // Border color
                                    width: 2, // Border width
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(5), // Border radius
                                  color: Colors.white, // Background
                                ),
                                child: Center(
                                  child: Text(
                                    'Save for Later',
                                    // style: TextStyle(
                                    //   color: Color.fromARGB(
                                    //       255, 0, 0, 0), // Text color
                                    //   fontSize: 16,
                                    style: CustomTextStyle.regularText.copyWith(
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontSize:
                                            responsiveSize(context, 0.03)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Add more cards here as needed
                Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation:
                      4.0, // Add a slight shadow for better card separation
                  margin: const EdgeInsets.fromLTRB(
                      0.0, 10.0, 0.0, 10.0), // Remove margin for inner padding
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/marlo.jpg'), // Use AssetImage for local images
                              radius: 40,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'User',
                              style: //CustomTextStyle.semiBoldText
                                  CustomTextStyle.regularText.copyWith(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: responsiveSize(context, 0.04)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Hi I am looking for work. 500 pesos would be the payment.',
                          style: CustomTextStyle.regularText,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.thumb_up_alt_rounded),
                              onPressed: () {
                                // Add logic for liking the post
                              },
                            ),
                            Text(
                              'React',
                              style: CustomTextStyle.regularText,
                            ),
                            SizedBox(width: 85),
                            InkWell(
                              onTap: () {
                                // Toggle visibility of comment input field and post button
                                setState(() {
                                  _showCommentInput = !_showCommentInput;
                                });
                              },
                              child: Text(
                                'Comment',
                                style: CustomTextStyle.regularText,
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _showCommentInput,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align items at the start of the cross axis
                            children: [
                              Expanded(
                                child: Container(
                                  height: 53,
                                  child: TextFormField(
                                    controller:
                                        _commentController, // Define a TextEditingController
                                    decoration: InputDecoration(
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
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 53, // Set the height of the container
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 7, 30,
                                      47), // Set the background color to blue
                                  borderRadius: BorderRadius.circular(
                                      5), // Set the border radius to 5
                                ),
                                child: InkWell(
                                  onTap: () {
                                    // Add logic for posting the comment
                                    // String commentText = _commentController.text;
                                    // Process the commentText (e.g., post it, clear the input field, etc.)
                                    // Clear the input field
                                    _commentController.clear();
                                    // Hide the comment input field and post button after posting the comment
                                    setState(() {
                                      _showCommentInput = false;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      'Post',
                                      // style: TextStyle(
                                      //   color: Colors.white, // Set the text color to white
                                      //   fontSize: 16, // Adjust font size as needed
                                      // ),
                                      style: CustomTextStyle.regularText
                                          .copyWith(color: Colors.white),
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
                ),
                //try
                Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation:
                      4.0, // Add a slight shadow for better card separation
                  margin: const EdgeInsets.fromLTRB(
                      0.0, 10.0, 0.0, 10.0), // Remove margin for inner padding
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/marlo.jpg'), // Use AssetImage for local images
                              radius: 40,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'User',
                              style: //CustomTextStyle.semiBoldText
                                  CustomTextStyle.regularText.copyWith(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: responsiveSize(context, 0.04)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Hi I am looking for work. 500 pesos would be the payment.',
                          style: CustomTextStyle.regularText,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.thumb_up_alt_rounded),
                              onPressed: () {
                                // Add logic for liking the post
                              },
                            ),
                            Text(
                              'React',
                              style: CustomTextStyle.regularText,
                            ),
                            SizedBox(width: 85),
                            InkWell(
                              onTap: () {
                                // Toggle visibility of comment input field and post button
                                setState(() {
                                  _showCommentInput = !_showCommentInput;
                                });
                              },
                              child: Text(
                                'Comment',
                                style: CustomTextStyle.regularText,
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _showCommentInput,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align items at the start of the cross axis
                            children: [
                              Expanded(
                                child: Container(
                                  height: 53,
                                  child: TextFormField(
                                    controller:
                                        _commentController, // Define a TextEditingController
                                    decoration: InputDecoration(
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
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 53, // Set the height of the container
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 7, 30,
                                      47), // Set the background color to blue
                                  borderRadius: BorderRadius.circular(
                                      5), // Set the border radius to 5
                                ),
                                child: InkWell(
                                  onTap: () {
                                    // Add logic for posting the comment
                                    // String commentText = _commentController.text;
                                    // Process the commentText (e.g., post it, clear the input field, etc.)
                                    // Clear the input field
                                    _commentController.clear();
                                    // Hide the comment input field and post button after posting the comment
                                    setState(() {
                                      _showCommentInput = false;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      'Post',
                                      style: CustomTextStyle.regularText
                                          .copyWith(color: Colors.white),
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
                ),
                Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation:
                      4.0, // Add a slight shadow for better card separation
                  margin: const EdgeInsets.fromLTRB(
                      0.0, 10.0, 0.0, 10.0), // Remove margin for inner padding
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/marlo.jpg'), // Use AssetImage for local images
                              radius: 40,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'User',
                              style: //CustomTextStyle.semiBoldText
                                  CustomTextStyle.regularText.copyWith(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: responsiveSize(context, 0.04)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Hi I am looking for work. 500 pesos would be the payment.',
                          style: CustomTextStyle.regularText,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.thumb_up_alt_rounded),
                              onPressed: () {
                                // Add logic for liking the post
                              },
                            ),
                            Text(
                              'React',
                              style: CustomTextStyle.regularText,
                            ),
                            SizedBox(width: 85),
                            InkWell(
                              onTap: () {
                                // Toggle visibility of comment input field and post button
                                setState(() {
                                  _showCommentInput = !_showCommentInput;
                                });
                              },
                              child: Text(
                                'Comment',
                                style: CustomTextStyle.regularText,
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _showCommentInput,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align items at the start of the cross axis
                            children: [
                              Expanded(
                                child: Container(
                                  height: 53,
                                  child: TextFormField(
                                    controller:
                                        _commentController, // Define a TextEditingController
                                    decoration: InputDecoration(
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
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 53, // Set the height of the container
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 7, 30,
                                      47), // Set the background color to blue
                                  borderRadius: BorderRadius.circular(
                                      5), // Set the border radius to 5
                                ),
                                child: InkWell(
                                  onTap: () {
                                    // Add logic for posting the comment
                                    // String commentText = _commentController.text;
                                    // Process the commentText (e.g., post it, clear the input field, etc.)
                                    // Clear the input field
                                    _commentController.clear();
                                    // Hide the comment input field and post button after posting the comment
                                    setState(() {
                                      _showCommentInput = false;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      'Post',
                                      // style: TextStyle(
                                      //   color: Colors.white, // Set the text color to white
                                      //   fontSize: 16, // Adjust font size as needed
                                      // ),
                                      style: CustomTextStyle.regularText
                                          .copyWith(color: Colors.white),
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
                ),
                Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation:
                      4.0, // Add a slight shadow for better card separation
                  margin: const EdgeInsets.fromLTRB(
                      0.0, 10.0, 0.0, 10.0), // Remove margin for inner padding
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/marlo.jpg'), // Use AssetImage for local images
                              radius: 40,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'User',
                              style: //CustomTextStyle.semiBoldText
                                  CustomTextStyle.regularText.copyWith(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: responsiveSize(context, 0.04)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Hi I am looking for work. 500 pesos would be the payment.',
                          style: CustomTextStyle.regularText,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.thumb_up_alt_rounded),
                              onPressed: () {
                                // Add logic for liking the post
                              },
                            ),
                            Text(
                              'React',
                              style: CustomTextStyle.regularText,
                            ),
                            SizedBox(width: 85),
                            InkWell(
                              onTap: () {
                                // Toggle visibility of comment input field and post button
                                setState(() {
                                  _showCommentInput = !_showCommentInput;
                                });
                              },
                              child: Text(
                                'Comment',
                                style: CustomTextStyle.regularText,
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _showCommentInput,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align items at the start of the cross axis
                            children: [
                              Expanded(
                                child: Container(
                                  height: 53,
                                  child: TextFormField(
                                    controller:
                                        _commentController, // Define a TextEditingController
                                    decoration: InputDecoration(
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
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 53, // Set the height of the container
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 7, 30,
                                      47), // Set the background color to blue
                                  borderRadius: BorderRadius.circular(
                                      5), // Set the border radius to 5
                                ),
                                child: InkWell(
                                  onTap: () {
                                    // Add logic for posting the comment
                                    // String commentText = _commentController.text;
                                    // Process the commentText (e.g., post it, clear the input field, etc.)
                                    // Clear the input field
                                    _commentController.clear();
                                    // Hide the comment input field and post button after posting the comment
                                    setState(() {
                                      _showCommentInput = false;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      'Post',
                                      // style: TextStyle(
                                      //   color: Colors.white, // Set the text color to white
                                      //   fontSize: 16, // Adjust font size as needed
                                      // ),
                                      style: CustomTextStyle.regularText
                                          .copyWith(color: Colors.white),
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
                ),
                Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation:
                      4.0, // Add a slight shadow for better card separation
                  margin: const EdgeInsets.fromLTRB(
                      0.0, 10.0, 0.0, 10.0), // Remove margin for inner padding
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/marlo.jpg'), // Use AssetImage for local images
                              radius: 40,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'User',
                              style: //CustomTextStyle.semiBoldText
                                  CustomTextStyle.regularText.copyWith(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: responsiveSize(context, 0.04)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Hi I am looking for work. 500 pesos would be the payment.',
                          style: CustomTextStyle.regularText,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.thumb_up_alt_rounded),
                              onPressed: () {
                                // Add logic for liking the post
                              },
                            ),
                            Text(
                              'React',
                              style: CustomTextStyle.regularText,
                            ),
                            SizedBox(width: 85),
                            InkWell(
                              onTap: () {
                                // Toggle visibility of comment input field and post button
                                setState(() {
                                  _showCommentInput = !_showCommentInput;
                                });
                              },
                              child: Text(
                                'Comment',
                                style: CustomTextStyle.regularText,
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _showCommentInput,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align items at the start of the cross axis
                            children: [
                              Expanded(
                                child: Container(
                                  height: 53,
                                  child: TextFormField(
                                    controller:
                                        _commentController, // Define a TextEditingController
                                    decoration: InputDecoration(
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
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 53, // Set the height of the container
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 7, 30,
                                      47), // Set the background color to blue
                                  borderRadius: BorderRadius.circular(
                                      5), // Set the border radius to 5
                                ),
                                child: InkWell(
                                  onTap: () {
                                    // Add logic for posting the comment
                                    // String commentText = _commentController.text;
                                    // Process the commentText (e.g., post it, clear the input field, etc.)
                                    // Clear the input field
                                    _commentController.clear();
                                    // Hide the comment input field and post button after posting the comment
                                    setState(() {
                                      _showCommentInput = false;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      'Post',
                                      // style: TextStyle(
                                      //   color: Colors.white, // Set the text color to white
                                      //   fontSize: 16, // Adjust font size as needed
                                      // ),
                                      style: CustomTextStyle.regularText
                                          .copyWith(color: Colors.white),
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
                ),
                Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation:
                      4.0, // Add a slight shadow for better card separation
                  margin: const EdgeInsets.fromLTRB(
                      0.0, 10.0, 0.0, 10.0), // Remove margin for inner padding
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/marlo.jpg'), // Use AssetImage for local images
                              radius: 40,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'User',
                              style: //CustomTextStyle.semiBoldText
                                  CustomTextStyle.regularText.copyWith(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: responsiveSize(context, 0.04)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Hi I am looking for work. 500 pesos would be the payment.',
                          style: CustomTextStyle.regularText,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.thumb_up_alt_rounded),
                              onPressed: () {
                                // Add logic for liking the post
                              },
                            ),
                            Text(
                              'React',
                              style: CustomTextStyle.regularText,
                            ),
                            SizedBox(width: 85),
                            InkWell(
                              onTap: () {
                                // Toggle visibility of comment input field and post button
                                setState(() {
                                  _showCommentInput = !_showCommentInput;
                                });
                              },
                              child: Text(
                                'Comment',
                                style: CustomTextStyle.regularText,
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _showCommentInput,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align items at the start of the cross axis
                            children: [
                              Expanded(
                                child: Container(
                                  height: 53,
                                  child: TextFormField(
                                    controller:
                                        _commentController, // Define a TextEditingController
                                    decoration: InputDecoration(
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
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 53, // Set the height of the container
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 7, 30,
                                      47), // Set the background color to blue
                                  borderRadius: BorderRadius.circular(
                                      5), // Set the border radius to 5
                                ),
                                child: InkWell(
                                  onTap: () {
                                    // Add logic for posting the comment
                                    // String commentText = _commentController.text;
                                    // Process the commentText (e.g., post it, clear the input field, etc.)
                                    // Clear the input field
                                    _commentController.clear();
                                    // Hide the comment input field and post button after posting the comment
                                    setState(() {
                                      _showCommentInput = false;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      'Post',
                                      // style: TextStyle(
                                      //   color: Colors.white, // Set the text color to white
                                      //   fontSize: 16, // Adjust font size as needed
                                      // ),
                                      style: CustomTextStyle.regularText
                                          .copyWith(color: Colors.white),
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
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
