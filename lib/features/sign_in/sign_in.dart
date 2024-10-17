import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height / 10,
                ),
                SvgPicture.asset(
                  'assets/app_icon_white.svg',
                ),
                SizedBox(
                  width: size.width,
                  height: size.height / 24,
                ),
                Align(alignment: Alignment.topLeft, child: Text('Email')),
                SizedBox(
                  width: size.width,
                  height: size.height / 72,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height / 80,
                ),
                Align(alignment: Alignment.topLeft, child: Text('Password')),
                SizedBox(
                  width: size.width,
                  height: size.height / 72,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!tapped) {
                            tapped = true;
                          } else {
                            tapped = false;
                          }
                        });
                        print('Eye was tapped');
                      },
                      child: tapped == true
                          ? Icon(Icons.remove_red_eye_rounded)
                          : Icon(Icons.remove_red_eye_outlined),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height / 40,
                ),
                SizedBox(
                  width: size.width,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF240F43),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    onPressed: () {
                      setState(() {
                        
                      });
                    },
                    child: Text(
                      'LOG IN',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                emailController.text == ''
                    ? const SizedBox.shrink()
                    : Column(
                        children: [
                          Text(emailController.text),
                          Text(passwordController.text),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
