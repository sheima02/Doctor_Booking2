
import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isAccountSecure = false;
  bool _isPrivate = false;
  bool _isAccountPrivicy = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text("Account Security"),
              trailing: Switch(
                value: _isAccountSecure,
                onChanged: (value) {
                  setState(() {
                    _isAccountSecure = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Account Priviacy"),
              trailing: Switch(
                value: _isAccountPrivicy,
                onChanged: (value) {
                  setState(() {
                    _isAccountPrivicy = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Privacy"),
              trailing: Switch(
                value: _isPrivate,
                onChanged: (value) {
                  setState(() {
                    _isPrivate = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Notifications"),
              subtitle: Text("Manage your notifications settings"),
            ),
          ],
        ),
      ),
    );
  }
}
