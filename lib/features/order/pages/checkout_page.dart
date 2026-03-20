import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text("Checkout", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoSection(),
              const SizedBox(height: 30),
              const SectionTitle("Delivery address"),
              const SizedBox(height: 15),
              const AddressBox(),
              const SizedBox(height: 30),
              const SectionTitle("Payment method"),
              const SizedBox(height: 15),
              PaymentOption(
                method: "CBE Birr",
                selected: selectedPayment,
                onSelect: (m) => setState(() => selectedPayment = m),
              ),
              PaymentOption(
                method: "tele-Birr",
                selected: selectedPayment,
                onSelect: (m) => setState(() => selectedPayment = m),
              ),
              PaymentOption(
                method: "e-pay",
                selected: selectedPayment,
                onSelect: (m) => setState(() => selectedPayment = m),
              ),
              const SizedBox(height: 30),
              const SectionTitle("Order summary"),
              const SizedBox(height: 15),
              const SummaryRow(label: "sub total", value: "600 birr"),
              const SummaryRow(label: "delivery fee", value: "80 birr"),
              const SummaryRow(label: "tax", value: "90 birr"),
              const SizedBox(height: 10),
              const SummaryRow(label: "total", value: "770 birr", isTotal: true),
              const SizedBox(height: 30),
              const PlaceOrderButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/img/logo.png", height: 60),
        const SizedBox(width: 10),
        const Text("DashDish",
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(color: Colors.white, fontSize: 20));
  }
}

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Text("5 kilo Addis Ababa",
              style: TextStyle(color: Colors.white70)),
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
}

class PaymentOption extends StatelessWidget {
  final String method;
  final String selected;
  final ValueChanged<String> onSelect;

  const PaymentOption({
    super.key,
    required this.method,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selected == method;
    return GestureDetector(
      onTap: () => onSelect(method),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(vertical: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.white10,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white24),
        ),
        child: Text(method, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
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
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
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
        onPressed: () => context.push('/order-success'),
        child: const Text("Place order",
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}