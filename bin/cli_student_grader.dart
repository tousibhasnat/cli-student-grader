
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
      int? choice = int.tryParse(input ?? "");
      if (choice == null || choice < 1 || choice > students.length) {
        print("Invalid selection.");
        break;
      }

      var student = students[choice - 1];

      print("Subjects: ${student["subjects"].join(', ')}");

      int? validScore;
    while (validScore == null) {
        stdout.write("Enter score (0-100) for ${student["name"]}: ");
        String? scoreInput = stdin.readLineSync();
        int? parsed = int.tryParse(scoreInput ?? "");
        if (parsed != null && parsed >= 0 && parsed <= 100) {
            validScore = parsed;
        } else {
            print("Invalid score. Please enter a number between 0 and 100.");
        }
      }

      student["scores"].add(validScore);
      print("Score $validScore recorded for ${student["name"]}.");
      break;


    break;

      case '3':
        
      
    

    if (students.isEmpty) {
        print("No students found! Add a student first.");
        break;
    }

    
    print("\n--- Select a Student for Bonus ---");
    for (int i = 0; i < students.length; i++) {
        print("${i + 1}. ${students[i]["name"]}");
    }

    
    stdout.write("Enter student number: ");
    String? input = stdin.readLineSync();
    int? choice = int.tryParse(input ?? "");
    if (choice == null || choice < 1 || choice > students.length) {
        print("Invalid selection.");
        break;
    }

    var student = students[choice - 1];

   
    if (student["bonus"] != null) {
        print("${student["name"]} already has a bonus of ${student["bonus"]}.");
        print("Bonus can only be set once.");
        break;
    }


    stdout.write("Enter bonus points (1-10): ");
    String? bInput = stdin.readLineSync();
    int? bonus = int.tryParse(bInput ?? "");

    if (bonus == null || bonus < 1 || bonus > 10) {
        print("Invalid bonus. Must be between 1 and 10.");
        break;
    }

    
    student["bonus"] ??= bonus;
    print("Bonus of $bonus added to ${student["name"]}!");
    break;

      case '4':
        

        if (students.isEmpty) {
        print("No students found! Add a student first.");
        break;
        }

        print("\n--- Select a Student for Comment ---");
        for (int i = 0; i < students.length; i++) {
        print("${i + 1}. ${students[i]["name"]}");
        }

        stdout.write("Enter student number: ");
        String? input = stdin.readLineSync();
        int? choice = int.tryParse(input ?? "");
        if (choice == null || choice < 1 || choice > students.length) {
        print("Invalid selection.");
        break;
        }

        var student = students[choice - 1];

        if (student["comment"] != null) {
        print("Current comment: ${student["comment"]}");
        }

        stdout.write("Enter comment: ");
        String? commentInput = stdin.readLineSync();
        student["comment"] = commentInput;  

        String displayComment = student["comment"]?.toUpperCase() ?? "(No comment)";
        print("Comment set to: $displayComment");
        print("Comment saved for ${student["name"]}."); 

        

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