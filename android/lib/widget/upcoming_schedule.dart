
import 'package:flutter/material.dart';

class UpcomingSchedule extends StatelessWidget {
  final List<Map<String, String>> doctors;
  final Function(String) onCancel;
  final Function(String) onComplete;

  const UpcomingSchedule({
    Key? key,
    required this.doctors,
    required this.onCancel,
    required this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upcoming Appointments",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15),
          ...doctors.map((doctor) {
            return Container(
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
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        doctor["name"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(doctor["specialty"]!),
                      trailing: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(doctor["image"]!),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(children: [
                          Icon(Icons.calendar_month, color: Colors.black54),
                          SizedBox(width: 5),
                          Text(doctor["date"]!, style: TextStyle(color: Colors.black54)),
                        ]),
                        Row(
                          children: [
                            Icon(Icons.access_time_filled, color: Colors.black54),
                            SizedBox(width: 5),
                            Text(doctor["time"]!, style: TextStyle(color: Colors.black54)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Confirmed",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => onCancel(doctor["name"]!),
                          child: Container(
                            width: 150,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: Color(0xFFF4F6FA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => onComplete(doctor["name"]!),
                          child: Container(
                            width: 150,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: Color(0xFF7165D6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Complete",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }).toList(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
