class User {
  User({required this.id, required this.name, required this.email, required this.toClaim, required this.balance});

  final int id;
  final String name;
  final String email;
  final int toClaim;
  double balance;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['firstName'],
      balance: json['balance'],
      toClaim: json['toClaim'],
    );
  }
}