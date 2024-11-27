import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'doctors_list_screen.dart';
import 'appointment_form_screen.dart';


class AppointmentScreen extends StatelessWidget {

  final String doctorName;
  final String doctorSpecialty;
  final double doctorRating;
  final String doctorImage;

  AppointmentScreen({
    required this.doctorName,
    required this.doctorSpecialty,
    required this.doctorRating,
    required this.doctorImage,
  });

  List<String> doctorNames = [
    "Dr. Wiliam",
    "Dr. John",
    "Dr. Jon",
    "Dr. Ben",
  ];
  List<String> doctorday = [
    "1 day ago",
    "3 day ago",
    "1 hour ago",
    "5 day ago",
  ];
  List<double> doctorRatings = [
    4.8,
    3.5,
    4.9,
    4.7,
  ];
  List imgs = [
    "doctor8.jpg",
    "doctor7.jpg",
    "doctor9.jpg",
    "doctor10.jpg",
  ];
  //Delte
  List<Map<String, String>> doctors = [
    {
      "name": "Dr. Wiliam",
      "image": "images/doctor11.jpg",
      "specialty": "Therapist",
      "date": "12/01/2025",
      "time": "10:30 AM",
      "status": "Confirmed",
    },
    {
      "name": "Dr. Jon",
      "image": "images/doctor10.jpg",
      "specialty": "Cardiologist",
      "date": "12/02/2025",
      "time": "11:00 AM",
      "status": "Confirmed",
    },
  ];

  List<Map<String, String>> canceledDoctors = [];
  List<Map<String, String>> completedDoctors = [];

  void _cancelAppointment(String doctorName) {
    setState(() {
      for (var doctor in doctors) {
        if (doctor["name"] == doctorName) {
          doctor["status"] = "Canceled";
          canceledDoctors.add(doctor);
          doctors.remove(doctor);
          break;
        }
      }
    });
  }

  void _completeAppointment(String doctorName) {
    setState(() {
      for (var doctor in doctors) {
        if (doctor["name"] == doctorName) {
          doctor["status"] = "Completed";
          completedDoctors.add(doctor);
          doctors.remove(doctor);
          break;
        }
      }
    });
  }

  void _addAppointment(Map<String, String> appointment) {
    setState(() {
      completedDoctors.add(appointment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7165D6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(radius: 35,
                      backgroundImage: AssetImage("images/doctor8.jpg"),
                      ),
                      SizedBox(height: 15),
                      Text(
                        doctorName,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        doctorSpecialty,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF9F97E2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.call,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF9F97E2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              CupertinoIcons.chat_bubble_text_fill,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),

                ),
              ],
            ),
            ),
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 20,
                left: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                      "About Doctor",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  SizedBox(height: 5),
                  Text(
                      "Doctors Experience Specialized in the neurology",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Review",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                      SizedBox(height: 10),
                      Icon(Icons.star, color: Colors.amber),
                      Text("4.9",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      ),
                      SizedBox(height: 5),
                      Text("(124)",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF7165D6)
                        ),
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorsListScreen(),
                              ),
                            );
                          },
                          child: Text("See all",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xFF7165D6)
                          ),
                          ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/1.4,
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage("images/${imgs[index]}"),
                                ),
                                title: Text(doctorNames[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                                ),
                                subtitle: Text(doctorday[index]),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star,
                                    color: Colors.amber,
                                    ),
                                    Text(doctorRatings[index].toString(),
                                    style: TextStyle(
                                    color: Colors.black54,
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  "Many thank abou Dr.Dear He is a great an professional doctor",
                                style: TextStyle(
                                  color: Colors.black,
                                ),

                              ),
                              ),
                            ],
                          ),
                        ),
                      );
                      },
                   ),
                  ),
                  SizedBox(height: 10),
                  Text(
                      "Location",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFFF0EEFA), shape: BoxShape.circle),
                      child: Icon(
                        Icons.location_on,
                        color: Color(0xFF7165D6),
                        size: 30,
                      ),
                    ),
                    title: Text(
                        " New York, Madical Center",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("addres line of the medical center"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Consultation Price",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "\$100",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AppointmentForm(
                      onSubmit: _addAppointment,
                    ),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Color(0xFF7165D6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    ""
                        "Booking Appointment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),


    );
  }

  void setState(Null Function() param0) {}
}
