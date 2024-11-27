
import 'package:flutter/material.dart';

class DoctorsListScreen extends StatelessWidget {
  final List<String> doctorNames = [
    "Dr. Wiliam",
    "Dr. John",
    "Dr. Jon",
    "Dr. Ben",
    "Dr. Amer",
    "Dr. David",
  ];

  final List<String> doctorSpecialties = [
    "Neurologist",
    "Cardiologist",
    "Dermatologist",
    "Pediatrician",
    "Neurologist",
    "Cardiologist",
    "Pediatrician",
  ];

  final List<double> doctorRatings = [
    4.8,
    3.5,
    4.9,
    4.7,
    4.3,
    4.0,
  ];

  final List<String> doctorImages = [
    "doctor8.jpg",
    "doctor7.jpg",
    "doctor9.jpg",
    "doctor10.jpg",
    "doctor12.jpg",
    "doctor13.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors List"),
      ),
      body: ListView.builder(
        itemCount: doctorNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("images/${doctorImages[index]}"),
            ),
            title: Text(doctorNames[index]),
            subtitle: Text("${doctorSpecialties[index]} - Rating: ${doctorRatings[index]}"),
            onTap: () {
            },
          );
        },
      ),
    );
  }
}
