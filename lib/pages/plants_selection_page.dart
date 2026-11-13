import 'package:flutter/material.dart';

class PlantsSelectionPage extends StatelessWidget {
  final String? categoryFilter;

  const PlantsSelectionPage({super.key, this.categoryFilter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: categoryFilter != null
            ? Text('$categoryFilter Plants')
            : const Text('All Plants'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Your existing plant items with category filtering
          _buildPlantItem('Monstera Deliciosa', '\$45.99', 'Indoor'),
          _buildPlantItem('Snake Plant', '\$32.50', 'Indoor'),
          _buildPlantItem('Rose Bush', '\$29.99', 'Outdoor'),
          _buildPlantItem('Lavender', '\$24.99', 'Outdoor'),
          _buildPlantItem('Echeveria', '\$19.99', 'Succulents'),
          _buildPlantItem('Jade Plant', '\$22.99', 'Succulents'),
          // Add more plants...
        ],
      ),
    );
  }

  Widget _buildPlantItem(String name, String price, String category) {
    // Filter plants by category if categoryFilter is provided
    if (categoryFilter != null && category != categoryFilter) {
      return const SizedBox.shrink();
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.eco, color: Color(0xFF4CAF50)),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(price),
            const SizedBox(height: 4),
            Chip(
              label: Text(category, style: const TextStyle(fontSize: 12)),
              backgroundColor: const Color(0xFFE8F5E9),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border, color: Colors.grey),
        ),
      ),
    );
  }
}
