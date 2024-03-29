import 'dart:convert';

class User {
  final String? firstName, lastName, phoneNumber, password, email, sex;
  final double? rating;
  final String? createdAt, updatedAt, birthday;

  factory User.empty() {
    return User(
        firstName: "",
        lastName: "",
        password: "",
        phoneNumber: "",
        email: "",
        sex: "",
        rating: 0.0,
        createdAt: null,
        updatedAt: null,
        birthday: null);
  }

  User({
    required this.firstName,
    required this.lastName,
    required this.password,
    this.email,
    this.sex,
    this.rating,
    required this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.birthday,
  });

  User copyWith({
    String? firstName,
    String? lastName,
    String? password,
    String? phoneNumber,
    String? email,
    String? sex,
    double? rating,
    String? createdAt,
    String? updatedAt,
    String? birthday,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      email: email ?? this.email,
      sex: sex ?? this.sex,
      rating: rating ?? this.rating,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      birthday: birthday ?? this.birthday,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'sex': sex,
      'rating': rating,
      'password': password,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'birthday': birthday,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'] as String?,
      lastName: map['lastName'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      email: map['email'] as String?,
      rating: map['rating'] as double?,
      sex: map['sex'] as String?,
      password: map['password'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      birthday: map['birthday'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) {
    return User.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() =>
      'User(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, password: $password, email: $email, sex:$sex, rating: $rating, createdAt: $createdAt, updated: $updatedAt, birthday: $birthday)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.phoneNumber == phoneNumber &&
        other.password == password &&
        other.email == email &&
        other.sex == sex &&
        other.rating == rating &&
        other.birthday == birthday &&
        other.updatedAt == updatedAt &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      phoneNumber.hashCode ^
      email.hashCode ^
      sex.hashCode ^
      rating.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode ^
      birthday.hashCode ^
      password.hashCode;
}
