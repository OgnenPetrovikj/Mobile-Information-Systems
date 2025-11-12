import 'package:first_lab_mis/screens/exam_details_screen.dart';
import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamListScreen extends StatelessWidget{
  final List<Exam> exams = [
    Exam(subjectName: "Calculus 1", dateTime: DateTime(2025, 1, 10, 9, 30), rooms: ["Lab 3", "215"]),
    Exam(subjectName: "Discrete Mathematics", dateTime: DateTime(2025, 09, 30, 8, 30), rooms: ["215", "117"]),
    Exam(subjectName: "Probability and Statistics", dateTime: DateTime(2025, 10, 11, 11, 00), rooms: ["Lab 12", "Lab 3"]),
    Exam(subjectName: "Databases", dateTime: DateTime(2025, 12, 17, 10, 15), rooms: ["Lab 3"]),
    Exam(subjectName: "Algorithms and Data Structures", dateTime: DateTime(2025, 2, 11, 13, 50), rooms: ["117", "Lab 2"]),
    Exam(subjectName: "ICT Management", dateTime: DateTime(2025, 10, 30, 8, 00), rooms: ["215"]),
    Exam(subjectName: "Structural Programming", dateTime: DateTime(2025, 12, 12, 12, 30), rooms: ["Lab 2", "215", "Lab 200AB"]),
    Exam(subjectName: "Cyber Security", dateTime: DateTime(2025, 9, 9, 17, 30), rooms: ["Lab 200AB", "117"]),
    Exam(subjectName: "Object-Oriented Programming", dateTime: DateTime(2025, 11, 15, 9, 00), rooms: ["Lab 3", "Lab 13"]),
    Exam(subjectName: "Marketing", dateTime: DateTime(2025, 12, 10, 9, 45), rooms: ["215", "Lab 200AB"]),
    Exam(subjectName: "Machine Learning", dateTime: DateTime(2025, 10, 27, 15, 30), rooms: ["Lab 12"])
  ];

  ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред на испити - 221510"),
        centerTitle: true,
      ),
      body: ListView.builder(itemCount: exams.length, itemBuilder: (context, index) {
        final exam = exams[index];
        final isPast = exam.dateTime.isBefore(DateTime.now());

        return Card(
          color: isPast ? Colors.green : Colors.red,
          margin: const EdgeInsets.all(8),
          elevation: 4,
          child: ListTile(
            title: Text(exam.subjectName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 15),
                    Text("Датум: ${exam.dateTime.day}.${exam.dateTime.month}."
                        "${exam.dateTime.year}"),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 15),
                    Text("Време: ${exam.dateTime.hour}:${exam.dateTime.minute}"),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.meeting_room, size: 15),
                    Text("Просторија: ${exam.rooms}"),
                  ],
                )
              ],
            ),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ExamDetailsScreen(exam: exam)
                  ),
              );
            },
          ),
        );
      }
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Center(
          child: Text(
              "Вкупен број на испити: ${exams.length}",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      )
    );
  }
}