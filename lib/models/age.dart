class Age {
  final int age;

  Age({required this.age});

  factory Age.fromJson(Map<String, dynamic> json) {
    return Age(
      age: json['age'],
    );
  }
}
