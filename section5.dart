class Person {
  String name;
  int _age;

  static String universityName = 'sohag university';

  Person(this.name, this._age);

  int get age => _age;

  set age(int value) {
    if (value > 0) {
      _age = value;
    } else {
      print('error: age must be a positive number');
    }
  }
}

class Employee extends Person {
  double salary;

  Employee(String name, int age, this.salary) : super(name, age);

  void showInfo() {
    print('university: ${Person.universityName}');
    print('name: $name');
    print('age: $age');
    print('salary: ${salary.toInt()}');
  }
}

abstract class Skills {
  void programming();
  void communication();
}

class Developer extends Employee implements Skills {
  Developer(String name, int age, double salary) : super(name, age, salary);

  @override
  void showInfo() {
    super.showInfo();
  }

  @override
  void programming() {
    print('programming skill');
  }

  @override
  void communication() {
    print('communication skill');
  }
}

void main() {
  Developer dev = Developer('ahmed', 25, 8000);

  dev.showInfo();

  dev.programming();
  dev.communication();

  print('\n--- testing getter & setter ---');
  print('current age: ${dev.age}');
  dev.age = 26;
  print('updated age: ${dev.age}');

  dev.age = -5;

  print('\nuniversity name: ${Person.universityName}');
}