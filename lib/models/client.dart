class Client {
  final String name;
  final String email;
  final String userCode;
  final String? picture;
  final String password;
  final String occupation;

  Client(
      {required this.name,
      required this.email,
      required this.userCode,
      required this.picture,
      required this.password,
      required this.occupation});
}
