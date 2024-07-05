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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  InkWell(
  onTap: () {
    setState(() {
      _isEmployer = false; // Set user as Blue Collar Job Hunter
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlueCollarJobHuntersForm(isEmployer: _isEmployer),
      ),
    );
  },
  child: Container(
    width: MediaQuery.of(context).size.width - 50,
    height: 54,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: const Color.fromARGB(255, 7, 30, 47),
    ),
    child: Center(
      child: Text(
        'I am a Blue Collar Job Hunter',
        style: CustomTextStyle.regularText.copyWith(
          color: Colors.white,
        ),
      ),
    ),
  ),
),

                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isEmployer = true; // Set user as Employer
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlueCollarJobHuntersForm(isEmployer: _isEmployer), // Navigate to the same form for both types of users
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 7, 30, 47),
                      ),
                      child: Center(
                        child: Text(
                          'I am an Employer',
                          style: CustomTextStyle.regularText.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (!_isEmployer) // Only show this for Blue Collar Job Hunters
                    CustomButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ButtonSpecializationPage(),
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
                padding: const EdgeInsets.all(10),
                child: ListBody(
                  children: [
                    TextField(
                      controller: _fullNameController,
                      focusNode: _fullNameFocusNode,
                      decoration: customInputDecoration('Full Name'),
                      style: const TextStyle(color: Colors.black),
                      
                    ),
                    if (_isFullNameFocused)
                       Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Enter your full name. Ex. Juan A. Dela CRUZ',
                          // style: TextStyle(color: Colors.grey, fontSize: 12),
                          style: CustomTextStyle.regularText.copyWith(color: Colors.grey),
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
            padding: const EdgeInsets.all(10),
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
                        color: const Color.fromARGB(
                            255, 19, 52, 77), // Set the border color to blue
                        width: 1, // Set the border width
                      ),
                    ),
                    child: const Center(
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
                        color: const Color.fromARGB(
                            255, 19, 52, 77), // Set the border color to blue
                        width: 1, // Set the border width
                      ),
                    ),
                    child: const Center(
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
                    suffixIcon: const Icon(Icons.search),
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
                  style: CustomTextStyle.lightText.copyWith(
                    fontSize: responsiveSize(context, 0.03),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: customInputDecoration(
                    'Password',
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
      ConfettiController(duration: const Duration(seconds: 10));

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
                                  //builder: (context) => const NavBarPage()));
                                    builder: (context) => const ButtonSpecializationPage()));
                        },
                        buttonText: 'Next'),
                  ],
                ),
              )
            ])));
  }
}


class ButtonSpecializationPage extends StatefulWidget {
  const ButtonSpecializationPage({super.key});

  @override
  State<ButtonSpecializationPage> createState() => _ButtonSpecializationPageState();
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
      appBar: AppBar(),
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
                  style: CustomTextStyle.titleText.copyWith(fontSize: responsiveSize(context, 0.05)),
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
                      return ChoiceChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              skill,
                              style: TextStyle(
                                color: isSelected ? Colors.white : const Color.fromARGB(255, 12, 14, 16),
                                fontSize: responsiveSize(context, 0.03),
                              ),
                            ),
                            if (isSelected) ...[
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              ),
                            ]
                          ],
                        ),
                        selected: isSelected,
                        selectedColor: const Color.fromARGB(255, 19, 52, 77),
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
                    }).toList(),
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


