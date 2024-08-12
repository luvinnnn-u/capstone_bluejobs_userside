// // // import 'package:flutter/material.dart';
// // // import 'package:bluejobs_user/styles/textstyle.dart';
// // // import 'package:bluejobs_user/styles/responsive_utils.dart';

// // // class ProfilePage extends StatefulWidget {
// // //   const ProfilePage({super.key});

// // //   @override
// // //   State<ProfilePage> createState() => _ProfilePageState();
// // // }

// // // class _ProfilePageState extends State<ProfilePage> {
// // //   final double coverHeight = 200;
// // //   final double profileHeight = 100;
// // //   final TextEditingController _commentController = TextEditingController();

// // //   Map<int, bool> _showCommentInput = {};
// // //   List<User> users = [];

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return DefaultTabController(
// // //       length: 4, // Number of tabs
// // //       child: Scaffold(
// // //         appBar: AppBar(),
// // //         body: ListView.builder(
// // //           itemCount: 6, // Number of items in the ListView
// // //           itemBuilder: (BuildContext context, int index) {
// // //             if (index == 0) {
// // //               return Stack(
// // //                 alignment: Alignment.center,
// // //                 clipBehavior: Clip.none,
// // //                 children: [
// // //                   buildCoverImage(),
// // //                   Positioned(
// // //                     top: coverHeight - profileHeight / 2,
// // //                     child: buildProfilePicture(),
// // //                   ),
// // //                 ],
// // //               );
// // //             } else if (index == 1) {
// // //               return SizedBox(height: profileHeight / 2 + 16);
// // //             } else if (index == 2) {
// // //               return buildProfileName();
// // //             } else if (index == 3) {
// // //               return SizedBox(height: 16);
// // //             } else if (index == 4) {
// // //               return buildTabBar();
// // //             } else {
// // //               return Container(
// // //                 height: 500, // Height of TabBarView
// // //                 child: buildTabBarView(),
// // //               );
// // //             }
// // //           },
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget buildCoverImage() => Container(
// // //         color: Colors.grey,
// // //         child: Image.asset(
// // //           'assets/images/marlo.jpg',
// // //           width: double.infinity,
// // //           height: coverHeight,
// // //           fit: BoxFit.cover,
// // //         ),
// // //       );

// // //   Widget buildProfilePicture() => CircleAvatar(
// // //         radius: profileHeight / 2,
// // //         backgroundImage: AssetImage('assets/images/marlo.jpg'),
// // //         backgroundColor: Colors.white,
// // //       );

// // //   Widget buildProfileName() => const Center(
// // //         child: Column(
// // //           children: [
// // //             Text(
// // //               'Employee',
// // //               style: CustomTextStyle.semiBoldText,
// // //             ),
// // //             SizedBox(height: 4),
// // //             // Text(
// // //             //   'lflflf',
// // //             //   style: CustomTextStyle.regularText,
// // //             // ),
// // //           ],
// // //         ),
// // //       );

// // //   Widget buildTabBar() => Container(
// // //         alignment: Alignment.center,
// // //         child: TabBar(
// // //           isScrollable: true,
// // //           tabs: [
// // //             Container(
// // //               width: MediaQuery.of(context).size.width / 4,
// // //               child: Tab(text: 'My Posts'),
// // //             ),
// // //             Container(
// // //               width: MediaQuery.of(context).size.width / 4,
// // //               child: Tab(text: 'Resume'),
// // //             ),
// // //             Container(
// // //               width: MediaQuery.of(context).size.width / 4,
// // //               child: Tab(text: 'Connections'),
// // //             ),
// // //             Container(
// // //               width: MediaQuery.of(context).size.width / 4,
// // //               child: Tab(text: 'About'),
// // //             ),
// // //           ],
// // //           labelColor: Color.fromARGB(255, 0, 0, 0), // Text color of selected tab
// // //           unselectedLabelColor: Color.fromARGB(255, 124, 118, 118),
// // //           labelStyle: CustomTextStyle.regularText,
// // //         ),
// // //       );

// // //   Widget buildTabBarView() => TabBarView(
// // //         children: [
// // //           buildMyPostsTab(),
// // //           buildResumeTab(),
// // //           buildConnectionsTab(), // Updated to include Connections tab
// // //           Center(child: Text('About')),
// // //         ],
// // //       );

// // //   Widget buildMyPostsTab() {
// // //     final posts = [
// // //       Post(
// // //         avatarImagePath: 'assets/images/marlo.jpg',
// // //         username: 'Employee',
// // //         content: 'Looking for house cleaning jobs. Please contact me for more details.',
// // //         location: 'Lives in Albay', // Example location for an employee
// // //         isEmployer: false,
// // //       ),
// // //       // Add more posts if needed
// // //     ];

// // //     return ListView.builder(
// // //       padding: const EdgeInsets.all(10.0),
// // //       itemCount: posts.length,
// // //       itemBuilder: (context, index) {
// // //         final post = posts[index];
// // //         return Card(
// // //           color: Colors.white,
// // //           shape: RoundedRectangleBorder(
// // //             borderRadius: BorderRadius.circular(10),
// // //           ),
// // //           elevation: 4.0,
// // //           margin: const EdgeInsets.symmetric(vertical: 10.0),
// // //           child: Padding(
// // //             padding: const EdgeInsets.all(16.0),
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Row(
// // //                   children: [
// // //                     CircleAvatar(
// // //                       backgroundImage: AssetImage(post.avatarImagePath),
// // //                       radius: 40,
// // //                     ),
// // //                     const SizedBox(width: 20),
// // //                     Expanded(
// // //                       child: Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           Text(
// // //                             post.username,
// // //                             style: CustomTextStyle.semiBoldText.copyWith(
// // //                               color: Colors.black,
// // //                               fontSize: 18.0,
// // //                             ),
// // //                           ),
// // //                           SizedBox(height: 4.0),
// // //                           Row(
// // //                             children: [
// // //                               const Icon(Icons.location_on,
// // //                                   size: 16.0, color: Colors.grey),
// // //                               SizedBox(width: 4.0),
// // //                               Text(
// // //                                 post.location,
// // //                                 style: const TextStyle(
// // //                                   color: Colors.grey,
// // //                                   fontSize: 14.0,
// // //                                 ),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                     PopupMenuButton<String>(
// // //                       onSelected: (value) {},
// // //                       itemBuilder: (BuildContext context) {
// // //                         return [
// // //                           const PopupMenuItem<String>(
// // //                             value: 'edit',
// // //                             child: Text('Edit my post'),
// // //                           ),
// // //                           const PopupMenuItem<String>(
// // //                             value: 'delete',
// // //                             child: Text('Delete my post'),
// // //                           ),
// // //                         ];
// // //                       },
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 20),
// // //                 Text(
// // //                   post.content,
// // //                   style: CustomTextStyle.regularText,
// // //                 ),
// // //                const SizedBox(height: 15),
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                   children: [
// // //                     InkWell(
// // //                       onTap: () {},
// // //                       child: const Row(
// // //                         children: [
// // //                           Icon(Icons.thumb_up_alt_rounded),
// // //                           SizedBox(width: 5),
// // //                           Text(
// // //                             'React',
// // //                             style: CustomTextStyle.regularText,
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                     InkWell(
// // //                       onTap: () {},
// // //                       child: const Row(
// // //                         children: [
// // //                           Icon(Icons.comment),
// // //                           SizedBox(width: 5),
// // //                           Text(
// // //                             'Comment',
// // //                             style: CustomTextStyle.regularText,
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                     InkWell(
// // //                       onTap: () {},
// // //                       child: const Row(
// // //                         children: [
// // //                           Icon(Icons.share),
// // //                           SizedBox(width: 5),
// // //                           Text(
// // //                             'Share',
// // //                             style: CustomTextStyle.regularText,
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 15,),
// // //                 Visibility(
// // //                   visible: _showCommentInput[index]?? false,
// // //                   child: Row(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       Expanded(
// // //                         child: Container(
// // //                           height: 53,
// // //                           child: TextFormField(
// // //                             controller: _commentController,
// // //                             decoration: const InputDecoration(
// // //                               hintText: 'Write your comment...',
// // //                               hintStyle: CustomTextStyle.regularText,
// // //                               border: OutlineInputBorder(),
// // //                             ),
// // //                             minLines: 1,
// // //                             maxLines: 3,
// // //                             textAlignVertical: TextAlignVertical.center,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                       const SizedBox(width: 10),
// // //                       Container(
// // //                         height: 53,
// // //                         width: 70,
// // //                         decoration: BoxDecoration(
// // //                           color: const Color.fromARGB(255, 7, 30, 47),
// // //                           borderRadius: BorderRadius.circular(5),
// // //                         ),
// // //                         child: InkWell(
// // //                           onTap: () {},
// // //                           child: Center(
// // //                             child: Text(
// // //                               'Post',
// // //                               style: CustomTextStyle.regularText.copyWith(
// // //                                 color: Colors.white,
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         );
// // //      // );
// // //     },
// // //   );
// // // }

// // //   Widget buildResumeTab() => SingleChildScrollView(
// // //         padding: const EdgeInsets.all(10.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             buildResumeItem('Name', 'Marlo'),
// // //             buildResumeItem('Age', '21'),
// // //             buildResumeItem('Contact Number', '09637077358'),
// // //             buildResumeItem('Sex', 'Male'),
// // //             buildResumeItem('Address', 'San Antonio, Tabaco City'),
// // //             // buildResumeItem('Tell me about yourself',
// // //             //     'I am a Flutter developer with 5 years of experience in building mobile applications. I love coding and am always eager to learn new technologies.'),
// // //             buildResumeItem('Specialization', 'Housecleaning'),
// // //           ],
// // //         ),
// // //       );

// // //   Widget buildResumeItem(String title, String content) {
// // //   return Padding(
// // //     padding: const EdgeInsets.only(bottom: 10.0),
// // //     child: RichText(
// // //       text: TextSpan(
// // //         children: [
// // //           TextSpan(
// // //             text: '$title: ',
// // //             style: CustomTextStyle.regularText.copyWith(
// // //               fontWeight: FontWeight.bold,
// // //               fontSize: responsiveSize(context, 0.03),
// // //             ),
// // //           ),
// // //           TextSpan(
// // //             text: content,
// // //             style: CustomTextStyle.regularText.copyWith(
// // //               fontSize: responsiveSize(context, 0.03),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     ),
// // //   );
// // // }

// // //   Widget buildConnectionsTab() {
// // //     final users = [
// // //       User(
// // //         profileImagePath: 'assets/images/meanne.jpg',
// // //         username: 'Meanne Employer',
// // //       ),
// // //     ];

// // //     return Padding(
// // //       padding: const EdgeInsets.all(16.0),
// // //       child: ListView.builder(
// // //         itemCount: users.length,
// // //         itemBuilder: (context, index) {
// // //           final user = users[index];
// // //           return ListTile(
// // //             leading: CircleAvatar(
// // //               backgroundImage: AssetImage(user.profileImagePath),
// // //             ),
// // //             title: Text(
// // //               user.username,
// // //               style: CustomTextStyle.regularText,
// // //             ),
// // //             trailing: InkWell(
// // //               onTap: () => _showConfirmationDialog(context, index),
// // //               child: Container(
// // //                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// // //                 decoration: BoxDecoration(
// // //                   color: Color.fromARGB(255, 19, 52, 77),
// // //                   borderRadius: BorderRadius.circular(5),
// // //                 ),
// // //                 child: Text(
// // //                   'Unfriend',
// // //                   style: CustomTextStyle.regularText.copyWith(
// // //                     color: Colors.white,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }

// // //   void _showConfirmationDialog(BuildContext context, int index) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           //title: Text('Are you sure?', style: TextStyle(color: Colors.blue)),
// // //           content: Text('Do you want to delete this user?', style: TextStyle(color: Colors.black)),
// // //           actions: <Widget>[
// // //              TextButton(
// // //               child: Text('Yes', style: TextStyle(color: Colors.blue)),
// // //               onPressed: () {
// // //                 print('User ${users[index].username} unfriended.');
// // //                 Navigator.of(context).pop();
// // //               }),
// // //             TextButton(
// // //               child: Text('No', style: TextStyle(color: Colors.orange)),
// // //               onPressed: () {
// // //                 Navigator.of(context).pop();
// // //               }),

// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // // }

// // // class Post {
// // //   final String avatarImagePath;
// // //   final String username;
// // //   final String content;
// // //   final bool isEmployer;
// // //   final String location;

// // //   Post({
// // //     required this.avatarImagePath,
// // //     required this.username,
// // //     required this.content,
// // //     required this.isEmployer,
// // //     required this.location,
// // //   });
// // // }

// // // class User {
// // //   final String profileImagePath;
// // //   final String username;

// // //   User({
// // //     required this.profileImagePath,
// // //     required this.username,
// // //   });
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:bluejobs_user/styles/textstyle.dart';
// // import 'package:bluejobs_user/styles/responsive_utils.dart';

// // class ProfilePage extends StatefulWidget {
// //   const ProfilePage({super.key});

// //   @override
// //   State<ProfilePage> createState() => _ProfilePageState();
// // }

// // class _ProfilePageState extends State<ProfilePage> {
// //   final double coverHeight = 200;
// //   final double profileHeight = 100;
// //   final TextEditingController _commentController = TextEditingController();

// //   Map<int, bool> _showCommentInput = {};
// //   List<User> users = [];

// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: 4, // Number of tabs
// //       child: Scaffold(
// //         appBar: AppBar(),
// //         body: ListView.builder(
// //           itemCount: 6, // Number of items in the ListView
// //           itemBuilder: (BuildContext context, int index) {
// //             if (index == 0) {
// //               return Stack(
// //                 alignment: Alignment.center,
// //                 clipBehavior: Clip.none,
// //                 children: [
// //                   buildCoverImage(),
// //                   Positioned(
// //                     top: coverHeight - profileHeight / 2,
// //                     child: buildProfilePicture(),
// //                   ),
// //                 ],
// //               );
// //             } else if (index == 1) {
// //               return SizedBox(height: profileHeight / 2 + 16);
// //             } else if (index == 2) {
// //               return buildProfileName();
// //             } else if (index == 3) {
// //               return SizedBox(height: 16);
// //             } else if (index == 4) {
// //               return buildTabBar();
// //             } else {
// //               return Container(
// //                 height: 500, // Height of TabBarView
// //                 child: buildTabBarView(),
// //               );
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }

// //   Widget buildCoverImage() => Container(
// //         color: Colors.grey,
// //         child: Image.asset(
// //           'assets/images/marlo.jpg',
// //           width: double.infinity,
// //           height: coverHeight,
// //           fit: BoxFit.cover,
// //         ),
// //       );

// //   Widget buildProfilePicture() => CircleAvatar(
// //         radius: profileHeight / 2,
// //         backgroundImage: AssetImage('assets/images/marlo.jpg'),
// //         backgroundColor: Colors.white,
// //       );

// //   Widget buildProfileName() => const Center(
// //         child: Column(
// //           children: [
// //             Text(
// //               'Employee',
// //               style: CustomTextStyle.semiBoldText,
// //             ),
// //             SizedBox(height: 4),
// //           ],
// //         ),
// //       );

// //   Widget buildTabBar() => Container(
// //         alignment: Alignment.center,
// //         child: TabBar(
// //           isScrollable: true,
// //           tabs: [
// //             Container(
// //               width: MediaQuery.of(context).size.width / 4,
// //               child: Tab(text: 'My Posts'),
// //             ),
// //             Container(
// //               width: MediaQuery.of(context).size.width / 4,
// //               child: Tab(text: 'Resume'),
// //             ),
// //             Container(
// //               width: MediaQuery.of(context).size.width / 4,
// //               child: Tab(text: 'Connections'),
// //             ),
// //             Container(
// //               width: MediaQuery.of(context).size.width / 4,
// //               child: Tab(text: 'About'),
// //             ),
// //           ],
// //           labelColor: Color.fromARGB(255, 0, 0, 0), // Text color of selected tab
// //           unselectedLabelColor: Color.fromARGB(255, 124, 118, 118),
// //           labelStyle: CustomTextStyle.regularText,
// //         ),
// //       );

// //   Widget buildTabBarView() => TabBarView(
// //         children: [
// //           buildMyPostsTab(),
// //           buildResumeTab(),
// //           buildConnectionsTab(), // Updated to include Connections tab
// //           buildAboutTab(),
// //         ],
// //       );

// //   Widget buildMyPostsTab() {
// //     final posts = [
// //       Post(
// //         avatarImagePath: 'assets/images/marlo.jpg',
// //         username: 'Employee',
// //         content: 'Looking for house cleaning jobs. Please contact me for more details.',
// //         location: 'Lives in Albay', // Example location for an employee
// //         isEmployer: false,
// //       ),
// //       // Add more posts if needed
// //     ];

// //     return ListView.builder(
// //       padding: const EdgeInsets.all(10.0),
// //       itemCount: posts.length,
// //       itemBuilder: (context, index) {
// //         final post = posts[index];
// //         return Card(
// //           color: Colors.white,
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(10),
// //           ),
// //           elevation: 4.0,
// //           margin: const EdgeInsets.symmetric(vertical: 10.0),
// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Row(
// //                   children: [
// //                     CircleAvatar(
// //                       backgroundImage: AssetImage(post.avatarImagePath),
// //                       radius: 40,
// //                     ),
// //                     const SizedBox(width: 20),
// //                     Expanded(
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             post.username,
// //                             style: CustomTextStyle.semiBoldText.copyWith(
// //                               color: Colors.black,
// //                               fontSize: 18.0,
// //                             ),
// //                           ),
// //                           SizedBox(height: 4.0),
// //                           Row(
// //                             children: [
// //                               const Icon(Icons.location_on, size: 16.0, color: Colors.grey),
// //                               SizedBox(width: 4.0),
// //                               Text(
// //                                 post.location,
// //                                 style: const TextStyle(
// //                                   color: Colors.grey,
// //                                   fontSize: 14.0,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     PopupMenuButton<String>(
// //                       onSelected: (value) {},
// //                       itemBuilder: (BuildContext context) {
// //                         return [
// //                           const PopupMenuItem<String>(
// //                             value: 'edit',
// //                             child: Text('Edit my post'),
// //                           ),
// //                           const PopupMenuItem<String>(
// //                             value: 'delete',
// //                             child: Text('Delete my post'),
// //                           ),
// //                         ];
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 20),
// //                 Text(
// //                   post.content,
// //                   style: CustomTextStyle.regularText,
// //                 ),
// //                 const SizedBox(height: 15),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                   children: [
// //                     InkWell(
// //                       onTap: () {},
// //                       child: const Row(
// //                         children: [
// //                           Icon(Icons.thumb_up_alt_rounded),
// //                           SizedBox(width: 5),
// //                           Text(
// //                             'React',
// //                             style: CustomTextStyle.regularText,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     InkWell(
// //                       onTap: () {},
// //                       child: const Row(
// //                         children: [
// //                           Icon(Icons.comment),
// //                           SizedBox(width: 5),
// //                           Text(
// //                             'Comment',
// //                             style: CustomTextStyle.regularText,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     InkWell(
// //                       onTap: () {},
// //                       child: const Row(
// //                         children: [
// //                           Icon(Icons.share),
// //                           SizedBox(width: 5),
// //                           Text(
// //                             'Share',
// //                             style: CustomTextStyle.regularText,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 15,),
// //                 Visibility(
// //                   visible: _showCommentInput[index]?? false,
// //                   child: Row(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Expanded(
// //                         child: Container(
// //                           height: 53,
// //                           child: TextFormField(
// //                             controller: _commentController,
// //                             decoration: const InputDecoration(
// //                               hintText: 'Write your comment...',
// //                               hintStyle: CustomTextStyle.regularText,
// //                               border: OutlineInputBorder(),
// //                             ),
// //                             minLines: 1,
// //                             maxLines: 3,
// //                             textAlignVertical: TextAlignVertical.center,
// //                           ),
// //                         ),
// //                       ),
// //                       const SizedBox(width: 10),
// //                       Container(
// //                         height: 53,
// //                         width: 70,
// //                         decoration: BoxDecoration(
// //                           color: const Color.fromARGB(255, 7, 30, 47),
// //                           borderRadius: BorderRadius.circular(5),
// //                         ),
// //                         child: InkWell(
// //                           onTap: () {},
// //                           child: Center(
// //                             child: Text(
// //                               'Post',
// //                               style: CustomTextStyle.regularText.copyWith(
// //                                 color: Colors.white,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //      // );
// //     },
// //   );
// // }

// //   Widget buildResumeTab() => SingleChildScrollView(
// //         padding: const EdgeInsets.all(10.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             buildResumeItem('Name', 'Marlo'),
// //             buildResumeItem('Age', '21'),
// //             buildResumeItem('Contact Number', '09637077358'),
// //             buildResumeItem('Sex', 'Male'),
// //             buildResumeItem('Address', 'San Antonio, Tabaco City'),
// //             buildResumeItem('Specialization', 'Housecleaning'),
// //           ],
// //         ),
// //       );

// //   Widget buildResumeItem(String title, String content) {
// //   return Padding(
// //     padding: const EdgeInsets.only(bottom: 10.0),
// //     child: RichText(
// //       text: TextSpan(
// //         children: [
// //           TextSpan(
// //             text: '$title: ',
// //             style: CustomTextStyle.regularText.copyWith(
// //               fontWeight: FontWeight.bold,
// //               fontSize: responsiveSize(context, 0.03),
// //             ),
// //           ),
// //           TextSpan(
// //             text: content,
// //             style: CustomTextStyle.regularText.copyWith(
// //               fontSize: responsiveSize(context, 0.03),
// //             ),
// //           ),
// //         ],
// //       ),
// //     ),
// //   );
// // }

// //   Widget buildConnectionsTab() {
// //     final users = [
// //       User(
// //         profileImagePath: 'assets/images/meanne.jpg',
// //         username: 'Meanne Employer',
// //       ),
// //     ];

// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: ListView.builder(
// //         itemCount: users.length,
// //         itemBuilder: (context, index) {
// //           final user = users[index];
// //           return ListTile(
// //             leading: CircleAvatar(
// //               backgroundImage: AssetImage(user.profileImagePath),
// //             ),
// //             title: Text(
// //               user.username,
// //               style: CustomTextStyle.regularText,
// //             ),
// //             trailing: InkWell(
// //               onTap: () => _showConfirmationDialog(context, index),
// //               child: Container(
// //                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //                 decoration: BoxDecoration(
// //                   color: Color.fromARGB(255, 19, 52, 77),
// //                   borderRadius: BorderRadius.circular(5),
// //                 ),
// //                 child: Text(
// //                   'Unfriend',
// //                   style: CustomTextStyle.regularText.copyWith(
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   void _showConfirmationDialog(BuildContext context, int index) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           content: Text('Do you want to delete this user?', style: TextStyle(color: Colors.black)),
// //           actions: <Widget>[
// //              TextButton(
// //               child: Text('Yes', style: TextStyle(color: Colors.blue)),
// //               onPressed: () {
// //                 print('User ${users[index].username} unfriended.');
// //                 Navigator.of(context).pop();
// //               }),
// //             TextButton(
// //               child: Text('No', style: TextStyle(color: Colors.orange)),
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               }),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   Widget buildAboutTab() => Padding(
// //     padding: const EdgeInsets.all(16.0),
// //     child: Column(
// //       crossAxisAlignment: CrossAxisAlignment.stretch,
// //       children: [
// //         ElevatedButton(
// //           onPressed: () {},
// //           child: Text('Settings'),
// //           style: ElevatedButton.styleFrom(
// //             primary: Color.fromARGB(255, 19, 52, 77),
// //             padding: EdgeInsets.symmetric(vertical: 16),
// //             textStyle: CustomTextStyle.regularText.copyWith(
// //               color: Colors.white,
// //               fontSize: 18,
// //             ),
// //           ),
// //         ),
// //         SizedBox(height: 10),
// //         ElevatedButton(
// //           onPressed: () {},
// //           child: Text('Log Out'),
// //           style: ElevatedButton.styleFrom(
// //             primary: Color.fromARGB(255, 19, 52, 77),
// //             padding: EdgeInsets.symmetric(vertical: 16),
// //             textStyle: CustomTextStyle.regularText.copyWith(
// //               color: Colors.white,
// //               fontSize: 18,
// //             ),
// //           ),
// //         ),
// //       ],
// //     ),
// //   );
// // }

// // class Post {
// //   final String avatarImagePath;
// //   final String username;
// //   final String content;
// //   final bool isEmployer;
// //   final String location;

// //   Post({
// //     required this.avatarImagePath,
// //     required this.username,
// //     required this.content,
// //     required this.isEmployer,
// //     required this.location,
// //   });
// // }

// // class User {
// //   final String profileImagePath;
// //   final String username;

// //   User({
// //     required this.profileImagePath,
// //     required this.username,
// //   });
// // }

// import 'package:flutter/material.dart';
// import 'package:bluejobs_user/styles/textstyle.dart';
// import 'package:bluejobs_user/styles/responsive_utils.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final double coverHeight = 200;
//   final double profileHeight = 100;
//   final TextEditingController _commentController = TextEditingController();

//   Map<int, bool> _showCommentInput = {};
//   List<User> users = [];

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4, // Number of tabs
//       child: Scaffold(
//         appBar: AppBar(),
//         body: ListView.builder(
//           itemCount: 6, // Number of items in the ListView
//           itemBuilder: (BuildContext context, int index) {
//             if (index == 0) {
//               return Stack(
//                 alignment: Alignment.center,
//                 clipBehavior: Clip.none,
//                 children: [
//                   buildCoverImage(),
//                   Positioned(
//                     top: coverHeight - profileHeight / 2,
//                     child: buildProfilePicture(),
//                   ),
//                 ],
//               );
//             } else if (index == 1) {
//               return SizedBox(height: profileHeight / 2 + 16);
//             } else if (index == 2) {
//               return buildProfileName();
//             } else if (index == 3) {
//               return SizedBox(height: 16);
//             } else if (index == 4) {
//               return buildTabBar();
//             } else {
//               return Container(
//                 height: 500, // Height of TabBarView
//                 child: buildTabBarView(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildCoverImage() => Container(
//         color: Colors.grey,
//         child: Image.asset(
//           'assets/images/marlo.jpg',
//           width: double.infinity,
//           height: coverHeight,
//           fit: BoxFit.cover,
//         ),
//       );

//   Widget buildProfilePicture() => CircleAvatar(
//         radius: profileHeight / 2,
//         backgroundImage: AssetImage('assets/images/marlo.jpg'),
//         backgroundColor: Colors.white,
//       );

//   Widget buildProfileName() => const Center(
//         child: Column(
//           children: [
//             Text(
//               'Employee',
//               style: CustomTextStyle.semiBoldText,
//             ),
//             SizedBox(height: 4),
//           ],
//         ),
//       );

//   Widget buildTabBar() => Container(
//         alignment: Alignment.center,
//         child: TabBar(
//           isScrollable: true,
//           tabs: [
//             Container(
//               width: MediaQuery.of(context).size.width / 4,
//               child: Tab(text: 'My Posts'),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width / 4,
//               child: Tab(text: 'Resume'),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width / 4,
//               child: Tab(text: 'Connections'),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width / 4,
//               child: Tab(text: 'About'),
//             ),
//           ],
//           labelColor: Color.fromARGB(255, 0, 0, 0), // Text color of selected tab
//           unselectedLabelColor: Color.fromARGB(255, 124, 118, 118),
//           labelStyle: CustomTextStyle.regularText,
//         ),
//       );

//   Widget buildTabBarView() => TabBarView(
//         children: [
//           buildMyPostsTab(),
//           buildResumeTab(),
//           buildConnectionsTab(), // Updated to include Connections tab
//           buildAboutTab(),
//         ],
//       );

//   Widget buildMyPostsTab() {
//     final posts = [
//       Post(
//         avatarImagePath: 'assets/images/marlo.jpg',
//         username: 'Employee',
//         content: 'Looking for house cleaning jobs. Please contact me for more details.',
//         location: 'Lives in Albay', // Example location for an employee
//         isEmployer: false,
//       ),
//       // Add more posts if needed
//     ];

//     return ListView.builder(
//       padding: const EdgeInsets.all(10.0),
//       itemCount: posts.length,
//       itemBuilder: (context, index) {
//         final post = posts[index];
//         return Card(
//           color: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           elevation: 4.0,
//           margin: const EdgeInsets.symmetric(vertical: 10.0),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: AssetImage(post.avatarImagePath),
//                       radius: 40,
//                     ),
//                     const SizedBox(width: 20),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             post.username,
//                             style: CustomTextStyle.semiBoldText.copyWith(
//                               color: Colors.black,
//                               fontSize: 18.0,
//                             ),
//                           ),
//                           SizedBox(height: 4.0),
//                           Row(
//                             children: [
//                               const Icon(Icons.location_on, size: 16.0, color: Colors.grey),
//                               SizedBox(width: 4.0),
//                               Text(
//                                 post.location,
//                                 style: const TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 14.0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     PopupMenuButton<String>(
//                       onSelected: (value) {},
//                       itemBuilder: (BuildContext context) {
//                         return [
//                           const PopupMenuItem<String>(
//                             value: 'edit',
//                             child: Text('Edit my post'),
//                           ),
//                           const PopupMenuItem<String>(
//                             value: 'delete',
//                             child: Text('Delete my post'),
//                           ),
//                         ];
//                       },
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   post.content,
//                   style: CustomTextStyle.regularText,
//                 ),
//                 const SizedBox(height: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     InkWell(
//                       onTap: () {},
//                       child: const Row(
//                         children: [
//                           Icon(Icons.thumb_up_alt_rounded),
//                           SizedBox(width: 5),
//                           Text(
//                             'React',
//                             style: CustomTextStyle.regularText,
//                           ),
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {},
//                       child: const Row(
//                         children: [
//                           Icon(Icons.comment),
//                           SizedBox(width: 5),
//                           Text(
//                             'Comment',
//                             style: CustomTextStyle.regularText,
//                           ),
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {},
//                       child: const Row(
//                         children: [
//                           Icon(Icons.share),
//                           SizedBox(width: 5),
//                           Text(
//                             'Share',
//                             style: CustomTextStyle.regularText,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 15,),
//                 Visibility(
//                   visible: _showCommentInput[index]?? false,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 53,
//                           child: TextFormField(
//                             controller: _commentController,
//                             decoration: const InputDecoration(
//                               hintText: 'Write your comment...',
//                               hintStyle: CustomTextStyle.regularText,
//                               border: OutlineInputBorder(),
//                             ),
//                             minLines: 1,
//                             maxLines: 3,
//                             textAlignVertical: TextAlignVertical.center,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Container(
//                         height: 53,
//                         width: 70,
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(255, 7, 30, 47),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: InkWell(
//                           onTap: () {},
//                           child: Center(
//                             child: Text(
//                               'Post',
//                               style: CustomTextStyle.regularText.copyWith(
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//      // );
//     },
//   );
// }

//   Widget buildResumeTab() => SingleChildScrollView(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             buildResumeItem('Name', 'Marlo'),
//             buildResumeItem('Age', '21'),
//             buildResumeItem('Contact Number', '09637077358'),
//             buildResumeItem('Sex', 'Male'),
//             buildResumeItem('Address', 'San Antonio, Tabaco City'),
//             buildResumeItem('Specialization', 'Housecleaning'),
//           ],
//         ),
//       );

//   Widget buildResumeItem(String title, String content) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 10.0),
//     child: RichText(
//       text: TextSpan(
//         children: [
//           TextSpan(
//             text: '$title: ',
//             style: CustomTextStyle.regularText.copyWith(
//               fontWeight: FontWeight.bold,
//               fontSize: responsiveSize(context, 0.03),
//             ),
//           ),
//           TextSpan(
//             text: content,
//             style: CustomTextStyle.regularText.copyWith(
//               fontSize: responsiveSize(context, 0.03),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

//   Widget buildConnectionsTab() {
//     final users = [
//       User(
//         profileImagePath: 'assets/images/meanne.jpg',
//         username: 'Meanne Employer',
//       ),
//     ];

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: ListView.builder(
//         itemCount: users.length,
//         itemBuilder: (context, index) {
//           final user = users[index];
//           return ListTile(
//             leading: CircleAvatar(
//               backgroundImage: AssetImage(user.profileImagePath),
//             ),
//             title: Text(
//               user.username,
//               style: CustomTextStyle.regularText,
//             ),
//             trailing: InkWell(
//               onTap: () => _showConfirmationDialog(context, index),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 19, 52, 77),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: Text(
//                   'Unfriend',
//                   style: CustomTextStyle.regularText.copyWith(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void _showConfirmationDialog(BuildContext context, int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Text('Do you want to delete this user?', style: TextStyle(color: Colors.black)),
//           actions: <Widget>[
//              TextButton(
//               child: Text('Yes', style: TextStyle(color: Colors.blue)),
//               onPressed: () {
//                 print('User ${users[index].username} unfriended.');
//                 Navigator.of(context).pop();
//               }),
//             TextButton(
//               child: Text('No', style: TextStyle(color: Colors.orange)),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               }),
//           ],
//         );
//       },
//     );
//   }

//   Widget buildAboutTab() => Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         ElevatedButton(
//           onPressed: () {},
//           child: Text('Settings'),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Color.fromARGB(255, 19, 52, 77),
//             padding: EdgeInsets.symmetric(vertical: 16),
//             textStyle: CustomTextStyle.regularText.copyWith(
//               color: Colors.white,
//               fontSize: 18,
//             ),
//           ),
//         ),
//         SizedBox(height: 10),
//         ElevatedButton(
//           onPressed: () {},
//           child: Text('Log Out'),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Color.fromARGB(255, 19, 52, 77),
//             padding: EdgeInsets.symmetric(vertical: 16),
//             textStyle: CustomTextStyle.regularText.copyWith(
//               color: Colors.white,
//               fontSize: 18,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// class Post {
//   final String avatarImagePath;
//   final String username;
//   final String content;
//   final bool isEmployer;
//   final String location;

//   Post({
//     required this.avatarImagePath,
//     required this.username,
//     required this.content,
//     required this.isEmployer,
//     required this.location,
//   });
// }

// class User {
//   final String profileImagePath;
//   final String username;

//   User({
//     required this.profileImagePath,
//     required this.username,
//   });
// }

// // import 'package:flutter/material.dart';
// // import 'package:bluejobs_user/styles/textstyle.dart';
// // import 'package:bluejobs_user/styles/responsive_utils.dart';

// // class ProfilePage extends StatefulWidget {
// //   const ProfilePage({super.key});

// //   @override
// //   State<ProfilePage> createState() => _ProfilePageState();
// // }

// // class _ProfilePageState extends State<ProfilePage> {
// //   final double coverHeight = 200;
// //   final double profileHeight = 100;
// //   final TextEditingController _commentController = TextEditingController();

// //   Map<int, bool> _showCommentInput = {};
// //   List<User> users = [];

// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: 4, // Number of tabs
// //       child: Scaffold(
// //         appBar: AppBar(),
// //         body: ListView.builder(
// //           itemCount: 6, // Number of items in the ListView
// //           itemBuilder: (BuildContext context, int index) {
// //             if (index == 0) {
// //               return Stack(
// //                 alignment: Alignment.center,
// //                 clipBehavior: Clip.none,
// //                 children: [
// //                   buildCoverImage(),
// //                   Positioned(
// //                     top: coverHeight - profileHeight / 2,
// //                     child: buildProfilePicture(),
// //                   ),
// //                 ],
// //               );
// //             } else if (index == 1) {
// //               return SizedBox(height: profileHeight / 2 + 16);
// //             } else if (index == 2) {
// //               return buildProfileName();
// //             } else if (index == 3) {
// //               return SizedBox(height: 16);
// //             } else if (index == 4) {
// //               return buildTabBar();
// //             } else {
// //               return Container(
// //                 height: 500, // Height of TabBarView
// //                 child: buildTabBarView(),
// //               );
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }

// //   Widget buildCoverImage() => Container(
// //         color: Colors.grey,
// //         child: Image.asset(
// //           'assets/images/marlo.jpg',
// //           width: double.infinity,
// //           height: coverHeight,
// //           fit: BoxFit.cover,
// //         ),
// //       );

// //   Widget buildProfilePicture() => CircleAvatar(
// //         radius: profileHeight / 2,
// //         backgroundImage: AssetImage('assets/images/marlo.jpg'),
// //         backgroundColor: Colors.white,
// //       );

// //   Widget buildProfileName() => const Center(
// //         child: Column(
// //           children: [
// //             Text(
// //               'Employee',
// //               style: CustomTextStyle.semiBoldText,
// //             ),
// //             SizedBox(height: 4),
// //             // Text(
// //             //   'lflflf',
// //             //   style: CustomTextStyle.regularText,
// //             // ),
// //           ],
// //         ),
// //       );

// //   Widget buildTabBar() => Container(
// //         alignment: Alignment.center,
// //         child: TabBar(
// //           isScrollable: true,
// //           tabs: [
// //             Container(
// //               width: MediaQuery.of(context).size.width / 4,
// //               child: Tab(text: 'My Posts'),
// //             ),
// //             Container(
// //               width: MediaQuery.of(context).size.width / 4,
// //               child: Tab(text: 'Resume'),
// //             ),
// //             Container(
// //               width: MediaQuery.of(context).size.width / 4,
// //               child: Tab(text: 'Connections'),
// //             ),
// //             Container(
// //               width: MediaQuery.of(context).size.width / 4,
// //               child: Tab(text: 'About'),
// //             ),
// //           ],
// //           labelColor: Color.fromARGB(255, 0, 0, 0), // Text color of selected tab
// //           unselectedLabelColor: Color.fromARGB(255, 124, 118, 118),
// //           labelStyle: CustomTextStyle.regularText,
// //         ),
// //       );

// //   Widget buildTabBarView() => TabBarView(
// //         children: [
// //           buildMyPostsTab(),
// //           buildResumeTab(),
// //           buildConnectionsTab(), // Updated to include Connections tab
// //           Center(child: Text('About')),
// //         ],
// //       );

// //   Widget buildMyPostsTab() {
// //     final posts = [
// //       Post(
// //         avatarImagePath: 'assets/images/marlo.jpg',
// //         username: 'Employee',
// //         content: 'Looking for house cleaning jobs. Please contact me for more details.',
// //         location: 'Lives in Albay', // Example location for an employee
// //         isEmployer: false,
// //       ),
// //       // Add more posts if needed
// //     ];

// //     return ListView.builder(
// //       padding: const EdgeInsets.all(10.0),
// //       itemCount: posts.length,
// //       itemBuilder: (context, index) {
// //         final post = posts[index];
// //         return Card(
// //           color: Colors.white,
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(10),
// //           ),
// //           elevation: 4.0,
// //           margin: const EdgeInsets.symmetric(vertical: 10.0),
// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Row(
// //                   children: [
// //                     CircleAvatar(
// //                       backgroundImage: AssetImage(post.avatarImagePath),
// //                       radius: 40,
// //                     ),
// //                     const SizedBox(width: 20),
// //                     Expanded(
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             post.username,
// //                             style: CustomTextStyle.semiBoldText.copyWith(
// //                               color: Colors.black,
// //                               fontSize: 18.0,
// //                             ),
// //                           ),
// //                           SizedBox(height: 4.0),
// //                           Row(
// //                             children: [
// //                               const Icon(Icons.location_on,
// //                                   size: 16.0, color: Colors.grey),
// //                               SizedBox(width: 4.0),
// //                               Text(
// //                                 post.location,
// //                                 style: const TextStyle(
// //                                   color: Colors.grey,
// //                                   fontSize: 14.0,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     PopupMenuButton<String>(
// //                       onSelected: (value) {},
// //                       itemBuilder: (BuildContext context) {
// //                         return [
// //                           const PopupMenuItem<String>(
// //                             value: 'edit',
// //                             child: Text('Edit my post'),
// //                           ),
// //                           const PopupMenuItem<String>(
// //                             value: 'delete',
// //                             child: Text('Delete my post'),
// //                           ),
// //                         ];
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 20),
// //                 Text(
// //                   post.content,
// //                   style: CustomTextStyle.regularText,
// //                 ),
// //                const SizedBox(height: 15),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                   children: [
// //                     InkWell(
// //                       onTap: () {},
// //                       child: const Row(
// //                         children: [
// //                           Icon(Icons.thumb_up_alt_rounded),
// //                           SizedBox(width: 5),
// //                           Text(
// //                             'React',
// //                             style: CustomTextStyle.regularText,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     InkWell(
// //                       onTap: () {},
// //                       child: const Row(
// //                         children: [
// //                           Icon(Icons.comment),
// //                           SizedBox(width: 5),
// //                           Text(
// //                             'Comment',
// //                             style: CustomTextStyle.regularText,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     InkWell(
// //                       onTap: () {},
// //                       child: const Row(
// //                         children: [
// //                           Icon(Icons.share),
// //                           SizedBox(width: 5),
// //                           Text(
// //                             'Share',
// //                             style: CustomTextStyle.regularText,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 15,),
// //                 Visibility(
// //                   visible: _showCommentInput[index]?? false,
// //                   child: Row(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Expanded(
// //                         child: Container(
// //                           height: 53,
// //                           child: TextFormField(
// //                             controller: _commentController,
// //                             decoration: const InputDecoration(
// //                               hintText: 'Write your comment...',
// //                               hintStyle: CustomTextStyle.regularText,
// //                               border: OutlineInputBorder(),
// //                             ),
// //                             minLines: 1,
// //                             maxLines: 3,
// //                             textAlignVertical: TextAlignVertical.center,
// //                           ),
// //                         ),
// //                       ),
// //                       const SizedBox(width: 10),
// //                       Container(
// //                         height: 53,
// //                         width: 70,
// //                         decoration: BoxDecoration(
// //                           color: const Color.fromARGB(255, 7, 30, 47),
// //                           borderRadius: BorderRadius.circular(5),
// //                         ),
// //                         child: InkWell(
// //                           onTap: () {},
// //                           child: Center(
// //                             child: Text(
// //                               'Post',
// //                               style: CustomTextStyle.regularText.copyWith(
// //                                 color: Colors.white,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //      // );
// //     },
// //   );
// // }

// //   Widget buildResumeTab() => SingleChildScrollView(
// //         padding: const EdgeInsets.all(10.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             buildResumeItem('Name', 'Marlo'),
// //             buildResumeItem('Age', '21'),
// //             buildResumeItem('Contact Number', '09637077358'),
// //             buildResumeItem('Sex', 'Male'),
// //             buildResumeItem('Address', 'San Antonio, Tabaco City'),
// //             // buildResumeItem('Tell me about yourself',
// //             //     'I am a Flutter developer with 5 years of experience in building mobile applications. I love coding and am always eager to learn new technologies.'),
// //             buildResumeItem('Specialization', 'Housecleaning'),
// //           ],
// //         ),
// //       );

// //   Widget buildResumeItem(String title, String content) {
// //   return Padding(
// //     padding: const EdgeInsets.only(bottom: 10.0),
// //     child: RichText(
// //       text: TextSpan(
// //         children: [
// //           TextSpan(
// //             text: '$title: ',
// //             style: CustomTextStyle.regularText.copyWith(
// //               fontWeight: FontWeight.bold,
// //               fontSize: responsiveSize(context, 0.03),
// //             ),
// //           ),
// //           TextSpan(
// //             text: content,
// //             style: CustomTextStyle.regularText.copyWith(
// //               fontSize: responsiveSize(context, 0.03),
// //             ),
// //           ),
// //         ],
// //       ),
// //     ),
// //   );
// // }

// //   Widget buildConnectionsTab() {
// //     final users = [
// //       User(
// //         profileImagePath: 'assets/images/meanne.jpg',
// //         username: 'Meanne Employer',
// //       ),
// //     ];

// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: ListView.builder(
// //         itemCount: users.length,
// //         itemBuilder: (context, index) {
// //           final user = users[index];
// //           return ListTile(
// //             leading: CircleAvatar(
// //               backgroundImage: AssetImage(user.profileImagePath),
// //             ),
// //             title: Text(
// //               user.username,
// //               style: CustomTextStyle.regularText,
// //             ),
// //             trailing: InkWell(
// //               onTap: () => _showConfirmationDialog(context, index),
// //               child: Container(
// //                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //                 decoration: BoxDecoration(
// //                   color: Color.fromARGB(255, 19, 52, 77),
// //                   borderRadius: BorderRadius.circular(5),
// //                 ),
// //                 child: Text(
// //                   'Unfriend',
// //                   style: CustomTextStyle.regularText.copyWith(
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   void _showConfirmationDialog(BuildContext context, int index) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           //title: Text('Are you sure?', style: TextStyle(color: Colors.blue)),
// //           content: Text('Do you want to delete this user?', style: TextStyle(color: Colors.black)),
// //           actions: <Widget>[
// //              TextButton(
// //               child: Text('Yes', style: TextStyle(color: Colors.blue)),
// //               onPressed: () {
// //                 print('User ${users[index].username} unfriended.');
// //                 Navigator.of(context).pop();
// //               }),
// //             TextButton(
// //               child: Text('No', style: TextStyle(color: Colors.orange)),
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               }),

