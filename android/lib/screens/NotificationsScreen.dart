
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<String> notifications = [
    "Your doctor replied to your question: 'Can I take this medicine?",
  "Your appointment with Dr. has been confirmed.",
  "Reminder: You have an appointment tomorrow.",
  "Please review your test results.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifiction"),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]),
            leading: Icon(Icons.notifications),
          );
        },
      ),
    );
  }
}
