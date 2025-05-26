import '../../../domain/entities/sign_in_entity.dart';

class SignInResponseDto extends SignInEntity {
  SignInResponseDto({required super.token});

  SignInResponseDto.fromJson(Map<String, dynamic> json)
    : super(token: json['token'] as String);
}
