import 'package:bluejobs_user/nav/nav.bar.dart';
import 'package:flutter/material.dart';
import 'package:bluejobs_user/styles/textstyle.dart';
import 'package:bluejobs_user/styles/responsive_utils.dart';
import 'package:bluejobs_user/styles/custom_theme.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'dart:io'; // di ko alam para san to HAHAH
import 'package:image_picker/image_picker.dart';
import 'package:bluejobs_user/styles/custom_button.dart';
import 'package:confetti/confetti.dart';
import 'dart:async'; //for timer
import 'package:bluejobs_user/styles/custom_inkwell_signup.dart';
import 'package:bluejobs_user/screens/employer_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        const SizedBox(
          height: 50,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Are you a Blue Collar Job Hunter or an Employer",
                  style: CustomTextStyle.semiBoldText
                      .copyWith(fontSize: responsiveSize(context, 0.05))),
            )),
        Padding(
          padding: EdgeInsets.all(10),
          child: ListBody(
            children: [
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlueCollarJobHuntersForm()));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width -
                          50, // Adjust the width to match the input fields
                      height: 55,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                5), // Set border radius to 5
                          ),
                          fillColor: const Color.fromARGB(255, 7, 30, 47),
                          filled: true,
                        ),
                        child: Center(
                          child: Text('I am a Blue Collar Job Hunter',
                              style: CustomTextStyle.regularText.copyWith(
                                color: Colors.white,
                              )),
                        ),
                      ))),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmployerForm()));
                  },
                  child: Container(
                      //padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width -
                          50, // Adjust the width to match the input fields
                      height: 55,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                5), // Set border radius to 5
                          ),
                          fillColor: const Color.fromARGB(
                              255, 7, 30, 47), // Set background color
                          filled:
                              true, // Use filled property to apply the background color
                        ),
                        child: Center(
                          child: Text('I am an Employer',
                              style: CustomTextStyle.regularText.copyWith(
                                color: Colors.white,
                              )),
                        ),
                      ))),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class BlueCollarJobHuntersForm extends StatefulWidget {
  const BlueCollarJobHuntersForm({super.key});

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
        appBar: AppBar(),
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
                    child: Text("Let's set up your account!",
                        style: CustomTextStyle.semiBoldText
                            .copyWith(fontSize: responsiveSize(context, 0.05))),
                  )),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ListBody(
                  children: [
                    TextField(
                      controller: _fullNameController,
                      focusNode: _fullNameFocusNode,
                      decoration: customInputDecoration('Full Name'),
                    ),
                    if (_isFullNameFocused)
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Enter your full name. Ex. Juan A. Dela CRUZ',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      decoration: customInputDecoration('Email'),
                    ),
                    if (_isEmailFocused)
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Use an active email',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    IntlPhoneField(
                      decoration: customInputDecoration('Phone Number'),
                      initialCountryCode:
                          'PH', // Set the initial country code to Philippines
                      onChanged: (phone) {
                        print(phone
                            .completeNumber); // This will print the complete number with country code
                      },
                    ),
                    CustomButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProfileUploadPage()));
                        },
                        buttonText: 'Next'),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

//profile pic
class ProfileUploadPage extends StatefulWidget {
  const ProfileUploadPage({super.key});

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
      appBar: AppBar(),
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
            padding: EdgeInsets.all(10),
            child: ListBody(
              children: [
                InkWell(
                  onTap: _pickImage,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white, // Set the background color to white
                      borderRadius: BorderRadius.circular(
                          5), // This removes the rounded corners
                      border: Border.all(
                        color: Color.fromARGB(
                            255, 19, 52, 77), // Set the border color to blue
                        width: 1, // Set the border width
                      ),
                    ),
                    child: Center(
                      child: Text('Pick Image',
                          style: TextStyle(
                              color:
                                  Colors.black)), // Set the text color to black
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
                      color: Colors.white, // Set the background color to white
                      borderRadius: BorderRadius.circular(
                          5), // This removes the rounded corners
                      border: Border.all(
                        color: Color.fromARGB(
                            255, 19, 52, 77), // Set the border color to blue
                        width: 1, // Set the border width
                      ),
                    ),
                    child: Center(
                      child: Text('Take Picture',
                          style: TextStyle(
                              color:
                                  Colors.black)), // Set the text color to black
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
                              builder: (context) => const AddressPage()));
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
  

//address
class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

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
      appBar: AppBar(),
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
                      customInputDecoration('Find your Address').copyWith(
                    suffixIcon: Icon(Icons.search),
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
                              builder: (context) => const UsernamePage()));
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

//username
class UsernamePage extends StatefulWidget {
  const UsernamePage({super.key});

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
        appBar: AppBar(),
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
                  decoration: customInputDecoration('Username'),
                ),
                if (_isUserNameFocused)
                  const Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'This will be your identifier. Make it YOU-nique!',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
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
                              builder: (context) => const PasswordPage()));
                    },
                    buttonText: 'Next'),
              ],
            ),
          )
        ]));
  }
}

