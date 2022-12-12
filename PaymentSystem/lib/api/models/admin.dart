class Admin {
  final String username;
  final String password;
  final int id;

  const Admin(
      {required this.id, required this.username, required this.password});

  factory Admin.fromJson(var json) {
    json = json[0];
    return Admin(
        id: json['id'], username: json['username'], password: json['password']);
  }
}
