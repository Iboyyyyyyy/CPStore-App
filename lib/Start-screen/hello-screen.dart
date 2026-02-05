import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Shop', style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold)),
        actions: [
          Container(
            width: 200,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, size: 20),
                suffixIcon: Icon(Icons.camera_alt_outlined, size: 20),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPromoBanner(),
            _buildSectionHeader("Categories"),
            _buildCategoryGrid(),
            _buildSectionHeader("Top Products"),
            _buildTopProducts(),
            _buildSectionHeader("Flash Sale", hasTimer: true),
            _buildFlashSaleItems(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }

  // 1. Big Sale Banner
  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(colors: [Color(0xFFFFC107), Color(0xFFFF9800)]),
      ),
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Big Sale", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Up to 50%", style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
          Positioned(right: 0, bottom: 0, child: Icon(Icons.shopping_basket, size: 120, color: Colors.white.withOpacity(0.3))),
        ],
      ),
    );
  }

  // 2. Reusable Header
  Widget _buildSectionHeader(String title, {bool hasTimer = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              if (hasTimer) ...[
                const SizedBox(width: 8),
                const Icon(Icons.timer_outlined, size: 18, color: Colors.blue),
                const Text(" 00:36:58", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              ]
            ],
          ),
          const Text("See All >", style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  // 3. Category Grid (Example for 'Clothing' block)
  Widget _buildCategoryGrid() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        padding: const EdgeInsets.only(left: 16),
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
                    child: const Icon(Icons.style, size: 40, color: Colors.grey),
                  ),
                ),
                const Text("Clothing", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("103 items", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }

  // 4. Flash Sale / Products
  Widget _buildFlashSaleItems() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container(color: Colors.grey[100])),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Lorem Ipsum Item", style: TextStyle(fontSize: 14)),
                    Text("\$17.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildTopProducts() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: CircleAvatar(radius: 35, backgroundColor: Colors.blueAccent),
        ),
      ),
    );
  }
}