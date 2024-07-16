// import 'package:flutter/material.dart';
// import 'package:bluejobs_user/styles/textstyle.dart'; // Adjust the import path as necessary
// import 'package:bluejobs_user/nav/nav.bar.dart';
// import 'package:bluejobs_user/styles/responsive_utils.dart';
// import 'package:bluejobs_user/styles/custom_theme.dart';
// import 'package:flutter/widgets.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:bluejobs_user/styles/custom_button.dart';
// import 'package:confetti/confetti.dart';
// import 'dart:async'; // for timer
// import 'package:bluejobs_user/styles/custom_inkwell_signup.dart'; // Import the CustomInkWellButton

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final FocusNode _fullNameFocusNode = FocusNode();
//   final FocusNode _emailFocusNode = FocusNode();
//   bool _isFullNameFocused = false;
//   bool _isEmailFocused = false;
//   bool _isEmployer = false; // Track if the user is an Employer

//   @override
//   void initState() {
//     super.initState();
//     _fullNameFocusNode.addListener(_onFocusChange);
//     _emailFocusNode.addListener(_onFocusChange);
//   }

//   @override
//   void dispose() {
//     _fullNameController.dispose();
//     _emailController.dispose();
//     _fullNameFocusNode.dispose();
//     _emailFocusNode.dispose();
//     super.dispose();
//   }

//   void _onFocusChange() {
//     setState(() {
//       _isFullNameFocused = _fullNameFocusNode.hasFocus;
//       _isEmailFocused = _emailFocusNode.hasFocus;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       //backgroundColor: Color.fromARGB(255, 7, 30, 47),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 50),
//             Padding(
//               padding: const EdgeInsets.only(left: 15),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Are you a Blue Collar Job Hunter or an Employer?",
//                   style: CustomTextStyle.semiBoldText.copyWith(
//                     fontSize: responsiveSize(context, 0.05),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: ListBody(
//                 children: [
//                   const SizedBox(height: 20),

