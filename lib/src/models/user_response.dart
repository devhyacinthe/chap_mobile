import 'dart:convert';

class UserResponse {
  final String? id, firstName, lastName, phoneNumber, email, sex;
  final int? rating;
  final String? createdAt, updatedAt, birthday;

  factory UserResponse.empty() {
    return UserResponse(
        firstName: "",
        lastName: "empty",
        phoneNumber: "",
        email: "",
        sex: "Masculin",
        rating: 0,
        createdAt: "19700101",
        updatedAt: "",
        birthday: "19700101");
  }

  UserResponse({
    this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    this.sex,
    this.rating,
    required this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.birthday,
  });

  UserResponse copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? sex,
    int? rating,
    String? createdAt,
    String? updatedAt,
    String? birthday,
  }) {
    return UserResponse(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
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
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'sex': sex,
      'rating': rating,
      'phone_number': phoneNumber,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'birthday': birthday,
    };
  }

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
      id: map['id'] as String?,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      email: map['email'] as String?,
      sex: map['sex'] as String?,
      rating: map['rating'] as int?,
      phoneNumber: map['phone_number'] as String?,
      createdAt: map['created_at'] as String?,
      updatedAt: map['updated_at'] as String?,
      birthday: map['birthday'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponse.fromJson(String source) {
    return UserResponse.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() =>
      'User(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, email: $email, sex:$sex, rating: $rating, createdAt: $createdAt, updated: $updatedAt, birthday: $birthday)';

  @override
  bool operator ==(covariant UserResponse other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.phoneNumber == phoneNumber &&
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
      birthday.hashCode;
}
