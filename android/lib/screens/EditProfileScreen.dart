
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String initialName;
  final String initialEmail;
  final String initialPhone;

  EditProfileScreen({
    required this.initialName,
    required this.initialEmail,
    required this.initialPhone,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String email;
  late String phone;

  @override
  void initState() {
    super.initState();
    name = widget.initialName;
    email = widget.initialEmail;
    phone = widget.initialPhone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(labelText: "Name"),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Your Name';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: email,
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Your Email';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: phone,
                decoration: InputDecoration(labelText: "PhoneNumber"),
                onChanged: (value) {
                  setState(() {
                    phone = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Your Phone NUmber';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, {
                      'name': name,
                      'email': email,
                      'phone': phone,
                    });
                  }
                },
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
