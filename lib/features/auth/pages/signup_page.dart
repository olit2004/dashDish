import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/components/primary_button.dart';
import '../../../shared/components/custom_text_field.dart'; 
import '../../../core/providers/auth_provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignup() async {
    final authProvider = context.read<AuthProvider>();
    await authProvider.signup(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (mounted && authProvider.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(authProvider.error!), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
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

                          CustomTextField(
                            hint: "Full Name",
                            icon: Icons.person_outline,
                            controller: _nameController,
                          ),
                          const SizedBox(height: 18),
                          
                          CustomTextField(
                            hint: "Email",
                            icon: Icons.email_outlined,
                            controller: _emailController,
                          ),
                          const SizedBox(height: 18),
                          
                          CustomTextField(
                            hint: "Address",
                            icon: Icons.location_on_outlined,
                            controller: _addressController,
                          ),
                          const SizedBox(height: 18),
                          
                          CustomTextField(
                            hint: "Password",
                            icon: Icons.lock_outline,
                            isPassword: true,
                            controller: _passwordController,
                          ),

                          const SizedBox(height: 30),
                          
                          if (authProvider.isLoading)
                            const CircularProgressIndicator(color: Color(0xFFEF6C00))
                          else
                            PrimaryButton(
                              text: "Create Account",
                              onPressed: _handleSignup,
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
                                onPressed: () => context.pop(),
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