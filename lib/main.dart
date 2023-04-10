import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_project/pages/home_screen.dart';
import 'package:webview_project/pages/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Check if the app has been opened before
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstOpen = prefs.getBool('isFirstOpen') ?? true;
  
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: isFirstOpen ? WelcomeScreen() : HomeScreen(),
  ));
  
  // Set the flag in SharedPreferences to indicate that the app has been opened
  if (isFirstOpen) {
    await prefs.setBool('isFirstOpen', false);
  }
}
