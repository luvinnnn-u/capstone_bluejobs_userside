import 'package:flutter/material.dart';
import 'package:bluejobs_user/screens/signin.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // home: NotificationsPage(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // scaffoldBackgroundColor: Color.fromARGB(255, 7, 30, 47),  //for background ng lahat
       scaffoldBackgroundColor: Color.fromARGB(255, 7, 34, 54),
         colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(0, 5, 5, 5)),
        useMaterial3: true,
      ),
      home: const SignInPage(),
    );
  }
}
