import 'package:flutter/material.dart';
import 'package:untitled5/screens/chat_screen.dart';
class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<String> imgs = [
    "doctor8.jpg",
    "doctor7.jpg",
    "doctor5.png",
    "doctor9.jpg",
    "doctor10.jpg",
    "doctor12.jpg",
    "doctor13.jpg",
    "doctor11.jpg",
  ];

  List<String> doctorNames = [
    "Dr. Wiliam",
    "Dr. John",
    "Dr. Omar",
    "Dr. Frank",
    "Dr. Jon",
    "Dr. Ben",
    "Dr. Amer",
    "Dr. David",
  ];

  List<String> times = [
    "12:30",
    "11:30",
    "9:00",
    "3:20",
    "2:10",
    "11:00",
    "01:30",
    "03:00",
  ];

  List<String> doctorSpecialties = [
    "Cardiologist",
    "Pediatrician",
    "Dermatologist",
    "Psychiatrist",
    "Pediatrician",
    "Cardiologist",
    "Dermatologist",
    "Dermatologist",
  ];

  List<String> filteredDoctorNames = [];
  List<String> filteredDoctorSpecialties = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredDoctorNames = doctorNames;
  }

  void _filterDoctors(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredDoctorNames = doctorNames;
      });
    } else {
      setState(() {
        filteredDoctorNames = [];
        for (int i = 0; i < doctorNames.length; i++) {
          if (doctorNames[i].toLowerCase().contains(query.toLowerCase()) ||
              doctorSpecialties[i].toLowerCase().contains(query.toLowerCase())) {
            filteredDoctorNames.add(doctorNames[i]);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Messages",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: _filterDoctors,
                      decoration: InputDecoration(
                        hintText: "Search by name or specialty",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Color(0xFF7165D6),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Active Now",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Stack(
                    textDirection: TextDirection.rtl,
                    children: [
                      Center(
                        child: Container(
                          height: 65,
                          width: 65,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              "images/${imgs[index]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.all(3),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Recent Chat",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: filteredDoctorNames.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final doctorIndex = doctorNames.indexOf(filteredDoctorNames[index]);
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      "images/${imgs[doctorIndex]}",
                    ),
                  ),
                  title: Text(
                    filteredDoctorNames[index],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Hello Doctor are you there?",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  trailing: Text(
                    times[doctorIndex],
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