//                   // CustomInkWellButton(
//                   //   buttonText: 'I am a Blue Collar Job Hunter',
//                   //   onPressed: () {
//                   //     setState(() {
//                   //       _isEmployer =
//                   //           false; // Set user as Blue Collar Job Hunter
//                   //     });
//                   //     Navigator.push(
//                   //         context,
//                   //         MaterialPageRoute(
//                   //             builder: (context) => BlueCollarJobHuntersForm(
//                   //                 isEmployer: _isEmployer)));
//                   //   },
//                   //   fillColor: const Color.fromARGB(255, 7, 30, 47),
//                   // ),
//                   InkWell(
//         onTap: () {
//           setState(() {
//             _isEmployer = false; // Set user as Blue Collar Job Hunter
//           });
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => BlueCollarJobHuntersForm(
//                       isEmployer: _isEmployer)));
//         },
//         child: CustomButton(
//           buttonText: 'I am a Blue Collar Job Hunter',
//           onTap: () {}, // This is just a placeholder since we're handling tap outside
//           // No need to specify buttonColor, textColor, etc., as they use the default values
//         ),
//       ),

//                   const SizedBox(height: 20),

//                   // CustomInkWellButton(
//                   //   buttonText: 'I am an Employer',
//                   //   onPressed: () {
//                   //     setState(() {
//                   //       _isEmployer = true; // Set user as Employer
//                   //     });
//                   //     Navigator.push(
//                   //         context,
//                   //         MaterialPageRoute(
//                   //             builder: (context) => BlueCollarJobHuntersForm(
//                   //                 isEmployer:
//                   //                     _isEmployer)) // Navigate to the same form for both types of users
//                   //         );
//                   //   },
//                   //   fillColor: const Color.fromARGB(255, 7, 30, 47),
//                   // ),
//                   InkWell(
//         onTap: () {
//           setState(() {
//             _isEmployer = true; // Set user as Employer
//           });
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => BlueCollarJobHuntersForm(
//                       isEmployer: _isEmployer))); // Navigate to the same form for both types of users
//         },
//         child: CustomButton(
//           buttonText: 'I am an Employer',
//           onTap: () {}, 
//         ),
//       ),

//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BlueCollarJobHuntersForm extends StatefulWidget {
//   final bool isEmployer; // Declare the isEmployer variable

//   const BlueCollarJobHuntersForm({
//     Key? key,
//     required this.isEmployer, // Modify the constructor to require isEmployer
//   }) : super(key: key);

//   @override
//   State<BlueCollarJobHuntersForm> createState() =>
//       _BlueCollarJobHuntersFormState();
// }

// class _BlueCollarJobHuntersFormState extends State<BlueCollarJobHuntersForm> {
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final FocusNode _fullNameFocusNode = FocusNode(); // Add a FocusNode
//   final FocusNode _emailFocusNode = FocusNode();
//   bool _isFullNameFocused = false;
//   bool _isEmailFocused = false;

//   @override
//   void initState() {
//     super.initState();
//     _fullNameFocusNode.addListener(_onFocusChange); // Listen for focus changes
//     _emailFocusNode.addListener(_onFocusChange); // Listen for focus changes
//   }

//   @override
//   void dispose() {
//     _fullNameController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }

//   void _onFocusChange() {
//     setState(() {
//       _isFullNameFocused = _fullNameFocusNode.hasFocus;
//       _isEmailFocused = _emailFocusNode.hasFocus;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 50,
//               ),
//               Padding(
//                   padding: const EdgeInsets.only(left: 20),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text("Let's set up your account!",
//                         style: CustomTextStyle.semiBoldText
//                             .copyWith(fontSize: responsiveSize(context, 0.05))),
//                   )),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: ListBody(
//                   children: [
//                     TextField(
//                       controller: _fullNameController,
//                       focusNode: _fullNameFocusNode,
//                       decoration: customInputDecoration('Full Name'),
//                       style: const TextStyle(color: Colors.black),
//                     ),
//                     if (_isFullNameFocused)
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8.0),
//                         child: Text(
//                           'Enter your full name. Ex. Juan A. Dela CRUZ',
//                           // style: TextStyle(color: Colors.grey, fontSize: 12),
//                           style: CustomTextStyle.regularText
//                               .copyWith(color: Colors.grey),
//                         ),
//                       ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     TextField(
//                       controller: _emailController,
//                       focusNode: _emailFocusNode,
//                       decoration: customInputDecoration('Email'),
//                     ),
//                     if (_isEmailFocused)
//                       const Padding(
//                         padding: EdgeInsets.only(top: 8.0),
//                         child: Text(
//                           'Use an active email',
//                           style: TextStyle(color: Colors.grey, fontSize: 12),
//                         ),
//                       ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     IntlPhoneField(
//                       decoration: customInputDecoration('Phone Number'),
//                       initialCountryCode:
//                           'PH', // Set the initial country code to Philippines
//                       onChanged: (phone) {
//                         print(phone
//                             .completeNumber); // This will print the complete number with country code
//                       },
//                     ),
//                     CustomButton(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ProfileUploadPage(
//                                     isEmployer: widget
//                                         .isEmployer), // Pass isEmployer to the next page
//                               ));
//                         },
//                         buttonText: 'Next'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:bluejobs_user/styles/textstyle.dart'; // Adjust the import path as necessary
import 'package:bluejobs_user/nav/nav.bar.dart';
import 'package:bluejobs_user/styles/responsive_utils.dart';
import 'package:bluejobs_user/styles/custom_theme.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:bluejobs_user/styles/custom_button.dart';
import 'package:confetti/confetti.dart';
import 'dart:async'; // for timer
//import 'package:bluejobs_user/styles/custom_inkwell_signup.dart'; // Import the CustomInkWellButton

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  bool _isFullNameFocused = false;
  bool _isEmailFocused = false;
  bool _isEmployer = false; // Track if the user is an Employer

  @override
  void initState() {
    super.initState();
    _fullNameFocusNode.addListener(_onFocusChange);
    _emailFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFullNameFocused = _fullNameFocusNode.hasFocus;
      _isEmailFocused = _emailFocusNode.hasFocus;
    });
  }

  void _navigateToForm(bool isEmployer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlueCollarJobHuntersForm(isEmployer: isEmployer),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
        onPressed: () => Navigator.of(context).pop(), // Handle the back button press
      ),
      title: Text('Create your Account!', style: CustomTextStyle.semiBoldText),
    ),
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Are you a Blue Collar Job Hunter or an Employer?",
                  style: CustomTextStyle.semiBoldText.copyWith(
                    fontSize: responsiveSize(context, 0.05),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListBody(
                children: [
                  const SizedBox(height: 20),
                CustomButton(
                    buttonText: 'I am a Blue Collar Job Hunter',
                    onTap: () {
                      _navigateToForm(false); // Navigate to the form with isEmployer = false
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    buttonText: 'I am an Employer',
                    onTap: () {
                      _navigateToForm(true); // Navigate to the form with isEmployer = true
                    },
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class BlueCollarJobHuntersForm extends StatefulWidget {
//   final bool isEmployer; // Declare the isEmployer variable

//   const BlueCollarJobHuntersForm({
//     Key? key,
//     required this.isEmployer, // Modify the constructor to require isEmployer
//   }) : super(key: key);

//   @override
//   State<BlueCollarJobHuntersForm> createState() =>
//       _BlueCollarJobHuntersFormState();
// }

// class _BlueCollarJobHuntersFormState extends State<BlueCollarJobHuntersForm> {
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final FocusNode _fullNameFocusNode = FocusNode(); // Add a FocusNode
//   final FocusNode _emailFocusNode = FocusNode();
//   bool _isFullNameFocused = false;
//   bool _isEmailFocused = false;

//   @override
//   void initState() {
//     super.initState();
//     _fullNameFocusNode.addListener(_onFocusChange); // Listen for focus changes
//     _emailFocusNode.addListener(_onFocusChange); // Listen for focus changes
//   }

//   @override
//   void dispose() {
//     _fullNameController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }

//   void _onFocusChange() {
//     setState(() {
//       _isFullNameFocused = _fullNameFocusNode.hasFocus;
//       _isEmailFocused = _emailFocusNode.hasFocus;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 50,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Let's set up your account!",
//                   style: CustomTextStyle.semiBoldText.copyWith(
//                     fontSize: responsiveSize(context, 0.05),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: ListBody(
//                 children: [
//                   TextField(
//                     controller: _fullNameController,
//                     focusNode: _fullNameFocusNode,
//                     decoration: customInputDecoration('Full Name'),
//                     style: const TextStyle(color: Colors.black),
//                   ),
//                   if (_isFullNameFocused)
//                     Padding(
//                       padding: const EdgeInsets.only(top: 8.0),
//                       child: Text(
//                         'Enter your full name. Ex. Juan A. Dela CRUZ',
//                         style: CustomTextStyle.regularText
//                             .copyWith(color: Colors.grey),
//                       ),
//                     ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TextField(
//                     controller: _emailController,
//                     focusNode: _emailFocusNode,
//                     decoration: customInputDecoration('Email'),
//                   ),
//                   if (_isEmailFocused)
//                     const Padding(
//                       padding: EdgeInsets.only(top: 8.0),
//                       child: Text(
//                         'Use an active email',
//                         style: TextStyle(color: Colors.grey, fontSize: 12),
//                       ),
//                     ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   IntlPhoneField(
//                     decoration: customInputDecoration('Phone Number'),
//                     initialCountryCode: 'PH', // Set the initial country code to Philippines
//                     onChanged: (phone) {
//                       print(phone.completeNumber); // This will print the complete number with country code
//                     },
//                   ),
//                   CustomButton(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ProfileUploadPage(
//                             isEmployer: widget.isEmployer, // Pass isEmployer to the next page
//                           ),
//                         ),
//                       );
//                     },
//                     buttonText: 'Next',
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class BlueCollarJobHuntersForm extends StatefulWidget {
  final bool isEmployer; // Declare the isEmployer variable

  const BlueCollarJobHuntersForm({
    Key? key,
    required this.isEmployer, // Modify the constructor to require isEmployer
  }) : super(key: key);

  @override
  State<BlueCollarJobHuntersForm> createState() =>
      _BlueCollarJobHuntersFormState();
}

class _BlueCollarJobHuntersFormState extends State<BlueCollarJobHuntersForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _fullNameFocusNode = FocusNode(); // Add a FocusNode
  final FocusNode _emailFocusNode = FocusNode();
  bool _isFullNameFocused = false;
  bool _isEmailFocused = false;

  @override
  void initState() {
    super.initState();
    _fullNameFocusNode.addListener(_onFocusChange); // Listen for focus changes
    _emailFocusNode.addListener(_onFocusChange); // Listen for focus changes
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFullNameFocused = _fullNameFocusNode.hasFocus;
      _isEmailFocused = _emailFocusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
        onPressed: () => Navigator.of(context).pop(), // Handle the back button press
      ),
      title: Text('Create your Account!', style: CustomTextStyle.semiBoldText),
    ),
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Let's set up your account!",
                  style: CustomTextStyle.semiBoldText.copyWith(
                    fontSize: responsiveSize(context, 0.05),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListBody(
                children: [
                  TextField(
                    controller: _fullNameController,
                    focusNode: _fullNameFocusNode,
                    decoration: customInputDecoration('   Full Name'),
                    style: CustomTextStyle.semiBoldText,
                  ),
                  if (_isFullNameFocused)
                    const Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Enter your full name. Ex. Juan A. Dela CRUZ',
                        style: CustomTextStyle.regularText,
                            
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    decoration: customInputDecoration('   Email'),
                  ),
                  if (_isEmailFocused)
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Use an active email',
                        style: CustomTextStyle.regularText,
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  IntlPhoneField(
                    decoration: customInputDecoration('  Phone Number'),
                    initialCountryCode: 'PH', // Set the initial country code to Philippines
                    onChanged: (phone) {
                      print(phone.completeNumber); // This will print the complete number with country code
                    },
                  ),
                  CustomButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileUploadPage(
                            isEmployer: widget.isEmployer, // Pass isEmployer to the next page
                          ),
                        ),
                      );
                    },
                    buttonText: 'Next',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// //profile pic
// class ProfileUploadPage extends StatefulWidget {
//   final bool isEmployer;

//   //const ProfileUploadPage({super.key});
//   const ProfileUploadPage({Key? key, required this.isEmployer})
//       : super(key: key);

//   @override
//   State<ProfileUploadPage> createState() => _ProfileUploadPageState();
// }

// class _ProfileUploadPageState extends State<ProfileUploadPage> {
//   //File? _imageFile;
//   //bool _isImageSelected = false;
//   XFile? _imageFile;

//   Future<void> _pickImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (image != null) {
//         _imageFile = image;
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future<void> _takePicture() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera);

//     setState(() {
//       if (image != null) {
//         _imageFile = image;
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 50,
//           ),
//           Padding(
//               padding: const EdgeInsets.only(left: 20),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text("Upload your picture!",
//                     style: CustomTextStyle.semiBoldText
//                         .copyWith(fontSize: responsiveSize(context, 0.05))),
//               )),
//           const SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: ListBody(
//               children: [
//                 InkWell(
//                   onTap: _pickImage,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width - 50,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.white, // Set the background color to white
//                       borderRadius: BorderRadius.circular(
//                           15), // This removes the rounded corners
//                       border: Border.all(
//                         color: Color.fromARGB(255, 35, 39, 42), // Set the border color to blue
//                         width: 1, // Set the border width
//                       ),
//                     ),
//                     child: const Center(
//                       child: Text('Pick Image',
//                           style: TextStyle(
//                               color:
//                                   Colors.black)), // Set the text color to black
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 InkWell(
//                   onTap: _takePicture,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width - 50,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.white, // Set the background color to white
//                       borderRadius: BorderRadius.circular(
//                           15), // This removes the rounded corners
//                       border: Border.all(
//                         color: const Color.fromARGB(
//                             255, 19, 52, 77), // Set the border color to blue
//                         width: 1, // Set the border width
//                       ),
//                     ),
//                     child: const Center(
//                       child: Text('Take Picture',
//                           style: TextStyle(
//                               color:
//                                   Colors.black)), // Set the text color to black
//                     ),
//                   ),
//                 ),
//                 if (_imageFile != null) Image.file(File(_imageFile!.path)),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 CustomButton(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   AddressPage(isEmployer: widget.isEmployer)));
//                     },
//                     buttonText: 'Next'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


//profile pic
class ProfileUploadPage extends StatefulWidget {
  final bool isEmployer;

  //const ProfileUploadPage({super.key});
  const ProfileUploadPage({Key? key, required this.isEmployer})
      : super(key: key);

  @override
  State<ProfileUploadPage> createState() => _ProfileUploadPageState();
}

class _ProfileUploadPageState extends State<ProfileUploadPage> {
  //File? _imageFile;
  //bool _isImageSelected = false;
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _imageFile = image;
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        _imageFile = image;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
        onPressed: () => Navigator.of(context).pop(), // Handle the back button press
      ),
      title: Text('Create your Account!', style: CustomTextStyle.semiBoldText),
    ),
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Upload your picture!",
                    style: CustomTextStyle.semiBoldText
                        .copyWith(fontSize: responsiveSize(context, 0.05))),
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListBody(
              children: [
                InkWell(
                  onTap: _pickImage,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 7, 30, 47),// Set the background color to white
                      borderRadius: BorderRadius.circular(
                          15), // This removes the rounded corners
                      border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255), // Set the border color to blue
                        width: 1, // Set the border width
                      ),
                    ),
                    child: const Center(
                      child: Text('Pick Image',
                          style: CustomTextStyle.semiBoldText,), // Set the text color to black
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: _takePicture,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 7, 30, 47), // Set the background color to white
                      borderRadius: BorderRadius.circular(
                          15), // This removes the rounded corners
                      border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255), // Set the border color to blue
                        width: 1, // Set the border width
                      ),
                    ),
                    child: const Center(
                      child: Text('Take Picture',
                         style: CustomTextStyle.semiBoldText,), // Set the text color to black
                    ),
                  ),
                ),
                if (_imageFile != null) Image.file(File(_imageFile!.path)),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddressPage(isEmployer: widget.isEmployer)));
                    },
                    buttonText: 'Next'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// //address
