import 'package:flutter/material.dart';

class CustomTextStyle {
  static const TextStyle titleText = TextStyle(
    fontSize: 25,
    letterSpacing: 0.4,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    color: Colors.black,
  );

  static const TextStyle regularText = TextStyle(
    fontSize: 12,
    letterSpacing: 0.9,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
    // color: Color.fromARGB(255, 0, 0, 0),   ////dating black tinry lang na white
    color: Colors.white,
  );

   static const TextStyle semiBoldText = TextStyle(
    fontSize: 14,
    letterSpacing: 0.4,
    fontFamily: 'Poppins',
    color: Colors.white,  //dati black
    fontWeight: FontWeight.bold,
  );
  
  static const TextStyle lightText = TextStyle(
    fontSize: 5,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w200,
    fontFamily: 'Poppins',
    color: Colors.black,
  );
}
