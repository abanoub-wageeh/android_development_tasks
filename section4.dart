import 'dart:core';

Set<String> students = {};

void addStudent(String name) {
  students.add(name);
}

void printStudents(List<String> list, [int index = 0]) {
  if (index >= list.length) return;

  print('${list[index]}');

  printStudents(list, index + 1);
}

Map<String, Map<String, double>> courses = {};

void addCourse(String studentName, String courseName, [double grade = 0]) {
  if (!courses.containsKey(studentName)) {
    courses[studentName] = {};
  }
  courses[studentName]![courseName] = grade;
}

double averageGrade(String studentName) {
  if (!courses.containsKey(studentName) || courses[studentName]!.isEmpty) {
    return 0.0;
  }

  List<double> grades = courses[studentName]!.values.toList();

  double total = grades.fold(0.0, (sum, grade) => sum + grade);

  return total / grades.length;
}

void main() {
  print('==========manage student names==========\n');

  addStudent('ali');
  addStudent('sara');
  addStudent('omar');
  addStudent('nour');
  addStudent('ali');

  print('students');

  print('\nprinting with forEach + lambda:');
  students.forEach((name) => print('$name'));

  print('\nprinting recursively:');
  printStudents(students.toList());

  Set<String> newStudents = {'layla', 'yusuf', 'sara'};
  Set<String> allStudents = {...students, ...newStudents};

  print('\nafter merging with new students using spread operator:');
  allStudents.forEach((name) => print('$name'));

  print('\n==========manage student courses==========\n');

  addCourse('ali', 'math', 88.0);
  addCourse('ali', 'science', 92.0);
  addCourse('ali', 'english', 75.0);

  addCourse('sara', 'math', 95.0);
  addCourse('sara', 'history', 80.0);

  addCourse('omar', 'art', 70.0);
  addCourse('omar', 'music');

  print('course grades');
  courses.forEach((student, subjectMap) {
    print('\nstudent: $student');
    subjectMap.forEach((course, grade) => print('  $course: $grade'));

    double avg = averageGrade(student);
    print('average grade: ${avg.toStringAsFixed(2)}');
  });
}