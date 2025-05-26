import 'package:front_end/modules/home/domain/entities/client_entity.dart';

class ClientResponseDto extends ClientEntity {
  ClientResponseDto({
    required super.id,
    required super.name,
    required super.email,
    required super.birthdate,
  });

  factory ClientResponseDto.fromJson(Map<String, dynamic> json) {
    return ClientResponseDto(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      birthdate: json['birthdate'] as String,
    );
  }
}
