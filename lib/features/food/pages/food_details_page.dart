import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/models/food_item.dart';

class FoodDetailsPage extends StatefulWidget {
  final FoodItem item;

  const FoodDetailsPage({super.key, required this.item});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int selectedPatty = 0;
  final Map<String, bool> toppings = {
    "Bacon": false,
    "Fried Egg": false,
    "Kimchi": false,
    "Avocado": false,
    "Mac & Cheese": false,
    "Grilled Pineapple": false,
  };

  bool combo = false;

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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(widget.item.image),
              ),

              const SizedBox(height: 20),

              // TITLE
              Text(
                widget.item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "beef patty, cheddar, tomato, special sauce",
                style: TextStyle(color: Colors.white60),
              ),

              const SizedBox(height: 25),

              // PATTY SIZE
              const Text(
                "Patty size",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (index) {
                  final labels = ["Single", "Double", "Triple"];
                  return Column(
                    children: [
                      Switch(
                        value: selectedPatty == index,
                        onChanged: (_) {
                          setState(() => selectedPatty = index);
                        },
                      ),
                      Text(labels[index],
                          style: const TextStyle(color: Colors.white70)),
                    ],
                  );
                }),
              ),

              const SizedBox(height: 25),

              // TOPPINGS
              const Text(
                "Extra topping",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 20,
                runSpacing: 10,
                children: toppings.keys.map((key) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: toppings[key],
                        onChanged: (val) {
                          setState(() => toppings[key] = val!);
                        },
                      ),
                      Text(key, style: const TextStyle(color: Colors.white70)),
                    ],
                  );
                }).toList(),
              ),

              const SizedBox(height: 25),

              // COMBO
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Make it combo (fries & drink)",
                    style: TextStyle(color: Colors.white),
                  ),
                  Switch(
                    value: combo,
                    onChanged: (val) => setState(() => combo = val),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // COMBO IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://images.unsplash.com/photo-1550547660-d9450f859349?q=80&w=400&auto=format",
                ),
              ),

              const SizedBox(height: 30),

              // BUTTON NAVIGATE TO CHECKOUT
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () => context.push('/checkout'),
                  child: const Text(
                    "View Receipt",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}