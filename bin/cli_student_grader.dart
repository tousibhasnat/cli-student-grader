
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
        if (students.isEmpty) {
        print("No students found! Add a student first.");
        break;
        }

        print("\n--- All Students ---");
        for (var student in students) {
        var parts = [
            student["name"],
            "${student["scores"].length} scores",
            if (student["bonus"] != null) "⭐ Has Bonus"
        ];
        print(parts.join(' — '));
        }
        break;



      case '6':
      
    if (students.isEmpty) {
        print("No students found! Add a student first.");
        break;
    }

    print("\n--- Select a Student for Report Card ---");
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
    String name = student["name"];
    List<int> scores = student["scores"];
    int? bonus = student["bonus"];
    String? comment = student["comment"];

    
    double rawAvg = 0.0;
    if (scores.isNotEmpty) {
        int sum = 0;
        for (var score in scores) {
            sum += score;
        }
        rawAvg = sum / scores.length;
    }

    int bonusPoints = bonus ?? 0;
    double finalAvg = rawAvg + bonusPoints;
    if (finalAvg > 100) finalAvg = 100;

    String grade;
    if (finalAvg >= 90) {
        grade = "A";
    } else if (finalAvg >= 80) {
        grade = "B";
    } else if (finalAvg >= 70) {
        grade = "C";
    } else if (finalAvg >= 60) {
        grade = "D";
    } else {
        grade = "F";
    }

    String commentDisplay = comment?.toUpperCase() ?? "No comment provided";

  
    print('''
╔══════════════════════════════╗
║          REPORT CARD         ║
╠══════════════════════════════╣
║  Name:    $name              ║
║  Scores:  $scores            ║
║  Bonus:   ${bonus != null ? "+$bonus" : "None"}║
║  Average: ${finalAvg.toStringAsFixed(1)}║
║  Grade:   $grade             ║
║  Comment: $commentDisplay    ║
╚══════════════════════════════╝
''');

    
    String feedback = switch (grade) {
        "A" => "Outstanding performance!",
        "B" => "Good work, keep it up!",
        "C" => "Satisfactory. Room to improve.",
        "D" => "Needs improvement.",
        "F" => "Failing. Please seek help.",
        _   => "Unknown grade."
    };
    print(feedback);
    break;



      case '7':
       
    if (students.isEmpty) {
        print("No students found! Add students first.");
        break;
    }

    int totalStudents = students.length;
    double sumOfAverages = 0.0;
    int studentsWithScores = 0;
    double highestAvg = double.negativeInfinity;
    double lowestAvg = double.infinity;
    Set<String> uniqueGrades = {};

    
    List<double> computedAverages = [];
    List<String> computedGrades = [];

    for (var student in students) {
        List<int> scores = student["scores"];
        if (scores.isEmpty) {
            computedAverages.add(0.0); 
            computedGrades.add("N/A");
            continue;
        }

        int sum = 0;
        for (var score in scores) {
            sum += score;
        }
        double rawAvg = sum / scores.length;

        int bonus = student["bonus"] ?? 0;
        double finalAvg = rawAvg + bonus;
        if (finalAvg > 100) finalAvg = 100;

        String grade;
        if (finalAvg >= 90) grade = "A";
        else if (finalAvg >= 80) grade = "B";
        else if (finalAvg >= 70) grade = "C";
        else if (finalAvg >= 60) grade = "D";
        else grade = "F";

        
        computedAverages.add(finalAvg);
        computedGrades.add(grade);

        uniqueGrades.add(grade);
        sumOfAverages += finalAvg;
        studentsWithScores++;

        if (finalAvg > highestAvg) highestAvg = finalAvg;
        if (finalAvg < lowestAvg) lowestAvg = finalAvg;
    }

    if (studentsWithScores == 0) {
        print("\n--- Class Summary ---");
        print("Total Students: $totalStudents");
        print("No scores recorded yet.");
        break;
    }

    double classAverage = sumOfAverages / studentsWithScores;

    
    int passingStudents = 0;
    for (int i = 0; i < students.length; i++) {
        if (students[i]["scores"].isNotEmpty && computedAverages[i] >= 60) {
            passingStudents++;
        }
    }

    
    var summaryLines = [
        "===== CLASS SUMMARY =====",
        "Total Students: $totalStudents",
        "Students with Scores: $studentsWithScores",
        "Class Average: ${classAverage.toStringAsFixed(1)}",
        "Highest Average: ${highestAvg.toStringAsFixed(1)}",
        "Lowest Average: ${lowestAvg.toStringAsFixed(1)}",
        "Passing Students (avg >= 60): $passingStudents",
        "Unique Grades: ${uniqueGrades.join(', ')}",
        for (int i = 0; i < students.length; i++)
            if (students[i]["scores"].isNotEmpty)
                "${students[i]["name"]}: ${computedAverages[i].toStringAsFixed(1)} (${computedGrades[i]})"
            else
                "${students[i]["name"]}: No scores yet"
    ];

    for (var line in summaryLines) {
        print(line);
    }
    break;
      case '8':
        print("Exiting");
        break;
      }
} while (choice != '8');

}