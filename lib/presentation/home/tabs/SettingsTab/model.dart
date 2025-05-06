class UserEntity {
  final String id;
  final String username;
  final String phoneNumber;
  final String fullName;
  final String email;
  final String role;

  UserEntity({
    required this.id,
    required this.username,
    required this.phoneNumber,
    required this.fullName,
    required this.email,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'phoneNumber': phoneNumber,
      'fullName': fullName,
      'email': email,
      'role': role,
    };
  }

  static UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'],
      username: map['username'],
      phoneNumber: map['phoneNumber'],
      fullName: map['fullName'],
      email: map['email'],
      role: map['role'],
    );
  }
}
