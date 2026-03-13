import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashdish/components/primary_button.dart';
import 'package:dashdish/components/custom_text_field.dart'; // Import your new widget

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Keep background outside SafeArea to color the status bar area too
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1B1E23), Color(0xFF161719)],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Image.asset("assets/img/logo.png", height: 70),
                          const SizedBox(height: 25),
                          
                          Text(
                            "Create Account",
                            style: GoogleFonts.itim(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Sign up to start ordering delicious food",
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          
                          const SizedBox(height: 40),

                          /// Using the modularized components
                          const CustomTextField(
                            hint: "Full Name",
                            icon: Icons.person_outline,
                          ),
                          const SizedBox(height: 18),
                          
                          const CustomTextField(
                            hint: "Email",
                            icon: Icons.email_outlined,
                          ),
                          const SizedBox(height: 18),
                          
                          const CustomTextField(
                            hint: "Address",
                            icon: Icons.location_on_outlined,
                          ),
                          const SizedBox(height: 18),
                          
                          const CustomTextField(
                            hint: "Password",
                            icon: Icons.lock_outline,
                            isPassword: true,
                          ),

                          const SizedBox(height: 30),
                          
                          PrimaryButton(
                            text: "Create Account",
                            onPressed: () {},
                          ),

                          // Pushes the login link to the bottom
                          const Spacer(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?",
                                style: TextStyle(color: Colors.white70),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  "Log in",
                                  style: TextStyle(
                                    color: Color(0xFFEF6C00),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}