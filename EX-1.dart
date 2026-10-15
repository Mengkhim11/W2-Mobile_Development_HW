enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  const Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience,);

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => List.unmodifiable(_skills);
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double calculateSalary() {
    double salary = _baseSalary;

    salary += _yearsOfExperience * 2000;

    for (Skill skill in _skills) {
      if (skill == Skill.FLUTTER) {
        salary += 5000;
      } else if (skill == Skill.DART) {
        salary += 3000;
      } else if (skill == Skill.OTHER) {
        salary += 1000;
      }
    }

    return salary;
  }

  void printDetails() {
    print('Employee: $_name');
    print('Base Salary: \$$_baseSalary');
    print('Skills: $_skills');
    print('Address: ${_address.street}, ${_address.city}, ${_address.zipCode}');
    print('Years of Experience: $_yearsOfExperience');
    print('Total Salary: \$${calculateSalary()}');
    print('-------------------------');
  }
}

class MobileDeveloper extends Employee {
  MobileDeveloper(
    String name,
    double baseSalary,
    Address address,
    int yearsOfExperience,
  ) : super(
          name,
          baseSalary,
          [Skill.FLUTTER, Skill.DART],
          address,
          yearsOfExperience,
        );
}

void main() {
  var address1 = Address('Street 1', 'Phnom Penh', '12000');

  var emp1 = Employee(
    'Sokea',
    40000,
    [Skill.FLUTTER, Skill.DART],
    address1,
    3,
  );

  emp1.printDetails();

  var emp2 = Employee(
    'Ronan',
    45000,
    [Skill.OTHER],
    const Address('Street 2', 'Siem Reap', '17000'),
    5,
  );

  emp2.printDetails();
}