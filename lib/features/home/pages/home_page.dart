import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../shared/models/food_item.dart';
import '../../../core/providers/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<FoodItem> popularItems = const [
    FoodItem(
      title: "Margherita Pizza",
      image: "https://images.unsplash.com/photo-1601924582975-7e5d0c0f3c5b?q=80&w=400&auto=format",
      price: 8.99,
      description: "Classic pizza with tomato, mozzarella, and basil",
    ),
    FoodItem(
      title: "Beef Burger",
      image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=400&auto=format",
      price: 6.50,
      description: "Juicy beef patty with cheese and fresh veggies",
    ),
    FoodItem(
      title: "Chicken Shawarma",
      image: "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?q=80&w=400&auto=format",
      price: 5.75,
      description: "Spiced chicken wrapped with garlic sauce",
    ),
    FoodItem(
      title: "Sushi Platter",
      image: "https://images.unsplash.com/photo-1579888944880-d98341245702?q=80&w=400&auto=format",
      price: 12.00,
      description: "Assorted fresh sushi selection",
    ),
    FoodItem(
      title: "Pasta Alfredo",
      image: "https://images.unsplash.com/photo-1621996346565-e3dbc353d2e5?q=80&w=400&auto=format",
      price: 9.25,
      description: "Creamy alfredo pasta with parmesan",
    ),
  ];

  final List<FoodItem> menuItems = const [
    FoodItem(
      title: "Spicy Ramen",
      image: "https://images.unsplash.com/photo-1605478371310-a9f1e96b4ff4?q=80&w=400&auto=format",
      price: 7.50,
      description: "Hot ramen with rich broth and spices",
    ),
    FoodItem(
      title: "Fried Chicken",
      image: "https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?q=80&w=400&auto=format",
      price: 6.99,
      description: "Crispy golden fried chicken",
    ),
    FoodItem(
      title: "Grilled Steak",
      image: "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?q=80&w=400&auto=format",
      price: 14.99,
      description: "Juicy grilled steak cooked to perfection",
    ),
    FoodItem(
      title: "Caesar Salad",
      image: "https://images.unsplash.com/photo-1550304943-4f24f54ddde9?q=80&w=400&auto=format",
      price: 5.50,
      description: "Fresh salad with Caesar dressing",
    ),
    FoodItem(
      title: "Chocolate Cake",
      image: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?q=80&w=400&auto=format",
      price: 4.75,
      description: "Rich chocolate layered cake",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161719),
      drawer: _drawer(context),
      bottomNavigationBar: _bottomNav(),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _header(context),
            _sectionTitle("Popular near you"),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: popularItems.length,
                  itemBuilder: (context, index) {
                    return FoodCard(item: popularItems[index]);
                  },
                ),
              ),
            ),

            _sectionTitle("Items"),

            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    return FoodListItem(item: menuItems[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                Image.asset("assets/img/logo.png", height: 60),
                IconButton(
                  onPressed: () => context.push('/profile'),
                  icon: const Icon(Icons.person_outline, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Browse Restaurants",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            _searchBar(),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.black54),
          hintText: "Search...",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _bottomNav() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF1B1E23),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white38,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: ""),
      ],
    );
  }

  Widget _drawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1B1E23),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF2C2F33)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  "DashDish",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  context.read<AuthProvider>().userEmail ?? "user@example.com",
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          _drawerItem(Icons.home_outlined, "Home", () => Navigator.pop(context)),
          _drawerItem(Icons.shopping_bag_outlined, "My Orders", () {
            Navigator.pop(context);
            context.push('/orders');
          }),
          _drawerItem(Icons.person_outline, "Profile", () {
            Navigator.pop(context);
            context.push('/profile');
          }),
          const Divider(color: Colors.white12),
          _drawerItem(Icons.logout, "Logout", () {
            Navigator.pop(context);
            context.read<AuthProvider>().logout();
          }),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(title, style: const TextStyle(color: Colors.white70)),
      onTap: onTap,
    );
  }
}

class FoodCard extends StatelessWidget {
  final FoodItem item;

  const FoodCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/food-details', extra: item),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(item.image),
            fit: BoxFit.cover,
          ),
        ),
        child: _overlay(),
      ),
    );
  }

  Widget _overlay() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Text(
        item.title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class FoodListItem extends StatelessWidget {
  final FoodItem item;

  const FoodListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/food-details', extra: item),
      child: Container(
        height: 90,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2F33),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(15)),
              child: Image.network(
                item.image,
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}