// //           ],
// //         );
// //       },
// //     );
// //   }
// // }

// // class Post {
// //   final String avatarImagePath;
// //   final String username;
// //   final String content;
// //   final bool isEmployer;
// //   final String location;

// //   Post({
// //     required this.avatarImagePath,
// //     required this.username,
// //     required this.content,
// //     required this.isEmployer,
// //     required this.location,
// //   });
// // }

// // class User {
// //   final String profileImagePath;
// //   final String username;

// //   User({
// //     required this.profileImagePath,
// //     required this.username,
// //   });
// // }

// import 'package:flutter/material.dart';
// import 'package:bluejobs_user/styles/textstyle.dart';
// import 'package:bluejobs_user/styles/responsive_utils.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final double coverHeight = 200;
//   final double profileHeight = 100;
//   final TextEditingController _commentController = TextEditingController();

//   Map<int, bool> _showCommentInput = {};
//   List<User> users = [];

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4, // Number of tabs
//       child: Scaffold(
//         appBar: AppBar(),
//         body: ListView.builder(
//           itemCount: 6, // Number of items in the ListView
//           itemBuilder: (BuildContext context, int index) {
//             if (index == 0) {
//               return Stack(
//                 alignment: Alignment.center,
//                 clipBehavior: Clip.none,
//                 children: [
//                   buildCoverImage(),
//                   Positioned(
//                     top: coverHeight - profileHeight / 2,
//                     child: buildProfilePicture(),
//                   ),
//                 ],
//               );
//             } else if (index == 1) {
//               return SizedBox(height: profileHeight / 2 + 16);
//             } else if (index == 2) {
//               return buildProfileName();
//             } else if (index == 3) {
//               return SizedBox(height: 16);
//             } else if (index == 4) {
//               return buildTabBar();
//             } else {
//               return Container(
//                 height: 500, // Height of TabBarView
//                 child: buildTabBarView(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildCoverImage() => Container(
//         color: Colors.grey,
//         child: Image.asset(
//           'assets/images/marlo.jpg',
//           width: double.infinity,
//           height: coverHeight,
//           fit: BoxFit.cover,
//         ),
//       );

