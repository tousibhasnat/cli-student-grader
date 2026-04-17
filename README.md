# 🎓 CLI Student Grader

A command-line application built with **Dart** that allows teachers to manage students, record scores, calculate grades, and generate formatted report cards.

---

## 📌 Overview

This project is a **menu-driven CLI (Command Line Interface) application** where users can:

- Add students  
- Record subject scores  
- Assign bonus points  
- Add teacher comments  
- View report cards  
- See class summaries  

The application runs continuously until the user chooses to exit.

---

## ⚙️ Features

### ✅ 1. Add Student
- Create a new student  
- Initialize:
  - Scores list  
  - Subjects set  
  - Bonus (nullable)  
  - Comment (nullable)  

### ✅ 2. Record Scores
- Select a student  
- Add subject scores (0–100)  
- Input validation included  

### ✅ 3. Add Bonus Points
- Assign bonus (1–10)  
- Uses null-aware operator (`??=`)  

### ✅ 4. Add Comment
- Store teacher feedback  
- Safe access using (`?.`) and (`??`)  

### ✅ 5. View All Students
- Displays:
  - Student name  
  - Total scores  
  - Bonus indicator (if exists)  

### ✅ 6. View Report Card
- Shows:
  - Name  
  - Scores  
  - Bonus  
  - Final Average  
  - Grade (A–F)  
  - Comment  

### ✅ 7. Class Summary
- Total students  
- Class average  
- Highest & lowest scores  
- Unique grade distribution  

---

## 🧠 Concepts Used

This project demonstrates:

- Variables: `var`, `final`, `const`  
- Null Safety: `?`, `??`, `??=`, `?.`  
- Control Flow:
  - `if / else if / else`  
  - `switch`  
- Loops:
  - `for`  
  - `for-in`  
  - `while`  
  - `do-while`  
- Data Structures:
  - `List`  
  - `Set`  
  - `Map`  
- Collection features:
  - Collection `if`  
  - Collection `for`  
  - Spread operator (`...`)  
- String Interpolation & Multi-line Strings  

---

## 🗂️ Project Structure

```
cli_student_grader/
│
├── bin/
│   └── cli_student_grader.dart
│
├── pubspec.yaml
└── README.md
```

---

## 🚀 How to Run

### 1. Clone Repository
```bash
git clone https://github.com/tousibhasnat/cli-student-grader.git
cd cli-student-grader
```

### 2. Run the App
```bash
dart run
```

---

## 📊 Grading System

| Average | Grade |
|--------|------|
| 90+    | A    |
| 80–89  | B    |
| 70–79  | C    |
| 60–69  | D    |
| <60    | F    |

---

## 📝 Example Menu

```
===== Student Grader v1.0 =====

1. Add Student
2. Record Score
3. Add Bonus
4. Add Comment
5. View Students
6. Report Card
7. Summary
8. Exit
```

---

## 💡 Key Highlights

- Clean CLI interface  
- Proper input validation  
- Uses core Dart concepts  
- Modular and readable logic  

---

## 📦 Git Commit Strategy

Example commits:

- feat: add menu loop and switch routing  
- feat: add student creation with spread operator 
- feat: record scores with validation loop 
- feat: add bonus and comment with null-aware operators
- feat: generate report card with grade calculation 
- feat: add class summary with collection for/if

---

## 📜 License

This project is for educational purposes.

---

## 🙌 Author

**@tousibhasnat**
