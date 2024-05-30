class User{
  int? id;
  String yourName;
  String bankAccount;
  String email;
  String password;

  User({
    required this.email,
    required this.password,
    required this.bankAccount,
    required this.yourName,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'yourName': yourName,
      'email': email,
      'password': password,
      'bankAccount': bankAccount,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      yourName: map['yourName'],
      email: map['email'],
      password: map['password'],
      bankAccount: map['bankAccount'],
    );
  }

}