//   Widget buildProfilePicture() => CircleAvatar(
//         radius: profileHeight / 2,
//         backgroundImage: AssetImage('assets/images/marlo.jpg'),
//         backgroundColor: Colors.white,
//       );

//   Widget buildProfileName() => const Center(
//         child: Column(
//           children: [
//             Text(
//               'Employee',
//               style: CustomTextStyle.semiBoldText,
//             ),
//             SizedBox(height: 4),
//           ],
//         ),
//       );

//   Widget buildTabBar() => Container(
//         alignment: Alignment.center,
//         child: TabBar(
//           isScrollable: true,
//           tabs: [
//             Container(
//               width: MediaQuery.of(context).size.width / 4,
//               child: Tab(text: 'My Posts'),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width / 4,
//               child: Tab(text: 'Resume'),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width / 4,
//               child: Tab(text: 'Connections'),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width / 4,
//               child: Tab(text: 'About'),
//             ),
//           ],
//           labelColor: Color.fromARGB(255, 0, 0, 0), // Text color of selected tab
//           unselectedLabelColor: Color.fromARGB(255, 124, 118, 118),
//           labelStyle: CustomTextStyle.regularText,
//         ),
//       );

//   Widget buildTabBarView() => TabBarView(
//         children: [
//           buildMyPostsTab(),
//           buildResumeTab(),
//           buildConnectionsTab(), // Updated to include Connections tab
//           buildAboutTab(),
//         ],
//       );

