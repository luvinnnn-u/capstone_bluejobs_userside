// // custom_input_decoration.dart
// import 'package:flutter/material.dart';
// import 'package:bluejobs_user/styles/textstyle.dart'; // Assuming this is where CustomTextStyle is defined

// InputDecoration customInputDecoration(String labelText, {IconButton? suffixIcon}) {
//   return InputDecoration(
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(15),
//       borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
//     ),
//     labelText: labelText,
//     labelStyle: CustomTextStyle.regularText,
//     suffixIcon: suffixIcon,
//    // contentPadding: EdgeInsets.symmetric(vertical: 3), // Adjust vertical padding to control height
//   );
// }

// custom_input_decoration.dart
import 'package:flutter/material.dart';
import 'package:bluejobs_user/styles/textstyle.dart'; // Assuming this is where CustomTextStyle is defined

// InputDecoration customInputDecoration(String labelText, {IconButton? suffixIcon}) {
//   return InputDecoration(
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(25),
//       borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 4),
//     ),
//     labelText: labelText,
//     labelStyle: CustomTextStyle.regularText,
//     suffixIcon: suffixIcon,
//    // contentPadding: EdgeInsets.symmetric(vertical: 3), // Adjust vertical padding to control height
//   );
// }

InputDecoration customInputDecoration(String labelText, {Color? fillColor, IconButton? suffixIcon}) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    
    ),
    labelText: labelText,
    //labelStyle: CustomTextStyle.regularText,  eto yung dati
    labelStyle: CustomTextStyle.semiBoldText,
    suffixIcon: suffixIcon,
    contentPadding: EdgeInsets.symmetric(vertical: 19), //added this para lumiit yung textfield
  );
}