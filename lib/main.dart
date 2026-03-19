import 'package:dashdish/login_page.dart';
import 'package:dashdish/onboarding_page.dart';
import 'package:dashdish/signup_page.dart';
import 'package:flutter/material.dart'; 
import 'package:dashdish/home_page.dart';  
 
void main() {
  runApp(const DashDishApp());
}

class DashDishApp extends StatelessWidget {
  const DashDishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DashDish',
      
      home: const OnboardingPage(), 
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(), 
        '/dashboard':(context)=> const HomePage()
      },
    );
  }
}
