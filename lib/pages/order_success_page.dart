import 'package:flutter/material.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161719),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _topBar(context),

              const Spacer(),

              const Text(
                "Order confirmation",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),

              const SizedBox(height: 30),

              _successIcon(),

              const SizedBox(height: 30),

              const Text(
                "Your order is on the way.\nEnjoy your meal!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          "Return to home",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _successIcon() {
    return Container(
      width: 120,
      height: 120,
      decoration: const BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check,
        size: 60,
        color: Colors.black,
      ),
    );
  }
}