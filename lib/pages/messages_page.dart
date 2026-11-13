import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
      ),
      body: ListView(
        children: [
          _buildMessageItem(
            'Customer Support',
            'How can I help you today?',
            '10:30 AM',
            true,
          ),
          _buildMessageItem(
            'Plant Care Tips',
            'Watering schedule reminder',
            'Yesterday',
            false,
          ),
          _buildMessageItem(
            'Order Update',
            'Your order has been shipped!',
            'Dec 12',
            false,
          ),
          _buildMessageItem(
            'Special Offer',
            '20% off on all succulents',
            'Dec 10',
            false,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF4CAF50),
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }

  Widget _buildMessageItem(
    String name,
    String message,
    String time,
    bool isUnread,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFE8F5E9),
        child: Text(name[0], style: const TextStyle(color: Color(0xFF4CAF50))),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Text(
        message,
        style: TextStyle(
          color: isUnread ? Colors.black : Colors.grey[600],
          fontWeight: isUnread ? FontWeight.w500 : FontWeight.normal,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          if (isUnread)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
        ],
      ),
      onTap: () {},
    );
  }
}
