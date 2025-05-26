class SignInRequestDto {
  final String email;
  final String password;

  SignInRequestDto({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  factory SignInRequestDto.fromJson(Map<String, dynamic> json) {
    return SignInRequestDto(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}
