import 'package:dashdish/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1B1E23),
              Color(0xFF161719),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [

              const SizedBox(height: 40),

              // Logo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/img/logo.png",
                      height: 60,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              // Headline
            Text(
                "Hungry?",
                style: GoogleFonts.itim(
                  fontSize: 64,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
                            
            

              const SizedBox(height: 10),

              const Text(
                "We’re already on the way.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                ),
              ),

              const Spacer(),

              //Burger Image (when you add it later)
              Image.asset(
                    "assets/img/cheeseBurger.png",
                    width: double.infinity,
                    height: 320,
                    fit: BoxFit.cover,
                  ),

              const Spacer(),

              // Button
              PrimaryButton(
                text: "Get Started",
                onPressed: () {
                  print("Button clicked");
                },
              )
              ],
          ),
        ),
      ),
    );
  }
}