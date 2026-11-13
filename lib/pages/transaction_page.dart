import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Method',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildPaymentMethod('Credit/Debit Card', Icons.credit_card, true),
            _buildPaymentMethod('PayPal', Icons.payment, false),
            _buildPaymentMethod('Cash on Delivery', Icons.money, false),
            const SizedBox(height: 30),
            const Text(
              'Shipping Address',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '123 Green Street, Garden City',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    Text(
                      '+1 (555) 123-4567',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Change',
                          style: TextStyle(color: Color(0xFF4CAF50)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildOrderRow('Subtotal', '\$103.48'),
                    _buildOrderRow('Shipping', '\$9.99'),
                    _buildOrderRow('Tax', '\$8.28'),
                    const Divider(),
                    _buildOrderRow('Total', '\$121.75', isTotal: true),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Icon(
                        Icons.check_circle,
                        color: Color(0xFF4CAF50),
                        size: 60,
                      ),
                      content: const Text(
                        'Order Placed Successfully!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(color: Color(0xFF4CAF50)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Place Order',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(String title, IconData icon, bool isSelected) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: isSelected ? const Color(0xFFE8F5E9) : Colors.white,
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF4CAF50)),
        title: Text(title),
        trailing: isSelected
            ? const Icon(Icons.radio_button_checked, color: Color(0xFF4CAF50))
            : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
        onTap: () {},
      ),
    );
  }

  Widget _buildOrderRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal
                ? const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                : TextStyle(color: Colors.grey[600]),
          ),
          Text(
            value,
            style: isTotal
                ? const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4CAF50),
                  )
                : const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
