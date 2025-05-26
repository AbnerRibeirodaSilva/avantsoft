import 'package:front_end/modules/home/domain/entities/statistics_highlights_entity.dart';

import 'client_highlights_response_dto.dart';

class StatisticsHighlightsResponseDto extends StatisticsHighlightsEntity {
  StatisticsHighlightsResponseDto({
    required super.mostTotal,
    required super.mostAverage,
    required super.mostFrequent,
  });

  factory StatisticsHighlightsResponseDto.fromJson(Map<String, dynamic> json) {
    return StatisticsHighlightsResponseDto(
      mostTotal: ClientHighlightsResponseDto.fromJson(
        json['mostTotal'] as Map<String, dynamic>,
        'total',
      ),
      mostAverage: ClientHighlightsResponseDto.fromJson(
        json['mostAverage'] as Map<String, dynamic>,
        'average',
      ),
      mostFrequent: ClientHighlightsResponseDto.fromJson(
        json['mostFrequent'] as Map<String, dynamic>,
        'frequency',
      ),
    );
  }
}
