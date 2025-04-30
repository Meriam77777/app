class User {
  final int id;
  final String name;
  final String email;
  final String? role;  // role is nullable

  User({
    required this.id,
    required this.name,
    required this.email,
    this.role,  // role can be null
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',  //evite les errurs
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
    };
  }
}


