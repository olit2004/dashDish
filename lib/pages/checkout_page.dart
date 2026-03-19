import 'package:flutter/material.dart';
import 'order_success_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedPayment = "CBE Birr";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161719),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _logo(),

              const SizedBox(height: 30),

              const Text(
                "Delivery address",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),

              const SizedBox(height: 15),

              _addressBox(),

              const SizedBox(height: 30),

              const Text(
                "Payment method",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),

              const SizedBox(height: 15),

              _paymentOption("CBE Birr"),
              _paymentOption("tele-Birr"),
              _paymentOption("e-pay"),

              const SizedBox(height: 30),

              const Text(
                "Order summary",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),

              const SizedBox(height: 15),

              _summaryRow("sub total", "600 birr"),
              _summaryRow("delivery fee", "80 birr"),
              _summaryRow("tax", "90 birr"),

              const SizedBox(height: 10),

              _summaryRow("total", "770 birr", isTotal: true),

              const Spacer(),

              _placeOrderButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Row(
      children: [
        Image.asset("assets/img/logo.png", height: 60),
        const SizedBox(width: 10),
        const Text(
          "DashDish",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }

  Widget _addressBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "5 kilo Addis Ababa",
            style: TextStyle(color: Colors.white70),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text("Change",
                style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  Widget _paymentOption(String method) {
    final isSelected = selectedPayment == method;

    return GestureDetector(
      onTap: () => setState(() => selectedPayment = method),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(vertical: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.white10,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white24),
        ),
        child: Text(
          method,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: isTotal ? 18 : 14)),
          Text(value,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: isTotal ? 18 : 14,
                  fontWeight:
                      isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _placeOrderButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const OrderSuccessPage(),
            ),
          );
        },
        child: const Text(
          "Place order",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}