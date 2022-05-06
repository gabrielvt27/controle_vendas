import 'dart:convert';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../../helpers/helpers.dart';

class UserModel {
  final String? id;
  final String? email;
  final String? senha;
  final DateTime? createdAt;

  UserModel({
    this.id,
    this.email,
    this.senha,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'email': email});
    result.addAll({'senha': senha});
    result.addAll({'createdAt': createdAt});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      senha: map['senha'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  factory UserModel.mapParseToUser(ParseUser parseUser) => UserModel(
        id: parseUser.objectId ?? '',
        email: parseUser.get(keyUserEmail) ?? '',
        createdAt: parseUser.get(keyUserCreatedAt),
      );

  @override
  String toString() => 'UserModel(email: $email, senha: $senha)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && other.email == email && other.senha == senha;
  }

  @override
  int get hashCode => email.hashCode ^ senha.hashCode;
}
