import 'dart:convert';

class User {
  final String? firstName, lastName, phoneNumber, password;

  User(
      {required this.firstName,
      required this.lastName,
      required this.password,
      required this.phoneNumber});

  User copyWith({
    String? firstName,
    String? lastName,
    String? password,
    String? phoneNumber,
  }) {
    return User(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        phoneNumber: phoneNumber ?? this.phoneNumber);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'] as String?,
      lastName: map['lastName'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      password: map['password'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) {
    return User.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() =>
      'User(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, password: $password)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.phoneNumber == phoneNumber &&
        other.password == password;
  }

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      phoneNumber.hashCode ^
      password.hashCode;
}
