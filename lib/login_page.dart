import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashdish/components/primary_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),

                /// Logo
                Image.asset(
                  "assets/img/logo.png",
                  height: 70,
                ),

                const SizedBox(height: 25),

                /// Title
                Text(
                  "Welcome Back",
                  style: GoogleFonts.itim(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Log in to continue ordering your favorite food",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                /// Email
                _customTextField(
                  hint: "Email",
                  icon: Icons.email_outlined,
                ),

                const SizedBox(height: 18),

                /// Password
                _customTextField(
                  hint: "Password",
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),

                const SizedBox(height: 10),

                /// Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// Primary action
                PrimaryButton(
                  text: "Log in",
                  onPressed: () {},
                ),

                const Spacer(),

                /// Sign up (secondary action)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account?",
                      style: TextStyle(color: Colors.white70),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign up",
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
  }

  Widget _customTextField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white70),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white60),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        ),
      ),
    );
  }
}