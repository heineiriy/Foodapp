import 'package:flutter/material.dart';
import 'package:foodapp/pages/home_page.dart';
import 'plants_selection_page.dart';

// NOTE: Ensure your 'home_page.dart' defines the 'Category' class
// and 'plants_selection_page.dart' defines 'PlantsSelectionPage'.

class CategoryPlantsPage extends StatelessWidget {
  final Category category;

  const CategoryPlantsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Sample plants for each category
    final Map<String, List<Plant>> categoryPlants = {
      'Indoor': [
        Plant(
          name: 'Monstera Deliciosa',
          price: 45.99,
          description: 'Easy to care, perfect for indoors',
          image: 'assets/monstera.jpg',
          rating: 4.5,
          light: 'Medium indirect light',
          water: 'Weekly',
          size: 'Medium',
        ),
        Plant(
          name: 'Snake Plant',
          price: 32.50,
          description: 'Air purifying, low maintenance',
          image: 'assets/snake.jpg',
          rating: 4.7,
          light: 'Low to bright',
          water: 'Every 2-3 weeks',
          size: 'Small to Large',
        ),
        Plant(
          name: 'Peace Lily',
          price: 28.99,
          description: 'Beautiful flowering indoor plant',
          image: 'assets/lily.jpg',
          rating: 4.6,
          light: 'Medium indirect light',
          water: 'Weekly',
          size: 'Medium',
        ),
        Plant(
          name: 'ZZ Plant',
          price: 39.99,
          description: 'Extremely low maintenance',
          image: 'assets/zz.jpg',
          rating: 4.8,
          light: 'Low to bright',
          water: 'Every 3-4 weeks',
          size: 'Medium',
        ),
      ],
      'Outdoor': [
        Plant(
          name: 'Rose Bush',
          price: 29.99,
          description: 'Classic flowering outdoor plant',
          image: 'assets/rose.jpg',
          rating: 4.4,
          light: 'Full sun',
          water: 'Twice weekly',
          size: 'Large',
        ),
        Plant(
          name: 'Lavender',
          price: 24.99,
          description: 'Fragrant and beautiful',
          image: 'assets/lavender.jpg',
          rating: 4.7,
          light: 'Full sun',
          water: 'Weekly',
          size: 'Medium',
        ),
        Plant(
          name: 'Tomato Plant',
          price: 19.99,
          description: 'Grow your own vegetables',
          image: 'assets/tomato.jpg',
          rating: 4.3,
          light: 'Full sun',
          water: 'Daily',
          size: 'Medium',
        ),
      ],
      // Add more categories as needed...
    };

    final plants = categoryPlants[category.name] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        backgroundColor: category.color,
      ),
      body: CustomScrollView(
        slivers: [
          // Hero Header
          SliverAppBar(
            expandedHeight: 200,
            collapsedHeight: 200,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  color: category.color.withOpacity(0.1),
                  image: const DecorationImage(
                    image: AssetImage('assets/plant_bg.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.3,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          category.icon,
                          size: 50,
                          color: category.color,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        category.name,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: category.color,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          category.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Plants Grid
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: plants.isEmpty
                ? SliverToBoxAdapter(
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          Icon(Icons.eco, size: 80, color: Colors.grey[300]),
                          const SizedBox(height: 20),
                          Text(
                            'No plants available in this category',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.8,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final plant = plants[index];
                      return _buildPlantCard(context, plant);
                    }, childCount: plants.length),
                  ),
          ),

          // View All Button
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PlantsSelectionPage(categoryFilter: category.name),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: category.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'View All Plants',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // UPDATED WIDGET: Highly optimized layout for compact fit.
  Widget _buildPlantCard(BuildContext context, Plant plant) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          _showPlantDetails(context, plant);
        },
        child: Padding(
          padding: const EdgeInsets.all(10), // Reduced general padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Image Container with Reduced Fixed Height
              SizedBox(
                height: 110, // Optimized height for a 0.8 aspect ratio card
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(plant.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8), // Reduced spacing
              // 2. Plant Name with maxLines: 2 and reduced font size
              Text(
                plant.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                maxLines: 2, // Allows for two lines
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4), // Reduced spacing
              // 3. Rating Row with smaller icon/text
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber[600], size: 14),
                  const SizedBox(width: 4),
                  Text(
                    plant.rating.toString(),
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              ),
              // No SizedBox here for maximum compactness
              // 4. Price and Add button with smaller font/button size
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${plant.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                  Container(
                    width: 32, // Smaller button size
                    height: 32, // Smaller button size
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Add to cart functionality
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPlantDetails(BuildContext context, Plant plant) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 60,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(plant.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        plant.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        plant.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Plant details grid
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: [
                          _buildDetailItem('Light', plant.light, Icons.light),
                          _buildDetailItem(
                            'Water',
                            plant.water,
                            Icons.water_drop,
                          ),
                          _buildDetailItem('Size', plant.size, Icons.height),
                          _buildDetailItem(
                            'Care Level',
                            'Easy',
                            Icons.emoji_emotions,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Price',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '\$${plant.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4CAF50),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Add to cart
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4CAF50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_cart, size: 20),
                                    SizedBox(width: 8),
                                    Text('Add to Cart'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDetailItem(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF4CAF50), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Plant Model
class Plant {
  final String name;
  final double price;
  final String description;
  final String image;
  final double rating;
  final String light;
  final String water;
  final String size;

  Plant({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.light,
    required this.water,
    required this.size,
  });
}
