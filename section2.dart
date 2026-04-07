import 'dart:math';

void main() {

  Random random = Random();

  int degree = random.nextInt(101);

  print('generated degree: $degree');

  String grade;

  if (degree >= 95 && degree <= 100) {
    grade = '+A';
  }
  else if (degree >= 90 && degree <= 94) {
    grade = '-A';
  }
  else if (degree >= 85 && degree <= 89) {
    grade = '+B';
  }
  else if (degree >= 80 && degree <= 84) {
    grade = '-B';
  }
  else if (degree >= 75 && degree <= 79) {
    grade = '+C';
  }
  else if (degree >= 70 && degree <= 74) {
    grade = '-C';
  }
  else if (degree >= 65 && degree <= 69) {
    grade = '+D';
  }
  else if (degree >= 60 && degree <= 64) {
    grade = '-D';
  }
  else {
    grade = 'F';
  }

  print('grade: $grade');

}