// class AddressPage extends StatefulWidget {
//   final bool isEmployer;

//   // const AddressPage({super.key});
//   const AddressPage({Key? key, required this.isEmployer}) : super(key: key);

//   @override
//   State<AddressPage> createState() => _AddressPageState();
// }

// class _AddressPageState extends State<AddressPage> {
//   final TextEditingController _addressController = TextEditingController();

//   @override
//   void dispose() {
//     _addressController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 50,
//           ),
//           Padding(
//               padding: const EdgeInsets.only(left: 20),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text("Input your Address Here!",
//                     style: CustomTextStyle.semiBoldText
//                         .copyWith(fontSize: responsiveSize(context, 0.05))),
//               )),
//           const SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: ListBody(
//               children: [
//                 TextField(
//                   controller: _addressController,
//                   decoration:
//                       customInputDecoration('Find your Address').copyWith(
//                     suffixIcon: const Icon(Icons.search),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 CustomButton(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   AgePage(isEmployer: widget.isEmployer)));
//                     },
//                     buttonText: 'Next')
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

//address
class AddressPage extends StatefulWidget {
  final bool isEmployer;

  // const AddressPage({super.key});
  const AddressPage({Key? key, required this.isEmployer}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
        onPressed: () => Navigator.of(context).pop(), // Handle the back button press
      ),
      title: Text('Create your Account!', style: CustomTextStyle.semiBoldText),
    ),
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Input your Address Here!",
                    style: CustomTextStyle.semiBoldText
                        .copyWith(fontSize: responsiveSize(context, 0.05))),
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListBody(
              children: [
                TextField(
                  controller: _addressController,
                  decoration:
                      customInputDecoration('    Find your Address').copyWith(
                    suffixIcon: const Icon(Icons.search, color: Colors.white,),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AgePage(isEmployer: widget.isEmployer)));
                    },
                    buttonText: 'Next')
              ],
            ),
          )
        ],
      ),
    );
  }
}


