import 'package:front_end/modules/home/domain/entities/client_list_entity.dart';

import 'client_response_dto.dart';

class ClientListResponseDto extends ClientListEntity {
  ClientListResponseDto({required super.clients});

  factory ClientListResponseDto.fromJson(Map<String, dynamic> json) {
    final clients =
        (json['clients'] as List)
            .map((client) => ClientResponseDto.fromJson(client))
            .toList();

    return ClientListResponseDto(clients: clients);
  }
}
