import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailsScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailsScreen({super.key, required this.exam});

  String timeUntilExam(){
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours % 24;
    
    if(difference.isNegative){
      return "Испитот е завршен";
    }
    return "$days дена, $hours часа.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Предмет: ${exam.subjectName}"),
          const SizedBox(height: 10),
          Text("Ден: ${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}"),
          const SizedBox(height: 10),
          Text("Време: ${exam.dateTime.hour}:${exam.dateTime.minute}"),
          const SizedBox(height: 10),
          Text("Простории: ${exam.rooms.join(', ')}"),
          const SizedBox(height: 10),
          Row(
            children: [
              Text("Преостанато време: ${timeUntilExam()}",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
              ),
            ],
          )
        ],
      ),
    );
  }
}