//age 
class AgePage extends StatefulWidget {
  final bool isEmployer;

  const AgePage({Key? key, required this.isEmployer}) : super(key: key);

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  String? _selectedAge;

  @override
  Widget build(BuildContext context) {
    List<String> _ageOptions = List.generate(
        48,
        (index) => (18 + index).toString()); // Generates a list of strings representing ages from 18 to 65

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
        onPressed: () => Navigator.of(context).pop(), // Handle the back button press
      ),
      title: Text('Create your Account!', style: CustomTextStyle.semiBoldText),
    ),
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select your Age",
                style: CustomTextStyle.semiBoldText.copyWith(fontSize: responsiveSize(context, 0.05)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 17, 16, 16), width: 2), // Adjust the border color as needed
                borderRadius: BorderRadius.circular(15), // Optional: Adds rounded corners for a more polished look
              ),
              child: DropdownButtonFormField<String>(
                value: _selectedAge,
                //hint: Text("Select Age"),
                items: _ageOptions.map((String age) => DropdownMenuItem<String>(
                  value: age,
                  child: Text('$age years old'),
                )).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedAge = newValue;
                  });
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10), // Adjust internal padding as needed
                  border: InputBorder.none, // Removes the default underline
                  filled: true, // Optional: Use if you want a filled background
                  fillColor: Colors.white, // Optional: Adjust the background color
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10), // Adjust horizontal padding as needed
            child: CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UsernamePage(isEmployer: widget.isEmployer),
                  ),
                );
              },
              buttonText: 'Next',
            ),
          ),
        ],
      ),
    );
  }
}



