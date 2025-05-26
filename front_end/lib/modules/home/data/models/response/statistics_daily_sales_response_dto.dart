import 'package:front_end/modules/home/domain/entities/statistics_daily_sales_entity.dart';

import 'daily_sales_response_dto.dart';

class StatisticsDailySalesResponseDto extends StatisticsDailySalesEntity {
  StatisticsDailySalesResponseDto({required super.dailySales});

  factory StatisticsDailySalesResponseDto.fromJson(Map<String, dynamic> json) {
    return StatisticsDailySalesResponseDto(
      dailySales:
          (json['dailySales'] as List<dynamic>)
              .map(
                (e) =>
                    DailySalesResponseDto.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }
}
