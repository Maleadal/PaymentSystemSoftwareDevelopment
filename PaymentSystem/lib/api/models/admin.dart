class Admin {
  final String username;
  final String password;

  const Admin({required this.username, required this.password});

  factory Admin.fromJson(var json) {
    json = json[0];
    return Admin(username: json['username'], password: json['password']);
  }
}
