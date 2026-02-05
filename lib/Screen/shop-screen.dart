import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Shop', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined, color: Colors.blue)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildPromoBanner(),
            const SizedBox(height: 20),
            _buildCategoryHeader(),
            _buildCategoryGrid(),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Top Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            _buildTopProductsRow(),
          ],
        ),
      ),
    );
  }

  // --- Methods defined BELOW the build function but INSIDE the class ---

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(15)),
      child: const TextField(
        decoration: InputDecoration(hintText: "Search", icon: Icon(Icons.search), border: InputBorder.none),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      height: 160,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Big Sale", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
          Text("Up to 50%", style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Row(
            children: const [
              Text('See All ', style: TextStyle(color: Colors.grey)),
              Icon(Icons.arrow_circle_right, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 0.85,
      children: [
        _categoryItem("Clothing", "109"),
        _categoryItem("Shoes", "530"),
        _categoryItem("Bags", "87"),
        _categoryItem("Lingerie", "218"),
      ],
    );
  }

  Widget _categoryItem(String name, String count) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(15)),
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8),
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: List.generate(4, (i) => Container(color: Colors.grey[300])),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(count, style: const TextStyle(color: Colors.blue, fontSize: 12)),
          ],
        )
      ],
    );
  }

  Widget _buildTopProductsRow() {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(width: 15),
        itemBuilder: (context, index) => const CircleAvatar(radius: 35, backgroundColor: Colors.grey),
      ),
    );
  }
}
// Widget _buildPromoBanner() {
//   return Container(
//     height: 150,
//     decoration: BoxDecoration(
//       color: Colors.orangeAccent,
//       borderRadius: BorderRadius.circular(15),
//     ),
//     child: Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Big Sale', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
//               Text('Up to 50%', style: TextStyle(color: Colors.white, fontSize: 14)),
//             ],
//           ),
//         ),
//         // Add your Image.asset() here for the person model
//       ],
//     ),
//   );
// }
// Widget _buildCategoryGrid() {
//   return GridView.count(
//     crossAxisCount: 2,
//     shrinkWrap: true, // Important for use inside a SingleChildScrollView
//     physics: NeverScrollableScrollPhysics(),
//     mainAxisSpacing: 10,
//     crossAxisSpacing: 10,
//     childAspectRatio: 0.8,
//     children: [
//       _buildCategoryCard('Clothing', '109'),
//       _buildCategoryCard('Shoes', '530'),
//       _buildCategoryCard('Bags', '87'),
//       _buildCategoryCard('Lingerie', '218'),
//     ],
//   );
// }

// Widget _buildCategoryCard(String title, String count) {
//   return Column(
//     children: [
//       Expanded(
//         child: Container(
//           padding: EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: Colors.grey[100],
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: GridView.count(
//             crossAxisCount: 2,
//             mainAxisSpacing: 4,
//             crossAxisSpacing: 4,
//             physics: NeverScrollableScrollPhysics(),
//             children: List.generate(4, (index) => Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4),
//                 color: Colors.grey[300], // Placeholder for images
//               ),
//             )),
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//               decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(8)),
//               child: Text(count, style: TextStyle(fontSize: 10, color: Colors.blue)),
//             )
//           ],
//         ),
//       )
//     ],
//   );
// }