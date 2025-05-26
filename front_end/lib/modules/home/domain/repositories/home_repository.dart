import 'package:front_end/modules/home/domain/entities/client_list_entity.dart';
import 'package:front_end/modules/home/domain/entities/statistics_daily_sales_entity.dart';
import 'package:front_end/modules/home/domain/entities/statistics_highlights_entity.dart';

abstract class HomeRepository {
  Future<ClientListEntity> getClientsList();
  Future<void> registerClient(String name, String email, String birthdate);
  Future<void> registerSale(String clientId, double value, String date);
  Future<StatisticsHighlightsEntity> getStatisticsHighlights();
  Future<StatisticsDailySalesEntity> getDailySales();
}
