class Users {
  int idUser;
  String username;
  String email;
  String password;

  Users(
    this.idUser,
    this.username,
    this.email,
    this.password,
  );
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      json['id_user'],
      json['user_name_'],
      json['e_mail'],
      json['pass_word'],
    );
  }
}
