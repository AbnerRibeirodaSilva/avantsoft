import 'package:front_end/modules/home/data/models/response/client_list_response_dto.dart';
import 'package:front_end/modules/home/data/models/response/statistics_daily_sales_response_dto.dart';
import 'package:front_end/modules/home/data/models/response/statistics_highlights_response_dto.dart';
import 'package:front_end/modules/home/domain/entities/client_list_entity.dart';
import 'package:front_end/modules/home/domain/entities/statistics_daily_sales_entity.dart';
import 'package:front_end/modules/home/domain/entities/statistics_highlights_entity.dart';

import '../../../../shared/core/dependency_injection/inject.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasource/home_datasource.dart';

class HomeRepositoryImpl extends HomeRepository {
  final _datasource = getIt<HomeDatasource>();

  @override
  Future<void> registerClient(
    String name,
    String email,
    String birthdate,
  ) async {
    try {
      await _datasource.registerClient(name, email, birthdate);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> registerSale(String clientId, double value, String date) async {
    try {
      await _datasource.registerSale(clientId, value, date);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ClientListEntity> getClientsList() async {
    try {
      final response = await _datasource.getClientList();

      final result = ClientListResponseDto.fromJson(response);

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<StatisticsDailySalesEntity> getDailySales() async {
    try {
      final response = await _datasource.getDailySales();
      final result = StatisticsDailySalesResponseDto.fromJson(response);

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<StatisticsHighlightsEntity> getStatisticsHighlights() async {
    try {
      final response = await _datasource.getHighlights();
      final result = StatisticsHighlightsResponseDto.fromJson(response);

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
