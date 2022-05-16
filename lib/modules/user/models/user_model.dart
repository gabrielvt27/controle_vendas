import 'dart:convert';

class UserModel {
  final String? iduser;
  final String? email;
  final String? token;

  UserModel({
    this.iduser,
    this.email,
    this.token,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'iduser': iduser});
    result.addAll({'email': email});
    result.addAll({'token': token});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      iduser: map['iduser'].toString(),
      email: map['email'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(iduser: $iduser, email: $email, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.email == email &&
        other.iduser == iduser &&
        other.token == token;
  }

  @override
  int get hashCode => email.hashCode ^ iduser.hashCode ^ token.hashCode;
}