// class CodePage extends StatefulWidget {
//   const CodePage({super.key});

//   @override
//   State<CodePage> createState() => _CodePageState();
// }

// class _CodePageState extends State<CodePage> {
//   final TextEditingController _codeController = TextEditingController();
//   final FocusNode _codeFocusNode = FocusNode();
//   bool _isCodeFocused = false;
//   StreamController<int>? _streamController;
//   int _start = 120; // 2 minutes in seconds

//   @override
//   void initState() {
//     super.initState();
//     _codeFocusNode.addListener(_onFocusChange);
//     _startTimer();
//   }

//   void _startTimer() {
//     _streamController = StreamController<int>();
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       if (_start == 0) {
//         timer.cancel();
//         _streamController?.close();
//       } else {
//         _start--;
//         _streamController?.add(_start);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _codeController.dispose();
//     _codeFocusNode.dispose();
//     _streamController?.close();
//     super.dispose();
//   }

//   void _onFocusChange() {
//     setState(() {
//       _isCodeFocused = _codeFocusNode.hasFocus;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Column(children: [
//           const SizedBox(height: 50),
//           Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text("A code was sent to your account!",
//                     style: CustomTextStyle.semiBoldText
//                         .copyWith(fontSize: responsiveSize(context, 0.05))),
//               )),
//           const SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: ListBody(children: [
//               TextField(
//                 controller: _codeController,
//                 focusNode: _codeFocusNode,
//                 decoration: customInputDecoration('Code here'),
//               ),
//               if (_isCodeFocused)
//                 const Padding(
//                   padding: const EdgeInsets.only(top: 8.0),
//                   child: Text(
//                     'Go to your email and enter the code sent to you.',
//                     style: TextStyle(color: Colors.grey, fontSize: 12),
//                   ),
//                 ),
//               const SizedBox(height: 20),
//               StreamBuilder<int>(
//                 stream: _streamController?.stream,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     final minutes = snapshot.data! ~/ 60;
//                     final seconds = snapshot.data! % 60;
//                     return Text(
//                         'Resend the code in: ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}');
//                   } else {
//                     return ElevatedButton(
//                       onPressed: () {
//                         // Implement your logic to resend the code here
//                         print('Resend the code');
//                         _start = 120; // Reset the timer
//                         _startTimer();
//                       },
//                       child: Text('Resend the code'),
//                     );
//                   }
//                 },
//               ),
//               const SizedBox(height: 20),
//               CustomButton(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const PasswordPage()));
//                   },
//                   buttonText: 'Next'),
//             ]),
//           )
//         ]));
//   }
// }

// //password
class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

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
      appBar: AppBar(),
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
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListBody(
              children: [
                Text(
                  'Create a password with the combination of letters, numbers, and special characters.',
                  style: CustomTextStyle.LightText.copyWith(
                    fontSize: responsiveSize(context, 0.03),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: customInputDecoration(
                    'Password',
                    //  suffixIcon: IconButton(icon: Icon(Icons.lock_clock_rounded),
                    //   onPressed: () {
                    //     // Handle the button tap here
                    //     },
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _repeatPasswordController,
                  decoration: customInputDecoration('Retype your Password'),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DoneCreatePage(),
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
class DoneCreatePage extends StatefulWidget {
  const DoneCreatePage({super.key});

  @override
  State<DoneCreatePage> createState() => _DoneCreatePageState();
}

class _DoneCreatePageState extends State<DoneCreatePage> {
//final GlobalKey<ConfettiController> _confettiKey = GlobalKey<ConfettiController>();
//final GlobalKey _confettiKey = GlobalKey();
  final ConfettiController _confettiKey =
      ConfettiController(duration: Duration(seconds: 10));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _confettiKey.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
        confettiController: _confettiKey,
        blastDirectionality: BlastDirectionality.explosive, // Explosive blast
        colors: const [
          Colors.orange,
          Color.fromARGB(255, 7, 30, 47),
          Colors.white,
        ],
        child: Scaffold(
            appBar: AppBar(),
            body: Column(children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Welcome to BlueJobs!",
                        style: CustomTextStyle.titleText
                            .copyWith(fontSize: responsiveSize(context, 0.05))),
                  )),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ListBody(
                  children: [
                    CustomButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavBarPage()));
                        },
                        buttonText: 'Get Started'),
                  ],
                ),
              )
            ])));
  }
}

//employer
class EmployerForm extends StatefulWidget {
  const EmployerForm({super.key});

  @override
  State<EmployerForm> createState() => _EmployerFormState();
}

class _EmployerFormState extends State<EmployerForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Hmmm... Blue Collar Job Hunter or an Employer?',
                style: CustomTextStyle.semiBoldText
                    .copyWith(fontSize: responsiveSize(context, 0.05))),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ListBody(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomInkWellButton(
                  buttonText: 'Residential',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResidentialEmployerPage()),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomInkWellButton(
                  buttonText: 'Small time Business Owner',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlueCollarJobHuntersForm()),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
