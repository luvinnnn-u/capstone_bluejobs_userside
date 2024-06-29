import 'package:bluejobs_user/screens/signup.dart';
import 'package:bluejobs_user/styles/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bluejobs_user/styles/custom_button.dart';
import 'package:bluejobs_user/styles/responsive_utils.dart';
import 'package:bluejobs_user/screens/password_change.dart';
import 'package:bluejobs_user/nav/nav.bar.dart'; //for nav



class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 7, 30, 47),
        ),
        backgroundColor: Color.fromARGB(255, 19, 52, 77),
        //backgroundColor: Color(0xFF0A5BF5),
        body:
       Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/bluejobs.svg',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _userNameController,
                decoration: const InputDecoration(
                    labelText: 'Username',
                    labelStyle: CustomTextStyle.regularText,
                    fillColor:
                        Colors.white, // Set the background color to white
                    filled: true,
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText:
                    _obscureText, // Use the _obscureText variable to control the visibility
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: CustomTextStyle
                      .regularText, // Assuming CustomTextStyle is defined elsewhere
                  fillColor: Colors.white, // Set the background color to white
                  filled: true,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Choose the icon based on whether the text is obscured
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Toggle the state of _obscureText between true and false
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
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
                            builder: (context) => const NavBarPage()));
                  },
                  buttonText: 'Sign In'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigate to the registration page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      "Register here",
                      style: CustomTextStyle.regularText.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                      width:
                          3), // Add some space between the button and the text
                  InkWell(
                    onTap: () {
                      // Navigate to the Password Change Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PasswordChange()),
                      );
                    },
                    child: Text(
                      "Change Password",
                      style: CustomTextStyle.regularText.copyWith(
                        color: Colors.white,
                        decoration: TextDecoration
                            .underline, // Optional: underline the text
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    
    )
    );
  }
}
