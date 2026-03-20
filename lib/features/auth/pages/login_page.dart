import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/components/primary_button.dart';
import '../../../shared/components/custom_text_field.dart'; 
import '../../../core/providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    final authProvider = context.read<AuthProvider>();
    await authProvider.login(
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
          onPressed: () => context.go('/'),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),

                          Image.asset(
                            "assets/img/logo.png",
                            height: 80,
                          ),

                          const SizedBox(height: 30),

                          Text(
                            "Welcome Back",
                            style: GoogleFonts.itim(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "Log in to continue ordering your favorite food",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 50),

                          CustomTextField(
                            hint: "Email",
                            icon: Icons.email_outlined,
                            controller: _emailController,
                          ),

                          const SizedBox(height: 20),

                          CustomTextField(
                            hint: "Password",
                            icon: Icons.lock_outline,
                            isPassword: true,
                            controller: _passwordController,
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () => context.push('/forgot-password'),
                              child: const Text(
                                "Forgot password?",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          if (authProvider.isLoading)
                            const CircularProgressIndicator(color: Color(0xFFEF6C00))
                          else
                            PrimaryButton(
                              text: "Log in",
                              onPressed: _handleLogin,
                            ),

                          const Spacer(),

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don’t have an account?",
                                style: TextStyle(color: Colors.white70),
                              ),
                              TextButton(
                                onPressed: () => context.push('/signup'),
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
            },
          ),
        ),
      ),
    );
  }
}