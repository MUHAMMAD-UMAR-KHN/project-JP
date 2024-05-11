import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];
  while (true) {
    print("Please choose an option:");
    print("1 to add student");
    print("2 to view all students");
    print("3 to search student by name");
    print("4 to delete a student");
    print("5 to update student information");
    print("6 to exit");

    var option = int.tryParse(stdin.readLineSync() ?? '');
    if (option == 1) {
      addStudent(students);
    } else if (option == 2) {
      viewAllStudents(students);
    } else if (option == 3) {
      searchStudent(students);
    } else if (option == 4) {
      deleteStudent(students);
    } else if (option == 5) {
      updateStudent(students);
    } else if (option == 6) {
      print("Exiting the student management system.");
      break;
    } else {
      print("Invalid option. Please enter a number from 1 to 6.");
    }
  }
}

//this function is for add student.
void addStudent(List<Map<String, dynamic>> students) {
  print("Enter student name:");
  var name = stdin.readLineSync();

  print("Enter student age:");
  var ageInput = stdin.readLineSync();
  var age = int.tryParse(ageInput ?? '');

  print("Enter student grade:");
  var grade = stdin.readLineSync();

  if (name != null && age != null && grade != null) {
    var student = {
      "name": name,
      "age": age,
      "grade": grade
    };
    students.add(student);
    print("Student has been added successfully.");
  } else {
    print("Invalid input. Please try again.");
  }
}

//this functoin is for view all students.
void viewAllStudents(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print("No students added yet.");
  } else {
    print("List of all students:");
    for (var student in students) {
      print("Name: ${student["name"]}");
      print("Age: ${student["age"]}");
      print("Grade: ${student["grade"]}");
      print("");
    }
  }
}

//this fucntion is for searching student.
void searchStudent(List<Map<String, dynamic>> students) {
  print("Enter the student name to search:");
  var searchName = stdin.readLineSync();

  var foundStudents = students.where((student) => student["name"] == searchName).toList();
  if (foundStudents.isEmpty) {
    print("Student not found.");
  } else {
    print("Student found:");
    for (var student in foundStudents) {
      print("Name: ${student["name"]}");
      print("Age: ${student["age"]}");
      print("Grade: ${student["grade"]}");
    }
  }
}

//this fucntion is for deleting student.
void deleteStudent(List<Map<String, dynamic>> students) {
  print("Enter student name to delete:");
  var deleteName = stdin.readLineSync();

  var deletedStudents = students.where((student) => student["name"] == deleteName).toList();
  if (deletedStudents.isEmpty) {
    print("Student not found.");
  } else {
    students.removeWhere((student) => student["name"] == deleteName);
    print("Student has been deleted successfully.");
  }
}

//this function is for update student.
void updateStudent(List<Map<String, dynamic>> students) {
  print("Enter student name to be updated:");
  var updateName = stdin.readLineSync();

  var updatedStudents = students.where((student) => student["name"] == updateName).toList();
  if (updatedStudents.isEmpty) {
    print("Student not found.");
  } else {
    print("Enter new student's name:");
    var newName = stdin.readLineSync();

    print("Enter new student's age:");
    var newAgeInput = stdin.readLineSync();
    var newAge = int.tryParse(newAgeInput ?? '');

    print("Enter new student's grade:");
    var newGrade = stdin.readLineSync();

    if (newName != null && newAge != null && newGrade != null) {
      students[students.indexOf(updatedStudents.first)] = {
        "name": newName,
        "age": newAge,
        "grade": newGrade
      };
      print("Student's information has been updated successfully.");
    } else {
      print("Invalid input. Please try again.");
    }
  }
}