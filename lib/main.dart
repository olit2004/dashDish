import 'package:flutter/material.dart'; // ui library tha t comes with flutter 
import 'package:dashdish/home_page.dart';  // file in my /lib where i defined my home page what it ishould look like and how it shoudl cahnge based on the user interaction 
 
void main() {
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
    const MyApp({super.key});
    @override
    Widget build(BuildContext context) {
      return const  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    }
}