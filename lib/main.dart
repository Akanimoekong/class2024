/*
import 'package:class2024/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'features/order/order_Screen.dart';
import 'features/sign_in/sign_in.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our App',
      theme: lightTheme,
      routes: {
        AppRoutes.home : (context) => HomeScreen(),
        AppRoutes.signIn : (context) => SignInScreen(),
        AppRoutes.order : (context) => OrderScreen(),

      },
      // home: HomeScreen(),

    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String appIcon = 'assets/app_icon.svg';
  late Widget? myIcon;

  @override
  void initState() {
    myIcon = SvgPicture.asset(appIcon);
    Future.delayed(const Duration(seconds: 5)).then((_) {
      Navigator.pushNamed(context, AppRoutes.signIn);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const SignInScreen(),
      //   ),
      // );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF240F43),
        body: Center(
          child: myIcon,
        ),
      ),
    );
  }
}

class AppRoutes {
  static String home = '/';
  static String signIn = '/sign_in';
  static String order = '/order_screen';

}

*/

import 'dart:convert';
import 'dart:developer';

import 'package:class2024/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'network/api_client.dart';

void main() {
  runApp(const NewApp());
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeather();

  }

  getWeather() async {
    final weatherService = WeatherService();

    try {
      // Port Harcourt coordinates
      final weatherData = await weatherService.getWeatherData(
        latitude: 4.6423,
        longitude: 7.9244,
      );
      log(weatherData.toString());
      // // Get current weather
      // final currentWeather = weatherService.parseCurrentWeather(weatherData);
      // print('Current Weather:');
      // print('Temperature: ${currentWeather['temperature']}');
      // print('Rain: ${currentWeather['rain']}');
      // print('Is Day: ${currentWeather['isDay']}');
      // print('Pressure MSL: ${currentWeather['pressureMsl']}');
      // print('Surface Pressure: ${currentWeather['surfacePressure']}');
      //
      // // Get hourly forecast
      // print('\nHourly Forecast:');
      // final hourlyForecasts = weatherService.parseHourlyForecast(weatherData);
      // for (final forecast in hourlyForecasts) {
      //   print('\nTime: ${forecast['time']}');
      //   print('Temperature: ${forecast['temperature']}');
      //   print('Rain: ${forecast['rain']}');
      //   print('Showers: ${forecast['showers']}');
      //   print('Sunshine Duration: ${forecast['sunshine']}');
      // }
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {

            showModalBottomSheet(context: context, builder: (context){
              return Container(child: Center(child: Text('This is the Bottom Modal'),),);
            });
            /*
            User result = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondScreen()));

            if (result != null) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Here is the Result:  ${result.firstName}\n'
                          '${result.lastName}\n'
                          '${result.schoolName}\n'
                          '${result.dept}\n'),
                    );
                  });
            }*/



          },
          child: Text(
            'Go to SecondScreen',
            style: lightTheme.textTheme.bodyMedium,
          ),
        ),
      ),
    ));
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController deptNameController = TextEditingController();
  // String name = 'Akanimo Ekong';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
      SizedBox(height: 10,),
            TextField(
              controller: firstNameController,
            ),
            SizedBox(height: 10,),

            TextField(

              controller: lastNameController,
            ),
            SizedBox(height: 10,),

            TextField(
              controller: schoolNameController,
            ),
            SizedBox(height: 10,),

            TextField(
              controller: deptNameController,
            ),
            SizedBox(height: 10,),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, User(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    schoolName: schoolNameController.text,
                    dept: deptNameController.text));

                },child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   firstNameController.dispose();
  //   lastNameController.dispose();
  //   schoolNameController.dispose();
  //   deptNameController.dispose();
  //   super.dispose();
  // }
}
// google.com/api/signIn
class User{
  String firstName;
  String lastName;
  String schoolName;
  String dept;

  User({
    required this.firstName,
    required this.lastName,
    required this.schoolName,
    required this.dept,
  });
}
