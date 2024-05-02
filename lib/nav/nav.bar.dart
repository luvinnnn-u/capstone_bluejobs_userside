import 'package:bluejobs_user/screensforhome/notification.dart';
import 'package:flutter/material.dart';
import 'package:bluejobs_user/screensforhome/create_post.dart';
import 'package:bluejobs_user/screensforhome/home.dart';
import 'package:bluejobs_user/screensforhome/messaging.dart';
import 'package:bluejobs_user/screensforhome/search.dart';
import 'package:bluejobs_user/screensforhome/profile_page.dart';
//animation
//import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class NavBarPage extends StatefulWidget {
 const NavBarPage({super.key});

 @override
 State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
 int _selectedIndex = 0;
 List<Widget> screensforhome = <Widget>[
    HomePage(),
    NotificationsPage(),
    ProfilePage(),
    CreatePostPage(),
    MessagingPage(),
 ];

 @override
 Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: screensforhome[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded),label: 'Search',),
          BottomNavigationBarItem(icon: Icon(Icons.add_box),label: 'Create ',),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: 'Chats',),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile',),
        ],
        unselectedItemColor: Color.fromARGB(255, 19, 8, 8),
        selectedItemColor: Color.fromARGB(255, 7, 16, 69),
        currentIndex: _selectedIndex,
        //onTap: _onItemTapped,
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


class EmployerNavBarPage extends StatefulWidget {
  const EmployerNavBarPage({super.key});

  @override
  State<EmployerNavBarPage> createState() => _EmployerNavBarPageState();
}

class _EmployerNavBarPageState extends State<EmployerNavBarPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
