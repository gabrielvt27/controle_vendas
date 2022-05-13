import 'dart:convert';

class UserViewModel {
  final String? email;
  final String? senha;

  UserViewModel({
    this.email,
    this.senha,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'senha': senha});

    return result;
  }

  factory UserViewModel.fromMap(Map<String, dynamic> map) {
    return UserViewModel(
      email: map['email'] ?? '',
      senha: map['senha'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserViewModel.fromJson(String source) =>
      UserViewModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(email: $email, senha: $senha)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserViewModel &&
        other.email == email &&
        other.senha == senha;
  }

  @override
  int get hashCode => email.hashCode ^ senha.hashCode;
}