//   Widget buildMyPostsTab() {
//     final posts = [
//       Post(
//         avatarImagePath: 'assets/images/marlo.jpg',
//         username: 'Employee',
//         content: 'Looking for house cleaning jobs. Please contact me for more details.',
//         location: 'Lives in Albay', // Example location for an employee
//         isEmployer: false,
//       ),
//       // Add more posts if needed
//     ];

//     return ListView.builder(
//       padding: const EdgeInsets.all(10.0),
//       itemCount: posts.length,
//       itemBuilder: (context, index) {
//         final post = posts[index];
//         return Card(
//           color: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           elevation: 4.0,
//           margin: const EdgeInsets.symmetric(vertical: 10.0),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: AssetImage(post.avatarImagePath),
//                       radius: 40,
//                     ),
//                     const SizedBox(width: 20),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             post.username,
//                             style: CustomTextStyle.semiBoldText.copyWith(
//                               color: Colors.black,
//                               fontSize: 18.0,
//                             ),
//                           ),
//                           SizedBox(height: 4.0),
//                           Row(
//                             children: [
//                               const Icon(Icons.location_on, size: 16.0, color: Colors.grey),
//                               SizedBox(width: 4.0),
//                               Text(
//                                 post.location,
//                                 style: const TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 14.0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     PopupMenuButton<String>(
//                       onSelected: (value) {},
//                       itemBuilder: (BuildContext context) {
//                         return [
//                           const PopupMenuItem<String>(
//                             value: 'edit',
//                             child: Text('Edit my post'),
//                           ),
//                           const PopupMenuItem<String>(
//                             value: 'delete',
//                             child: Text('Delete my post'),
//                           ),
//                         ];
//                       },
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   post.content,
//                   style: CustomTextStyle.regularText,
//                 ),
//                 const SizedBox(height: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     InkWell(
//                       onTap: () {},
//                       child: const Row(
//                         children: [
//                           Icon(Icons.thumb_up_alt_rounded),
//                           SizedBox(width: 5),
//                           Text(
//                             'React',
//                             style: CustomTextStyle.regularText,
//                           ),
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {},
//                       child: const Row(
//                         children: [
//                           Icon(Icons.comment),
//                           SizedBox(width: 5),
//                           Text(
//                             'Comment',
//                             style: CustomTextStyle.regularText,
//                           ),
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {},
//                       child: const Row(
//                         children: [
//                           Icon(Icons.share),
//                           SizedBox(width: 5),
//                           Text(
//                             'Share',
//                             style: CustomTextStyle.regularText,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 15,),
//                 Visibility(
//                   visible: _showCommentInput[index]?? false,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 53,
//                           child: TextFormField(
//                             controller: _commentController,
//                             decoration: const InputDecoration(
//                               hintText: 'Write your comment...',
//                               hintStyle: CustomTextStyle.regularText,
//                               border: OutlineInputBorder(),
//                             ),
//                             minLines: 1,
//                             maxLines: 3,
//                             textAlignVertical: TextAlignVertical.center,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Container(
//                         height: 53,
//                         width: 70,
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(255, 7, 30, 47),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: InkWell(
//                           onTap: () {},
//                           child: Center(
//                             child: Text(
//                               'Post',
//                               style: CustomTextStyle.regularText.copyWith(
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//      // );
//     },
//   );
// }

//   Widget buildResumeTab() => SingleChildScrollView(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             buildResumeItem('Name', 'Marlo'),
//             buildResumeItem('Age', '21'),
//             buildResumeItem('Contact Number', '09637077358'),
//             buildResumeItem('Sex', 'Male'),
//             buildResumeItem('Address', 'San Antonio, Tabaco City'),
//             buildResumeItem('Specialization', 'Housecleaning'),
//           ],
//         ),
//       );

//   Widget buildResumeItem(String title, String content) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 10.0),
//     child: RichText(
//       text: TextSpan(
//         children: [
//           TextSpan(
//             text: '$title: ',
//             style: CustomTextStyle.regularText.copyWith(
//               fontWeight: FontWeight.bold,
//               fontSize: responsiveSize(context, 0.03),
//             ),
//           ),
//           TextSpan(
//             text: content,
//             style: CustomTextStyle.regularText.copyWith(
//               fontSize: responsiveSize(context, 0.03),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

//   Widget buildConnectionsTab() {
//     final users = [
//       User(
//         profileImagePath: 'assets/images/meanne.jpg',
//         username: 'Meanne Employer',
//       ),
//     ];

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: ListView.builder(
//         itemCount: users.length,
//         itemBuilder: (context, index) {
//           final user = users[index];
//           return ListTile(
//             leading: CircleAvatar(
//               backgroundImage: AssetImage(user.profileImagePath),
//             ),
//             title: Text(
//               user.username,
//               style: CustomTextStyle.regularText,
//             ),
//             trailing: InkWell(
//               onTap: () => _showConfirmationDialog(context, index),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 19, 52, 77),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: Text(
//                   'Unfriend',
//                   style: CustomTextStyle.regularText.copyWith(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void _showConfirmationDialog(BuildContext context, int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Text('Do you want to delete this user?', style: TextStyle(color: Colors.black)),
//           actions: <Widget>[
//              TextButton(
//               child: Text('Yes', style: TextStyle(color: Colors.blue)),
//               onPressed: () {
//                 print('User ${users[index].username} unfriended.');
//                 Navigator.of(context).pop();
//               }),
//             TextButton(
//               child: Text('No', style: TextStyle(color: Colors.orange)),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               }),
//           ],
//         );
//       },
//     );
//   }

//   Widget buildAboutTab() => Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         ElevatedButton(
//           onPressed: () {},
//           child: Text('Settings'),
//           style: ElevatedButton.styleFrom(
//             primary: Color.fromARGB(255, 19, 52, 77),
//             padding: EdgeInsets.symmetric(vertical: 16),
//             textStyle: CustomTextStyle.regularText.copyWith(
//               color: Colors.white,
//               fontSize: 18,
//             ),
//           ),
//         ),
//         SizedBox(height: 10),
//         ElevatedButton(
//           onPressed: () {},
//           child: Text('Log Out'),
//           style: ElevatedButton.styleFrom(
//             primary: Color.fromARGB(255, 19, 52, 77),
//             padding: EdgeInsets.symmetric(vertical: 16),
//             textStyle: CustomTextStyle.regularText.copyWith(
//               color: Colors.white,
//               fontSize: 18,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// class Post {
//   final String avatarImagePath;
//   final String username;
//   final String content;
//   final bool isEmployer;
//   final String location;

//   Post({
//     required this.avatarImagePath,
//     required this.username,
//     required this.content,
//     required this.isEmployer,
//     required this.location,
//   });
// }

// class User {
//   final String profileImagePath;
//   final String username;

//   User({
//     required this.profileImagePath,
//     required this.username,
//   });
// }

import 'package:bluejobs_user/styles/custom_button.dart';
import 'package:bluejobs_user/styles/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:bluejobs_user/styles/textstyle.dart';
import 'package:bluejobs_user/styles/responsive_utils.dart';
import 'package:bluejobs_user/screensforhome/settings.dart';
//for rating
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 200;
  final double profileHeight = 100;
  final TextEditingController _commentController = TextEditingController();
  //for rating
  double _userRating = 0.0;

  Map<int, bool> _showCommentInput = {};
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 7, 30, 47),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color:
                    Colors.white), // Customize the back button icon and color
            onPressed: () =>
                Navigator.of(context).pop(), // Handle the back button press
          ),
          title: Text('My Profile',
              style: CustomTextStyle.semiBoldText
                  .copyWith(fontSize: responsiveSize(context, 0.04))),
        ),
        body: ListView.builder(
          itemCount: 6, // Number of items in the ListView
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  buildCoverImage(),
                  Positioned(
                    top: coverHeight - profileHeight / 2,
                    child: buildProfilePicture(),
                  ),
                ],
              );
            } else if (index == 1) {
              return SizedBox(height: profileHeight / 2 + 16);
            } else if (index == 2) {
              return buildProfileName();
            } else if (index == 3) {
              return SizedBox(height: 16);
            } else if (index == 4) {
              return buildTabBar();
            } else {
              return Container(
                height: 500, // Height of TabBarView
                child: buildTabBarView(),
              );
            }
          },
        ),
      ),
    );
  }