//username
// class UsernamePage extends StatefulWidget {
//   final bool isEmployer;

//   //const UsernamePage({super.key});
//   const UsernamePage({Key? key, required this.isEmployer}) : super(key: key);

//   @override
//   State<UsernamePage> createState() => _UsernamePageState();
// }

// class _UsernamePageState extends State<UsernamePage> {
//   final TextEditingController _userNameController = TextEditingController();
//   //focus
//   final FocusNode _userNameFocusNode = FocusNode(); // Add a FocusNode
//   bool _isUserNameFocused = false;

//   @override
//   void initState() {
//     super.initState();
//     _userNameFocusNode
//         .addListener(_onUserNameFocusChange); // Listen for focus changes
//   }

//   @override
//   void dispose() {
//     _userNameController.dispose();
//     _userNameFocusNode.dispose();
//     super.dispose();
//   }

//   void _onUserNameFocusChange() {
//     setState(() {
//       _isUserNameFocused = _userNameFocusNode.hasFocus;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Column(children: [
//           const SizedBox(
//             height: 50,
//           ),
//           Padding(
//               padding: const EdgeInsets.only(left: 20),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text("Set up your username!",
//                     style: CustomTextStyle.semiBoldText
//                         .copyWith(fontSize: responsiveSize(context, 0.05))),
//               )),
//           const SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: ListBody(
//               children: [
//                 TextField(
//                   controller: _userNameController,
//                   focusNode: _userNameFocusNode,
//                   decoration: customInputDecoration('Username'),
//                 ),
//                 if (_isUserNameFocused)
//                   const Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: Text(
//                       'This will be your identifier. Make it YOU-nique!',
//                       style: TextStyle(color: Colors.grey, fontSize: 12),
//                     ),
//                   ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 CustomButton(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   PasswordPage(isEmployer: widget.isEmployer)));
//                     },
//                     buttonText: 'Next'),
//               ],
//             ),
//           )
//         ]));
//   }
// }

