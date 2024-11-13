import 'package:class2024/components/name_container.dart';
import 'package:class2024/main.dart';
import 'package:class2024/utils/app_theme.dart';
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
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Email',
                      style: lightTheme.textTheme.bodyMedium,
                    )),
                SizedBox(
                  width: size.width,
                  height: size.height / 72,
                ),
                TextField(
                  controller: emailController,
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
                      // Navigator.pushNamed(context, AppRoutes.order);
                      // setState(() {});
                    },
                    child: Text(
                      'LOG IN',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height / 40,
                ),
                NameContainer(
                    imageUrl: 'https://dummyimage.com/750x550/996633/fff',
                    nameOfStudent: 'Henry'),
                NameContainer(
                    imageUrl: 'https://dummyimage.com/550x350/3399ff/000',
                    nameOfStudent: 'Kalu')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
