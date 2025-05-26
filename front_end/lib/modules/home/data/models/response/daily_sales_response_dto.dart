import 'package:front_end/modules/home/domain/entities/daily_sales_entity.dart';

class DailySalesResponseDto extends DailySalesEntity {
  DailySalesResponseDto({required super.date, required super.totalSales});

  factory DailySalesResponseDto.fromJson(Map<String, dynamic> json) {
    return DailySalesResponseDto(
      date: json['date'] as String,
      totalSales: (json['total'] as num).toDouble(),
    );
  }
}