//username
class UsernamePage extends StatefulWidget {
  final bool isEmployer;

  const UsernamePage({Key? key, required this.isEmployer}) : super(key: key);

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  final TextEditingController _userNameController = TextEditingController();
  //focus
  final FocusNode _userNameFocusNode = FocusNode(); // Add a FocusNode
  bool _isUserNameFocused = false;

  @override
  void initState() {
    super.initState();
    _userNameFocusNode
        .addListener(_onUserNameFocusChange); // Listen for focus changes
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _userNameFocusNode.dispose();
    super.dispose();
  }

  void _onUserNameFocusChange() {
    setState(() {
      _isUserNameFocused = _userNameFocusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
        onPressed: () => Navigator.of(context).pop(), // Handle the back button press
      ),
      title: Text('Create your Account!', style: CustomTextStyle.semiBoldText),
    ),
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
        body: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Set up your username!",
                    style: CustomTextStyle.semiBoldText
                        .copyWith(fontSize: responsiveSize(context, 0.05))),
              )),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListBody(
              children: [
                TextField(
                  controller: _userNameController,
                  focusNode: _userNameFocusNode,
                  decoration: customInputDecoration('   Username'),
                  style: TextStyle(color: Colors.white),
                ),
                if (_isUserNameFocused)
                  const Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'This will be your identifier. Make it YOU-nique!',
                     // style: TextStyle(color: Colors.grey, fontSize: 12),
                     style: CustomTextStyle.regularText,
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PasswordPage(isEmployer: widget.isEmployer)));
                    },
                    buttonText: 'Next'),
              ],
            ),
          )
        ]));
  }
}


// // //password
// class PasswordPage extends StatefulWidget {
//   final bool isEmployer;

//   //const PasswordPage({super.key});
//   const PasswordPage({Key? key, required this.isEmployer}) : super(key: key);
//   @override
//   State<PasswordPage> createState() => _PasswordPageState();
// }

// class _PasswordPageState extends State<PasswordPage> {
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _repeatPasswordController =
//       TextEditingController();

//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _repeatPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           const SizedBox(height: 50),
//           Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Set up your password!",
//                 style: CustomTextStyle.semiBoldText.copyWith(
//                   fontSize: responsiveSize(context, 0.05),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: ListBody(
//               children: [
//                 Text(
//                   'Create a password with the combination of letters, numbers, and special characters.',
//                   style: CustomTextStyle.lightText.copyWith(
//                     fontSize: responsiveSize(context, 0.03),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: _passwordController,
//                   decoration: customInputDecoration(
//                     'Password',
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: _repeatPasswordController,
//                   decoration: customInputDecoration('Retype your Password'),
//                 ),
//                 const SizedBox(height: 20),
//                 CustomButton(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             DoneCreatePage(isEmployer: widget.isEmployer),
//                       ),
//                     );
//                   },
//                   buttonText: 'Next',
//                 ),
//                 // ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// //password
class PasswordPage extends StatefulWidget {
  final bool isEmployer;

