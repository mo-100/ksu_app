class UserProfile {
  final String name;
  final String studentNumber;
  final String phone;
  final String gpa;
  final String major;
  final String college;
  final String level;
  final String hours;


  UserProfile({
    required this.name,
    required this.studentNumber,
    required this.phone,
    required this.gpa,
    required this.college,
    required this.hours,
    required this.major,
    required this.level
  });

  String get email => '$studentNumber@ksu.edu.sa';
  String get firstName => name.split(' ')[0];

  // Mock user data
  static UserProfile mockProfile() {
    return UserProfile(
      name: 'محمد علي الدوسري',
      studentNumber: '443123456',
      phone: '0501234567',
      gpa: '4.58',
      college: 'كلية علوم الحاسب والمعلومات',
      major: 'علوم الحاسب',
      hours: '120',
      level: '7',
    );
  }
}