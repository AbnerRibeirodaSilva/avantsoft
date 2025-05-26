class RegisterClientRequestDto {
  final String name;
  final String email;
  final String birthdate;

  RegisterClientRequestDto({
    required this.name,
    required this.email,
    required this.birthdate,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'birthdate': birthdate};
  }
}
