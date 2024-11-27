
import 'package:flutter/material.dart';

class AppointmentForm extends StatefulWidget {
  final Function(Map<String, String>) onSubmit;

  const AppointmentForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  int age = 0;
  String disease = '';
  String date = '';
  String time = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Appointment"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Your Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (value) {
                  name = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Your Age'),
                validator: (value) {
                  if (value == null || int.tryParse(value) == null) {
                    return 'Please enter a valid age';
                  }
                  return null;
                },
                onChanged: (value) {
                  age = int.parse(value);
                },
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Disease'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your disease';
                  }
                  return null;
                },
                onChanged: (value) {
                  disease = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Appointment Date'),
                onChanged: (value) {
                  date = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Appointment Time'),
                onChanged: (value) {
                  time = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onSubmit({
                      'name': name,
                      'age': age.toString(),
                      'disease': disease,
                      'date': date,
                      'time': time,
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text('Confirm Appointment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
