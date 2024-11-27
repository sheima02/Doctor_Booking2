
import 'package:flutter/material.dart';
import 'EditProfileScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Sam";
  String email = "SAM@gmail.com";
  String phone = "+775567890";
  List<String> additionalInfo = [];

  void _addAdditionalInfo() {
    String newInfo = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Additional Information'),
          content: TextField(
            onChanged: (value) {
              newInfo = value;
            },
            decoration: InputDecoration(hintText: "Enter your information"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (newInfo.isNotEmpty) {
                  setState(() {
                    additionalInfo.add(newInfo);
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Color(0xFF7165D6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("images/person.jpg"),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Name: $name",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Email: $email",
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Text(
              "Phone: $phone",
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      initialName: name,
                      initialEmail: email,
                      initialPhone: phone,
                    ),
                  ),
                );

                if (result != null) {
                  setState(() {
                    name = result['name'];
                    email = result['email'];
                    phone = result['phone'];
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF7165D6),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Edit Profile",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addAdditionalInfo,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF28A745),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Add Information",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Divider(thickness: 2),
            SizedBox(height: 20),
            Text(
              "Additional Information",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: additionalInfo.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      additionalInfo[index],
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