  const PasswordPage({Key? key, required this.isEmployer}) : super(key: key);
  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
        onPressed: () => Navigator.of(context).pop(), // Handle the back button press
      ),
      title: Text('Create your Account!', style: CustomTextStyle.semiBoldText),
    ),
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Set up your password!",
                style: CustomTextStyle.semiBoldText.copyWith(
                  fontSize: responsiveSize(context, 0.05),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListBody(
              children: [
                Text(
                  'Create a password with the combination of letters, numbers, and special characters.',
                  style: CustomTextStyle.regularText.copyWith(
                    fontSize: responsiveSize(context, 0.03),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: customInputDecoration(
                    '   Password',
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _repeatPasswordController,
                  decoration: customInputDecoration('   Retype your Password'),
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DoneCreatePage(isEmployer: widget.isEmployer),
                      ),
                    );
                  },
                  buttonText: 'Next',
                ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//done create that navigates to home
// class DoneCreatePage extends StatefulWidget {
//   final bool isEmployer;
//   const DoneCreatePage({Key? key, required this.isEmployer}) : super(key: key);

//   @override
//   State<DoneCreatePage> createState() => _DoneCreatePageState();
// }

// class _DoneCreatePageState extends State<DoneCreatePage> {
//   final ConfettiController _confettiKey =
//       ConfettiController(duration: const Duration(seconds: 10));

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _confettiKey.play();
//     });
//   }

//   @override
//   void dispose() {
//     _confettiKey.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Stack(
//         children: [
//           ConfettiWidget(
//             confettiController: _confettiKey,
//             blastDirectionality:
//                 BlastDirectionality.explosive, // Explosive blast
//             colors: const [
//               Colors.orange,
//               Color.fromARGB(255, 7, 30, 47),
//               Colors.white,
//             ],
//           ),
//           Column(
//             children: [
//               const SizedBox(height: 50),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Welcome to BlueJobs!",
//                     style: CustomTextStyle.titleText
//                         .copyWith(fontSize: responsiveSize(context, 0.05)),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: ListBody(
//                   children: [
//                     CustomButton(
//                       onTap: () {
//                         if (widget.isEmployer) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => NavBarPage(),
//                             ),
//                           );
//                         } else {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ButtonSpecializationPage(
//                                   isEmployer: widget.isEmployer),
//                             ),
//                           );
//                         }
//                       },
//                       buttonText: 'Next',
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class DoneCreatePage extends StatefulWidget {
  final bool isEmployer;
  const DoneCreatePage({Key? key, required this.isEmployer}) : super(key: key);

  @override
  State<DoneCreatePage> createState() => _DoneCreatePageState();
}

class _DoneCreatePageState extends State<DoneCreatePage> {
  final ConfettiController _confettiKey =
      ConfettiController(duration: const Duration(seconds: 10));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _confettiKey.play();
    });
  }

  @override
  void dispose() {
    _confettiKey.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Customize the back button icon and color
        onPressed: () => Navigator.of(context).pop(), // Handle the back button press
      ),
      title: Text('Create your Account!', style: CustomTextStyle.semiBoldText),
    ),
      backgroundColor: Color.fromARGB(255, 7, 30, 47),
      body: Stack(
        children: [
          ConfettiWidget(
            confettiController: _confettiKey,
            blastDirectionality:
                BlastDirectionality.explosive, // Explosive blast
            colors: const [
              Colors.orange,
             // Color.fromARGB(255, 7, 30, 47),
              Colors.white,
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome to BlueJobs!",
                    style: CustomTextStyle.semiBoldText
                        .copyWith(fontSize: responsiveSize(context, 0.05)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ListBody(
                  children: [
                    CustomButton(
                      onTap: () {
                        if (widget.isEmployer) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavBarPage(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButtonSpecializationPage(
                                  isEmployer: widget.isEmployer),
                            ),
                          );
                        }
                      },
                      buttonText: 'Next',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



// class ButtonSpecializationPage extends StatefulWidget {
//   final bool isEmployer;
 
//   const ButtonSpecializationPage({Key? key, required this.isEmployer})
//       : super(key: key);

//   @override
//   State<ButtonSpecializationPage> createState() =>
//       _ButtonSpecializationPageState();
// }
// class _ButtonSpecializationPageState extends State<ButtonSpecializationPage> {
//   final List<String> skills = [
//     "Carpentry",
//     "Plumbing",
//     "Sewing",
//     "Doing Laundry",
//     "Electrician",
//     "Mechanic",
//     "Construction Worker",
//     "Factory Worker",
//     "Welder",
//     "Painter",
//     "Landscaper",
//     "Janitor",
//     "HVAC Technician",
//     "Heavy Equipment Operator",
//     "Truck Driver",
//     "Roofer",
//     "Mason",
//     "Steelworker",
//     "Pipefitter",
//     "Boilermaker",
//     "Chef",
//     "Butcher",
//     "Baker",
//     "Fisherman",
//     "Miner",
//     "Housekeeper",
//     "Security Guard",
//     "Firefighter",
//     "Paramedic",
//     "Nursing Assistant",
//     "Retail Worker",
//     "Warehouse Worker"
//   ];

//   final Set<String> selectedSkills = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const SizedBox(height: 50),
//             Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Choose what you are good at!",
//                   style: CustomTextStyle.titleText.copyWith(fontSize: responsiveSize(context, 0.05)),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: Wrap(
//                     spacing: 8.0,
//                     runSpacing: 4.0,
//                     children: skills.map((skill) {
//                       final isSelected = selectedSkills.contains(skill);
//                       return ChoiceChip(
//                         label: Text(
//                           skill,
//                           style: CustomTextStyle.regularText.copyWith(
//                             color: isSelected ? Colors.white : Colors.black,
//                           ),
//                         ),
//                         selected: isSelected,
//                         selectedColor: Color.fromARGB(255, 7, 30, 47),
//                         onSelected: (selected) {
//                           setState(() {
//                             if (selected) {
//                               selectedSkills.add(skill);
//                             } else {
//                               selectedSkills.remove(skill);
//                             }
//                           });
//                         },
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             CustomButton(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const NavBarPage()),
//                 );
//               },
//               buttonText: 'Get Started',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class ButtonSpecializationPage extends StatefulWidget {
//   final bool isEmployer;

//   const ButtonSpecializationPage({Key? key, required this.isEmployer})
//       : super(key: key);

//   @override
//   State<ButtonSpecializationPage> createState() =>
//       _ButtonSpecializationPageState();
// }

// class _ButtonSpecializationPageState extends State<ButtonSpecializationPage> {
//   final List<String> skills = [
//     "Carpentry",
//     "Plumbing",
//     "Sewing",
//     "Doing Laundry",
//     "Electrician",
//     "Mechanic",
//     "Construction Worker",
//     "Factory Worker",
//     "Welder",
//     "Painter",
//     "Landscaper",
//     "Janitor",
//     "HVAC Technician",
//     "Heavy Equipment Operator",
//     "Truck Driver",
//     "Roofer",
//     "Mason",
//     "Steelworker",
//     "Pipefitter",
//     "Boilermaker",
//     "Chef",
//     "Butcher",
//     "Baker",
//     "Fisherman",
//     "Miner",
//     "Housekeeper",
//     "Security Guard",
//     "Firefighter",
//     "Paramedic",
//     "Nursing Assistant",
//     "Retail Worker",
//     "Warehouse Worker"
//   ];

//   final Set<String> selectedSkills = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 7, 30, 47),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       backgroundColor: const Color.fromARGB(255, 7, 30, 47),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const SizedBox(height: 50),
//             Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Choose what you are good at!",
//                   style: CustomTextStyle.semiBoldText.copyWith(
//                     fontSize: responsiveSize(context, 0.05),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: Wrap(
//                     spacing: 8.0,
//                     runSpacing: 4.0,
//                     children: skills.map((skill) {
//                       final isSelected = selectedSkills.contains(skill);
//                       return ChoiceChip(
//                         label: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             if (isSelected) const SizedBox(width: 4),
//                             Text(
//                               skill,
//                               style: CustomTextStyle.semiBoldText.copyWith(
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                         selected: isSelected,
//                        selectedColor: const Color.fromARGB(255, 7, 30, 47),
//                        backgroundColor: Color.fromARGB(255, 7, 30, 47),
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(color: Colors.white),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         onSelected: (selected) {
//                           setState(() {
//                             if (selected) {
//                               selectedSkills.add(skill);
//                             } else {
//                               selectedSkills.remove(skill);
//                             }
//                           });
//                         },
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             CustomButton(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const NavBarPage()),
//                 );
//               },
//               buttonText: 'Get Started',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




class ButtonSpecializationPage extends StatefulWidget {
  final bool isEmployer;

  const ButtonSpecializationPage({Key? key, required this.isEmployer})
      : super(key: key);

  @override
  State<ButtonSpecializationPage> createState() =>
      _ButtonSpecializationPageState();
}

class _ButtonSpecializationPageState extends State<ButtonSpecializationPage> {
  final List<String> skills = [
    "Carpentry",
    "Plumbing",
    "Sewing",
    "Doing Laundry",
    "Electrician",
    "Mechanic",
    "Construction Worker",
    "Factory Worker",
    "Welder",
    "Painter",
    "Landscaper",
    "Janitor",
    "HVAC Technician",
    "Heavy Equipment Operator",
    "Truck Driver",
    "Roofer",
    "Mason",
    "Steelworker",
    "Pipefitter",
    "Boilermaker",
    "Chef",
    "Butcher",
    "Baker",
    "Fisherman",
    "Miner",
    "Housekeeper",
    "Security Guard",
    "Firefighter",
    "Paramedic",
    "Nursing Assistant",
    "Retail Worker",
    "Warehouse Worker"
  ];

  final Set<String> selectedSkills = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 30, 47),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 7, 30, 47),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose what you are good at!",
                  style: CustomTextStyle.semiBoldText.copyWith(
                    fontSize: responsiveSize(context, 0.05),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: skills.map((skill) {
                      final isSelected = selectedSkills.contains(skill);
                      return InputChip(
                        label: Text(
                          skill,
                          style: CustomTextStyle.regularText.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: const Color.fromARGB(255, 7, 30, 47),
                        backgroundColor: Color.fromARGB(255, 7, 30, 47),
                        checkmarkColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              selectedSkills.add(skill);
                            } else {
                              selectedSkills.remove(skill);
                            }
                          });
                        },
                      );
                    }).toList().cast<Widget>(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NavBarPage()),
                );
              },
              buttonText: 'Get Started',
            ),
          ],
        ),
      ),
    );
  }
}