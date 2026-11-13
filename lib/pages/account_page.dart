import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('My Account'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Color(0xFF4CAF50).withOpacity(0.92),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'john.doe@example.com',
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildAccountItem(Icons.shopping_bag, 'My Orders', () {}),
                  _buildAccountItem(Icons.favorite_border, 'Wishlist', () {}),
                  _buildAccountItem(Icons.location_on, 'Addresses', () {}),
                  _buildAccountItem(Icons.payment, 'Payment Methods', () {}),
                  _buildAccountItem(
                    Icons.notifications,
                    'Notifications',
                    () {},
                  ),
                  _buildAccountItem(Icons.help_outline, 'Help Center', () {}),
                  const Divider(height: 30),
                  _buildAccountItem(Icons.logout, 'Log Out', () {
                    Navigator.pushReplacementNamed(context, '/login');
                  }, color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    Color? color,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: color ?? const Color(0xFF4CAF50)),
        title: Text(title, style: TextStyle(color: color ?? Colors.black)),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
