import 'package:front_end/modules/home/domain/entities/client_highlights_entity.dart';

class ClientHighlightsResponseDto extends ClientHighlightsEntity {
  ClientHighlightsResponseDto({
    required super.name,
    required super.email,
    required super.value,
  });

  factory ClientHighlightsResponseDto.fromJson(
    Map<String, dynamic> json,
    String valueKey,
  ) {
    return ClientHighlightsResponseDto(
      name: json['client']['name'] as String,
      email: json['client']['email'] as String,
      value: (json[valueKey] as num).toDouble(),
    );
  }
}
