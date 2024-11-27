
import 'package:flutter/material.dart';
import '../widget/upcoming_schedule.dart';
import 'appointment_form_screen.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _buttonIndex = 0;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Schedule",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFF4F6FA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButton("Upcoming", 0),
                    _buildButton("Completed", 1),
                    _buildButton("Canceled", 2),
                  ],
                ),
              ),
              SizedBox(height: 30),
              if (_buttonIndex == 0)
                UpcomingSchedule(
                  doctors: doctors,
                  onCancel: _cancelAppointment,
                  onComplete: _completeAppointment,
                )
              else if (_buttonIndex == 1)
                ...completedDoctors.map((doctor) {
                  return ListTile(
                    title: Text(doctor["name"]!),
                    subtitle: Text("Completed"),
                    trailing: Text("Date: ${doctor["date"]!}"),
                  );
                }).toList()
              else
                ...canceledDoctors.map((doctor) {
                  return ListTile(
                    title: Text(doctor["name"]!),
                    subtitle: Text("Canceled"),
                    trailing: Text("Date: ${doctor["date"]!}"),
                  );
                }).toList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.of(context).push(
            //MaterialPageRoute(
              //builder: (context) => AppointmentForm(
               // onSubmit: _addAppointment,
             // ),
           // ),
         // );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildButton(String title, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _buttonIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
        decoration: BoxDecoration(
          color: _buttonIndex == index ? Color(0xFF7165D6) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: _buttonIndex == index ? Colors.white : Colors.black38,
          ),
        ),
      ),
    );
  }
}
