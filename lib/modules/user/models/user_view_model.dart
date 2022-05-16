import 'dart:convert';

class UserViewModel {
  final String? email;
  final String? password;

  UserViewModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'senha': password});

    return result;
  }

  factory UserViewModel.fromMap(Map<String, dynamic> map) {
    return UserViewModel(
      email: map['email'] ?? '',
      password: map['senha'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserViewModel.fromJson(String source) =>
      UserViewModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(email: $email, senha: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserViewModel &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
