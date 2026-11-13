import 'package:flutter/material.dart';
import 'category_plants_page.dart';
import 'plants_selection_page.dart';
import '../cart_page.dart';
import 'messages_page.dart';
import 'account_page.dart';

// ------------------------------------------------------------------
// 1. HOME PAGE (Stateful Navigation)
// ------------------------------------------------------------------

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    PlantsSelectionPage(),
    CartPage(),
    MessagesPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Access theme colors for consistency
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.transparent,
      // Use IndexedStack to only render the visible page while preserving state
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor, // Use theme color
        unselectedItemColor: Colors.grey[600],
        backgroundColor: Colors.white.withOpacity(0.92),
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.eco_outlined),
            activeIcon: Icon(Icons.eco),
            label: 'Plants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            activeIcon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------------
// 2. HOME CONTENT (Stateless View with Helper Widgets)
// ------------------------------------------------------------------

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  // Define categories with data (best practice to move this list outside)
  final List<Category> categories = const [
    Category(
      id: '1',
      name: 'Indoor',
      icon: Icons.home,
      description: 'Perfect for your home interior',
      color: Color(0xFF4CAF50),
      image: 'assets/indoor_plants.jpg',
    ),
    Category(
      id: '2',
      name: 'Outdoor',
      icon: Icons.yard,
      description: 'For gardens and balconies',
      color: Color(0xFF8BC34A),
      image: 'assets/outdoor_plants.jpg',
    ),
    Category(
      id: '3',
      name: 'Succulents',
      icon: Icons.eco,
      description: 'Low maintenance plants',
      color: Color(0xFF689F38),
      image: 'assets/succulents.jpg',
    ),
    Category(
      id: '4',
      name: 'Flowering',
      icon: Icons.local_florist,
      description: 'Colorful blooming plants',
      color: Color(0xFF388E3C),
      image: 'assets/flowering_plants.jpg',
    ),
    Category(
      id: '5',
      name: 'Herbs',
      icon: Icons.spa,
      description: 'Culinary and medicinal herbs',
      color: Color(0xFF2E7D32),
      image: 'assets/herbs.jpg',
    ),
    Category(
      id: '6',
      name: 'Air Purifying',
      icon: Icons.air,
      description: 'Clean your indoor air',
      color: Color(0xFF43A047),
      image: 'assets/air_purifying.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final primaryDark = const Color(0xFF2E7D32); // Dark color constant

    final double topPadding = MediaQuery.of(context).padding.top;

    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.fromLTRB(20, topPadding + 8, 20, 20),
              decoration: BoxDecoration(
                color: primaryColor, // Use theme color
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Plant Lover!',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            'Find your perfect plant',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(
                          Icons.person,
                          color: primaryColor, // Use theme color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search plants...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Categories Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Browse plants by category',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories.map((category) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: _buildCategory(context, category),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // Featured Plants Section - FIXED CARDS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured Plants',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: primaryDark,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PlantsSelectionPage(),
                            ),
                          );
                        },
                        child: Text(
                          'See All',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    children: [
                      _buildPlantCard(context, 'Monstera', '\$45.99'),
                      _buildPlantCard(context, 'Snake Plant', '\$32.50'),
                      _buildPlantCard(context, 'Peace Lily', '\$28.99'),
                      _buildPlantCard(context, 'Aloe Vera', '\$19.99'),
                    ],
                  ),
                ],
              ),
            ),

            // Garden Tools Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Garden Tools',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Essential tools for plant care',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildToolCard(
                          context,
                          'Watering Can',
                          '\$24.99',
                          Icons.water_drop,
                        ),
                        _buildToolCard(
                          context,
                          'Pruning Shears',
                          '\$34.50',
                          Icons.content_cut,
                        ),
                        _buildToolCard(
                          context,
                          'Gardening Gloves',
                          '\$19.99',
                          Icons.agriculture,
                        ),
                        _buildToolCard(
                          context,
                          'Plant Food',
                          '\$14.99',
                          Icons.science,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(BuildContext context, Category category) {
    final primaryColor = Theme.of(context).primaryColor;
    final lightPrimary = primaryColor.withOpacity(0.1);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPlantsPage(category: category),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
          border: Border.all(color: lightPrimary, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: lightPrimary,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(category.icon, color: category.color, size: 28),
            ),
            const SizedBox(height: 10),
            Text(
              category.name,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // FIXED WIDGET: _buildPlantCard (Overflow resolved by reducing image height and spacing)
  Widget _buildPlantCard(BuildContext context, String name, String price) {
    final primaryColor = Theme.of(context).primaryColor;
    final lightPrimary = primaryColor.withOpacity(0.1);

    return AspectRatio(
      aspectRatio: 0.8,
      child: Material(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10), // Reduced Padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Reduced fixed height for the image
              Container(
                height: 100, // Reduced from 120
                width: double.infinity,
                decoration: BoxDecoration(
                  color: lightPrimary,
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/plant_placeholder.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.eco,
                    size: 40, // Reduced size
                    color: primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 8), // Reduced spacing
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15, // Reduced font size
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4), // Reduced spacing
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber[600],
                    size: 14,
                  ), // Reduced size
                  const SizedBox(width: 4),
                  const Text(
                    '4.5',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ), // Reduced size
                  ),
                ],
              ),
              const SizedBox(height: 8), // Reduced spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16, // Reduced font size
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  Container(
                    width: 32, // Reduced button size
                    height: 32, // Reduced button size
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ), // Reduced icon size
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

  Widget _buildToolCard(
    BuildContext context,
    String name,
    String price,
    IconData icon,
  ) {
    final primaryColor = Theme.of(context).primaryColor;
    final lightPrimary = primaryColor.withOpacity(0.1);

    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
        border: Border.all(color: lightPrimary, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: lightPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: primaryColor, size: 30),
          ),
          const SizedBox(height: 15),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            price,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Category Model (Kept here for completeness of home_page file)
class Category {
  final String id;
  final String name;
  final IconData icon;
  final String description;
  final Color color;
  final String image;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.color,
    required this.image,
  });
}
