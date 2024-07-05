class Users {
  final String name;
  // final String phone;
  final String id;

  Users({required this.name, required this.id});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      name: json['name'],
      // phone: json['telephone'],
      id: json['id'],
    );
  }
}