//for cover
  Widget buildCoverImage() => Stack(
        children: [
          Container(
            color: Colors.grey,
            child: Image.asset(
              'assets/images/marlo.jpg',
              width: double.infinity,
              height: coverHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.white),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: const Color.fromARGB(255, 7, 30, 47),
                      child: Wrap(
                        children: [
                          ListTile(
                            leading:
                                const Icon(Icons.photo, color: Colors.white),
                            title: const Text('Change your cover photo',
                                style: CustomTextStyle.regularText),
                            onTap: () {
                              Navigator.of(context).pop();
                              // Handle cover photo change
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      );

  Widget buildProfilePicture() => Stack(
        children: [
          CircleAvatar(
            radius: profileHeight / 2,
            backgroundImage: const AssetImage('assets/images/marlo.jpg'),
            backgroundColor: Colors.white,
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.white),
              onPressed: () {
                print("Camera icon pressed");
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: const Color.fromARGB(255, 7, 30, 47),
                      child: Wrap(
                        children: [
                          ListTile(
                            leading:
                                const Icon(Icons.person, color: Colors.white),
                            title: const Text('See your profile',
                                style: CustomTextStyle.regularText),
                            onTap: () {
                              Navigator.of(context).pop();
                              // Handle see profile
                            },
                          ),
                          ListTile(
                            leading:
                                const Icon(Icons.photo, color: Colors.white),
                            title: const Text('Choose your profile photo',
                                style: CustomTextStyle.regularText),
                            onTap: () {
                              Navigator.of(context).pop();
                              // Handle choose profile photo
                            },
                          ),
                          ListTile(
                            leading:
                                const Icon(Icons.camera, color: Colors.white),
                            title: const Text('Change your profile photo',
                                style: CustomTextStyle.regularText),
                            onTap: () {
                              Navigator.of(context).pop();
                              // Handle change profile photo
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      );

  Widget buildProfileName() => Center(
        child: Column(
          children: [
            Text(
              'Employee',
              style: CustomTextStyle.semiBoldText
                  .copyWith(fontSize: responsiveSize(context, 0.04)),
            ),
            SizedBox(height: 4),
          ],
        ),
      );

  Widget buildTabBar() => Container(
        alignment: Alignment.center,
        child: TabBar(
          isScrollable: true,
          tabs: [
            Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Tab(text: 'My Posts'),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Tab(text: 'Resume'),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Tab(text: 'Reviews'),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Tab(text: 'Connections'),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Tab(text: 'About'),
            ),
          ],
          labelColor:
              Color.fromARGB(255, 255, 255, 255), // Text color of selected tab
          unselectedLabelColor: Color.fromARGB(255, 124, 118, 118),
          labelStyle: CustomTextStyle.semiBoldText
              .copyWith(fontSize: responsiveSize(context, 0.03)),
        ),
      );

  Widget buildTabBarView() => TabBarView(
        children: [
          buildMyPostsTab(),
          buildResumeTab(),
          buildReviewsTab(context),
          // buildReviewsTab(),   //original
          buildConnectionsTab(),
          buildAboutTab(context),
        ],
      );

  Widget buildMyPostsTab() {
    final posts = [
      Post(
        avatarImagePath: 'assets/images/marlo.jpg',
        username: 'Employee',
        content:
            'Looking for house cleaning jobs. Please contact me for more details.',
        location: 'Lives in Albay', // Example location for an employee
        isEmployer: false,
      ),
      Post(
        avatarImagePath: 'assets/images/marlo.jpg',
        username: 'Employee',
        content:
            'Looking for house cleaning jobssssssss. Please contact me for more details.',
        location: 'Lives in Albay', // Example location for an employee
        isEmployer: false,
      ),
      // Add more posts if needed
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Card(
          color: const Color.fromARGB(255, 7, 30, 47),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                              fontSize: responsiveSize(context, 0.04),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  size: 16.0,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              SizedBox(width: 4.0),
                              Text(
                                post.location,
                                style: CustomTextStyle.regularText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (value) {},
                      itemBuilder: (BuildContext context) {
                        return [
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
                  style: CustomTextStyle.semiBoldText,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Icon(
                            Icons.thumb_up_alt_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'React',
                            style: CustomTextStyle.regularText,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Icon(
                            Icons.comment,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Comment',
                            style: CustomTextStyle.regularText,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Share',
                            style: CustomTextStyle.regularText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
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
                          color: const Color.fromARGB(255, 7, 30, 47),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: InkWell(
                          onTap: () {},
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
        // );
      },
    );
  }

  Widget buildResumeTab() {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          color: Color.fromARGB(255, 9, 38, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4.0,
          margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildResumeItem('Name', 'Mark Angelo Cid'),
                buildResumeItem('Age', '21'),
                buildResumeItem('Contact Number', '09637077358'),
                buildResumeItem('Sex', 'Male'),
                buildResumeItem('Address', 'San Antonio, Tabaco City'),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                  child: Text(
                    'I am mostly good at!',
                    style: CustomTextStyle.regularText.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveSize(context, 0.04),
                    ),
                  ),
                ),
                buildSpecializationChips(
                    ['Housecleaning', 'Eating', 'hahahah', 'hehehe']),
                //  SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildResumeItem(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title: ',
              style: CustomTextStyle.regularText.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: responsiveSize(context, 0.04),
              ),
            ),
            TextSpan(
              text: content,
              style: CustomTextStyle.regularText.copyWith(
                fontSize: responsiveSize(context, 0.04),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSpecializationChips(List<String> specializations) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: specializations.map((specialization) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Chip(
            backgroundColor: const Color.fromARGB(255, 243, 107, 4),
            label: Text(
              specialization,
              style: CustomTextStyle.regularText.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

Widget buildResumeTab(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(15.0),
    child: Card(
      color: Color.fromARGB(255, 9, 38, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4.0,
      margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildResumeItem(context, 'Name', 'Mark Angelo Cid'),
            buildResumeItem(context, 'Age', '21'),
            buildResumeItem(context, 'Contact Number', '09637077358'),
            buildResumeItem(context, 'Sex', 'Male'),
            buildResumeItem(context, 'Address', 'San Antonio, Tabaco City'),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
              child: Text(
                'I am mostly good at!',
                style: CustomTextStyle.regularText.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: responsiveSize(context, 0.03),
                ),
              ),
            ),
            buildSpecializationChips(['Housecleaning', 'Eating']),
            SizedBox(height: 20),
          ],
        ),
      ),
    ),
  );
}

Widget buildResumeItem(BuildContext context, String title, String content) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title: ',
            style: CustomTextStyle.regularText.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: responsiveSize(context, 0.04),
            ),
          ),
          TextSpan(
            text: content,
            style: CustomTextStyle.regularText.copyWith(
              fontSize: responsiveSize(context, 0.03),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildSpecializationChips(List<String> specializations) {
  return Wrap(
    spacing: 8.0,
    runSpacing: 4.0,
    children: specializations.map((specialization) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Chip(
          backgroundColor: const Color.fromARGB(255, 243, 107, 4),
          label: Text(
            specialization,
            style: CustomTextStyle.regularText.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      );
    }).toList(),
  );
}

// Widget buildReviewsTab() {
//   //note this section can only be viewed by a user thatll leave a review to the application
//   return  Padding(
//     padding: EdgeInsets.all(16.0),
//       child: Card(
//          color: const Color.fromARGB(255, 7, 30, 47), //original color
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               elevation: 5.0,
//               margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
//               child:  Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                     Row(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: AssetImage('assets/images/meanne.jpg'),
//                           radius: 30,
//                         ),
//                          SizedBox(width: 20),
//                        Expanded(
//                         child: TextFormField(
//                           decoration: customInputDecoration('   Leave any suggestions!'),
//                         ),

//                        )
//                       ],
//                     )
//                    ],
//                 )
//       ),

//       )
//   );
// }



// Widget buildReviewsTab(BuildContext context) {
//   double userRating = 0.0;

//   return Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: Container(
//       constraints: BoxConstraints(
//         maxHeight: MediaQuery.of(context).size.height * 0.5, // Adjust height as needed
//       ),
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 7, 30, 47),
//         borderRadius: BorderRadius.circular(5),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 5,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: const AssetImage('assets/images/meanne.jpg'),
//                       radius: 30,
//                     ),
//                     const SizedBox(width: 20),
//                     Expanded(
//                       child: TextFormField(
//                         decoration: customInputDecoration('Leave a suggestion or review!'),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Center(
//                   child: RatingBar.builder(
//                     initialRating: 0,
//                     minRating: 1,
//                     direction: Axis.horizontal,
//                     allowHalfRating: true,
//                     itemCount: 5,
//                     itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//                     itemBuilder: (context, _) => const Icon(
//                       Icons.star,
//                       color: Color.fromARGB(255, 148, 113, 8),
//                     ),
//                     onRatingUpdate: (rating) {
//                       // setState(() {
//                       // userRating = rating;
//                       // });
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Center(
//                   child: CustomButton(
//                     onTap: () {
//                       // Handle review submission logic here
//                       print('User Rating: $userRating');
//                     },
//                     buttonText: 'Submit Review',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }




Widget buildReviewsTab(BuildContext context) {
  double userRating = 0.0;

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.5, // Adjust height as needed
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 7, 30, 47),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              const AssetImage('assets/images/meanne.jpg'),
                          radius: 30,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            decoration: customInputDecoration(
                                'Leave a suggestion or review!'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 148, 113, 8),
                        ),
                        onRatingUpdate: (rating) {
                          // setState(() {
                          // userRating = rating;
                          // });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: CustomButton(
                        onTap: () {
                          // Handle review submission logic here
                          print('User Rating: $userRating');
                        },
                        buttonText: 'Submit Review',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Additional Card for profile and review
        Card(
          elevation: 4.0,
          margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          const AssetImage('assets/images/meanne.jpg'),
                      radius: 30,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mary Anne', // Replace with the actual user name
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 148, 113, 8),
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'I like it', // Replace with actual user comment
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}



Widget buildConnectionsTab() {
  final users = [
    User(
      profileImagePath: 'assets/images/meanne.jpg',
      username: 'Meanne Employer',
    ),
    User(
      profileImagePath: 'assets/images/meanne.jpg',
      username: 'Meann Employer',
    ),
    User(
      profileImagePath: 'assets/images/marlo.jpg',
      username: 'Marlo Employee',
    ),
  ];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(user.profileImagePath),
          ),
          title: Text(
            user.username,
            style: CustomTextStyle.regularText,
          ),
          trailing: InkWell(
            onTap: () => _showConfirmationDialog(context, index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 107, 4),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Unfriend',
                style: CustomTextStyle.regularText.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

void _showConfirmationDialog(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 7, 30, 47),
        title:
            const Text('Delete this User', style: CustomTextStyle.regularText),
        content: Text(
            'Are you sure you want to remove this user as your connection?',
            style: CustomTextStyle.regularText),
        actions: <Widget>[
          TextButton(
            child: const Text('Yes', style: CustomTextStyle.regularText),
            onPressed: () {
              // Handle block action
              // Navigator.of(context).pop();
              // setState(() {
              //   // Update state to reflect that the user is blocked
              //   print('Removed');
              // });
            },
          ),
          TextButton(
            child: const Text('No', style: CustomTextStyle.regularText),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget buildAboutTab(BuildContext context) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: const Icon(Icons.settings,
                color: Color.fromARGB(255, 255, 255, 255)),
            title: Text(
              'Settings',
              style: CustomTextStyle.semiBoldText.copyWith(
                fontSize: responsiveSize(context, 0.03),
              ),
            ),
            onTap: () {
              // Navigate to the SettingsPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            contentPadding: const EdgeInsets.all(10),
          ),
          // const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.logout_rounded,
                color: Color.fromARGB(255, 255, 255, 255)),
            title: Text(
              'Log Out',
              style: CustomTextStyle.semiBoldText.copyWith(
                fontSize: responsiveSize(context, 0.03),
              ),
            ),
            onTap: () {
              _showLogoutConfirmationDialog(context);
            },
            contentPadding: const EdgeInsets.all(10),
          ),
        ],
      ),
    );

void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 7, 30, 47),
        title: Text('Log out',
            style: CustomTextStyle.semiBoldText
                .copyWith(fontSize: responsiveSize(context, 0.03))),
        content: const Text(
          'Are you sure you want to log out?',
          style: CustomTextStyle.semiBoldText,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text(
              'Hmm, no',
              style: CustomTextStyle.semiBoldText,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                  '/signin'); // Navigate to the sign-in page
            },
            child: Text(
              'Yes, Im sure! ',
              style:
                  CustomTextStyle.semiBoldText.copyWith(color: Colors.orange),
            ),
          ),
        ],
      );
    },
  );
}

class Post {
  final String avatarImagePath;
  final String username;
  final String content;
  final bool isEmployer;
  final String location;

  Post({
    required this.avatarImagePath,
    required this.username,
    required this.content,
    required this.isEmployer,
    required this.location,
  });
}

class User {
  final String profileImagePath;
  final String username;

  User({
    required this.profileImagePath,
    required this.username,
  });
}
