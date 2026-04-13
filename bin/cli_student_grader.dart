
import 'dart:io';
void main(){
  const appName  = 'Student Grader v1.0';
  print (appName);
  final Set<String> subject = { "Bangla", "English", "Math", "Physics" };
  
  List<Map<String, dynamic>> students = [];

//The Menu Loop

  var choice;

 do{
  print('''
    ===== $appName =====
    1. Add Student
    2. Record Score
    3. Add Bonus Points
    4. Add Comment
    5. View All Students
    6. View Report Card
    7. Class Summary
    8. Exit

    Choose an option:
    ''');
    choice = stdin.readLineSync();
    
    switch(choice){
      case '1':
        case '1':
        stdout.write("Enter student name: ");
        String? name = stdin.readLineSync();
        if (name != null && name.isNotEmpty) {
          Map<String, dynamic> newStudent = {
            "name": name,
            "scores": <int>[],
            "subjects": {...subject},
            "bonus": null,
            "comment": null
          };
          students.add(newStudent);
          print("Student '$name' added successfully!");
        }
        break;
      case '2':
      if(students.isEmpty) {
        print("No students found! Add a student first.");
          break;
      }
      print("\n--- Select a Student ---");
      for (int i = 0; i < students.length; i++) {
          print("${i + 1}. ${students[i]["name"]}");
        }

      stdout.write("Enter student number: ");
        String? input = stdin.readLineSync();
        int? studentId = int.tryParse(input ?? "");

      if (studentId != null && studentId > 0 && studentId <= students.length) {
          var allStudent = students[studentId - 1];

      stdout.write("Enter score for ${allStudent['name']}: ");
          int? score = int.tryParse(stdin.readLineSync() ?? "");
          
          if (score != null && score >= 0 && score <= 100) {
            allStudent["scores"].add(score);
            print("Score added!");
          } else {
            print("Invalid score.");
          }
        } else {
          print("Invalid selection.");
        }
        break;

      case '3':
        print("Add Bonus Points");
        break;
      case '4':
        print("Add Comment");
        break;
      case '5':
        print("View All Students");
        break;
      case '6':
        print("View Report Card");
        break;
      case '7':
        print("Class Summary");
        break;
      case '8':
        print("Exiting");
        break;
      }
} while (choice != '8');

}