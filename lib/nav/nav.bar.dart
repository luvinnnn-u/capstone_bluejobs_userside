
// // import 'package:flutter/material.dart';
// // import 'package:bluejobs_user/screensforhome/create_post.dart';
// // import 'package:bluejobs_user/screensforhome/home.dart';
// // import 'package:bluejobs_user/screensforhome/messaging.dart';
// // import 'package:bluejobs_user/screensforhome/search.dart';
// // import 'package:bluejobs_user/screensforhome/profile_page.dart';


// // class NavBarPage extends StatefulWidget {
// //  const NavBarPage({super.key});

// //  @override
// //  State<NavBarPage> createState() => _NavBarPageState();
// // }

// // class _NavBarPageState extends State<NavBarPage> {
// //  int _selectedIndex = 0;
// //  List<Widget> screensforhome = <Widget>[
// //     HomePage(),
// //     SearchPage(),
// //     CreatePostPage(),
// //     MessagingPage(),
// //     ProfilePage(),
    
    
// //  ];

// //  @override
// //  Widget build(BuildContext context) {
// //     return Scaffold(

// //       backgroundColor: Colors.white,
// //       body: screensforhome[_selectedIndex],
// //       bottomNavigationBar: BottomNavigationBar(
// //         items: const <BottomNavigationBarItem>[
// //           BottomNavigationBarItem(icon: Icon(Icons.home),label: '',),
// //           BottomNavigationBarItem(icon: Icon(Icons.search_rounded),label: '',),
// //           BottomNavigationBarItem(icon: Icon(Icons.add_box),label: ' ',),
// //           BottomNavigationBarItem(icon: Icon(Icons.message),label: '',),
// //           BottomNavigationBarItem(icon: Icon(Icons.person),label: '',),
// //         ],
// //         unselectedItemColor: Color.fromARGB(255, 19, 8, 8),
// //         selectedItemColor: Color.fromARGB(255, 7, 16, 69),
// //         currentIndex: _selectedIndex,
// //         //onTap: _onItemTapped,
// //         onTap: (value) {
// //           setState(() {
// //           _selectedIndex = value;
// //           });
// //         },
// //         type: BottomNavigationBarType.fixed,
// //         showSelectedLabels: true,
// //         showUnselectedLabels: true,
// //       ),
// //     );
// //  }
// // }


// // // class EmployerNavBarPage extends StatefulWidget {
// // //   const EmployerNavBarPage({super.key});

// // //   @override
// // //   State<EmployerNavBarPage> createState() => _EmployerNavBarPageState();
// // // }

// // // class _EmployerNavBarPageState extends State<EmployerNavBarPage> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return const Placeholder();
// // //   }
// // // }


// import 'package:flutter/material.dart';
// import 'package:bluejobs_user/screensforhome/create_post.dart';
// import 'package:bluejobs_user/screensforhome/home.dart';
// import 'package:bluejobs_user/screensforhome/messaging.dart';
// import 'package:bluejobs_user/screensforhome/search.dart';
// import 'package:bluejobs_user/screensforhome/profile_page.dart';


// class NavBarPage extends StatefulWidget {
//  const NavBarPage({super.key});

//  @override
//  State<NavBarPage> createState() => _NavBarPageState();
// }

// class _NavBarPageState extends State<NavBarPage> {
//  int _selectedIndex = 0;
//  List<Widget> screensforhome = <Widget>[
//     HomePage(),
//     SearchPage(),
//     CreatePostPage(),
//     MessagingPage(),
//     ProfilePage(),
    
    
//  ];

//  @override
//  Widget build(BuildContext context) {
//     return Scaffold(

//       backgroundColor: Colors.white,
//       body: screensforhome[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home),label: '',),
//           BottomNavigationBarItem(icon: Icon(Icons.search_rounded),label: '',),
//           BottomNavigationBarItem(icon: Icon(Icons.add_box),label: ' ',),
//           BottomNavigationBarItem(icon: Icon(Icons.message),label: '',),
//           BottomNavigationBarItem(icon: Icon(Icons.person),label: '',),
//         ],
//         backgroundColor: Color.fromARGB(255, 7, 30, 47),
//         unselectedItemColor: Color.fromARGB(255, 104, 102, 102),
//         // selectedItemColor: Color.fromARGB(255, 220, 15, 15),
//          selectedItemColor: Color.fromARGB(255, 255, 255, 255),
//         currentIndex: _selectedIndex,
//         //onTap: _onItemTapped,
//         onTap: (value) {
//           setState(() {
//           _selectedIndex = value;
//           });
//         },
//         type: BottomNavigationBarType.fixed,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//       ),
//     );
//  }
// }


import 'package:flutter/material.dart';
import 'package:bluejobs_user/screensforhome/create_post.dart';
import 'package:bluejobs_user/screensforhome/home.dart';
import 'package:bluejobs_user/screensforhome/messaging.dart';
import 'package:bluejobs_user/screensforhome/search.dart';
import 'package:bluejobs_user/screensforhome/profile_page.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int _selectedIndex = 0;
  List<Widget> screensforhome = <Widget>[
    HomePage(),
    SearchPage(),
    CreatePostPage(),
    MessagingPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screensforhome[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 7, 30, 47),
        unselectedItemColor: const Color.fromARGB(255, 104, 102, 102),
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        currentIndex: _selectedIndex,
        iconSize: 36.0, // Increase the icon size
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}


