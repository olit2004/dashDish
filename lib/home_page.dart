import 'package:dashdish/components/primary_button.dart';
import 'package:dashdish/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showAuthButtons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1B1E23), Color(0xFF161719)],
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
                    Image.asset("assets/img/logo.png", height: 60),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              // Title
              Text(
                "Hungry?",
                style: GoogleFonts.itim(
                  fontSize: 64,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                "We’re already on the way.",
                style: TextStyle(color: Colors.white70, fontSize: 20),
              ),

              const Spacer(),

              // Burger Image + Overlay Buttons
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/img/cheeseBurger.png",
                    width: double.infinity,
                    height: 320,
                    fit: BoxFit.cover,
                  ),

                  if (_showAuthButtons)
                    Positioned(
                      bottom: 40,
                      left: 20,
                      right: 20,
                      child: Column(
                        children: [
                   
                      PrimaryButton(
                        text: "Login",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        },
                      ),
                          
                          PrimaryButton(
                            text: "Sign Up",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                ],
              ),

              const Spacer(),

              // Get Started Button
              if (!_showAuthButtons)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: PrimaryButton(
                    text: "Get Started",
                    onPressed: () {
                      setState(() {
                        _showAuthButtons = true;
                      });
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}