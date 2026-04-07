import 'dart:io';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];

  int numStudents = 0;
  while (true) {
    try {
      print('enter the number of students:');
      String? input = stdin.readLineSync();
      numStudents = int.parse(input!.trim());
      if (numStudents <= 0) {
        print('error: number of students must be greater than 0\n');
        continue;
      }
      break;
    } catch (e) {
      print('error: please enter a valid integer\n');
    }
  }

  for (int i = 0; i < numStudents; i++) {
    print('\n--- student ${i + 1} ---');

    String name = '';
    while (name.isEmpty) {
      print('enter student name:');
      String? input = stdin.readLineSync();
      name = input?.trim() ?? '';
      if (name.isEmpty) {
        print('error: name cannot be empty');
      }
    }
    studentNames.add(name);

    int numSubjects = 0;
    while (true) {
      try {
        print('enter number of subjects for $name:');
        String? input = stdin.readLineSync();
        numSubjects = int.parse(input!.trim());
        if (numSubjects <= 0) {
          print('error: number of subjects must be greater than 0');
          continue;
        }
        break;
      } catch (e) {
        print('error: please enter a valid integer');
      }
    }

    List<double> grades = [];
    for (int j = 0; j < numSubjects; j++) {
      while (true) {
        try {
          print('enter grade for subject ${j + 1}:');
          String? input = stdin.readLineSync();
          double grade = double.parse(input!.trim());
          if (grade < 0 || grade > 100) {
            print('error: grade must be between 0 and 100');
            continue;
          }
          grades.add(grade);
          break;
        } catch (e) {
          print('error: please enter a valid number');
        }
      }
    }

    studentGrades.add(grades);
  }

  double calcAverage(List<double> grades) {
    double sum = 0;
    for (double g in grades) {
      sum += g;
    }
    return sum / grades.length;
  }

  String getLetterGrade(double avg) {
    if (avg >= 85) return 'A';
    if (avg >= 70) return 'B';
    if (avg >= 60) return 'C';
    return 'F';
  }

  while (true) {
    print('========== menu ==========');
    print('1. show all results');
    print('2. search student');
    print('3. exit');
    print('choose an option (1-3):');

    String? choice = stdin.readLineSync()?.trim();

    if (choice == '1') {
      print('\n========== all results ==========');
      for (int i = 0; i < studentNames.length; i++) {
        double avg = calcAverage(studentGrades[i]);
        double rounded = double.parse(avg.toStringAsFixed(2));
        String letter = getLetterGrade(avg);

        print('name   : ${studentNames[i].toUpperCase()}');
        print('average: $rounded');
        print('grade  : $letter');
        print('----------------------------------');
      }
    }
    else if (choice == '2') {
      print('enter student name to search:');
      String? searchName = stdin.readLineSync()?.trim();

      if (searchName == null || searchName.isEmpty) {
        print('error: name cannot be empty');
        continue;
      }

      bool found = false;
      for (int i = 0; i < studentNames.length; i++) {
        if (studentNames[i].toLowerCase() == searchName.toLowerCase()) {
          double avg = calcAverage(studentGrades[i]);
          int roundedAvg = avg.round();
          print('\nstudent found: ${studentNames[i]}');
          print('average grade: $roundedAvg');
          found = true;
          break;
        }
      }

      if (!found) {
        print('student "$searchName" not found');
      }
    }
    else if (choice == '3') {
      break;
    }
    else {
      print('error: invalid option. please choose 1, 2, or 3');
    }
  }
}