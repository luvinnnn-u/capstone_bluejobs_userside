// import 'package:flutter/material.dart';
// import 'package:bluejobs_user/styles/textstyle.dart';
// import 'package:bluejobs_user/styles/responsive_utils.dart';

// class SettingsPage extends StatefulWidget {
//   const SettingsPage({super.key});

//   @override
//   State<SettingsPage> createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 7, 30, 47),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back,
//                 color:
//                     Colors.white), 
//             onPressed: () =>
//                 Navigator.of(context).pop(),
//           ),
//           title:  Text('Settings', style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04))),
//         ),
      
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:bluejobs_user/styles/textstyle.dart';
import 'package:bluejobs_user/styles/responsive_utils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 30, 47),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Settings', style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.04))),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.favorite_border, color: Colors.white),
            title: Text("Liked Posts", style: CustomTextStyle.regularText.copyWith(color: Colors.white)),
            // onTap: () {
            //   // Navigate to LikedPostsPage
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const LikedPostsPage()), // Placeholder for your actual page
            //   );
            // },
          ),
          ListTile(
            leading: Icon(Icons.comment, color: Colors.white),
            title: Text("Commented Posts", style: CustomTextStyle.regularText.copyWith(color: Colors.white)),
            // onTap: () {
            //   // Navigate to CommentedPostsPage
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const CommentedPostsPage()), // Placeholder for your actual page
            //   );
            // },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip, color: Colors.white),
            title: Text("Privacy Policy", style: CustomTextStyle.regularText.copyWith(color: Colors.white)),
            // onTap: () {
            //   // Navigate to PrivacyPolicyPage
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const PrivacyPolicyPage()), // Placeholder for your actual page
            //   );
            // },
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.white),
            title: Text("About BlueJobs", style: CustomTextStyle.regularText.copyWith(color: Colors.white)),
            // onTap: () {
            //   // Navigate to AboutBlueJobsPage
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const AboutBlueJobsPage()), // Placeholder for your actual page
            //   );
           // },
          ),
        ],
      ),
    );



  
  }


}