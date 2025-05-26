import 'package:dio/dio.dart';
import 'package:front_end/modules/home/data/datasource/home_datasource.dart';

import '../../../../shared/core/dependency_injection/inject.dart';
import '../../../../shared/core/local_storage/auth_token_storage.dart';
import '../models/request/register_client_request_dto.dart';
import '../models/request/register_sale_request_dto.dart';

class HomeDatasourceImpl extends HomeDatasource {
  final _dio = getIt<Dio>();
  final _authTokenStorage = getIt<AuthTokenStorage>();

  @override
  Future<Map<String, dynamic>> getClientList() async {
    try {
      final token = await _authTokenStorage.getToken();
      final response = await _dio.get(
        'http://10.0.2.2:3333/clients',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw Exception(e.response?.data['message']);
      } else {
        throw Exception('An unexpected error occurred: $e}');
      }
    }
  }

  @override
  Future<Map<String, dynamic>> registerClient(
    String name,
    String email,
    String birthdate,
  ) async {
    try {
      final dto = RegisterClientRequestDto(
        birthdate: birthdate,
        email: email,
        name: name,
      );
      final token = await _authTokenStorage.getToken();

      final response = await _dio.post(
        'http://10.0.2.2:3333/clients',
        data: dto.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw Exception(e.response?.data['message']);
      } else {
        throw Exception('An unexpected error occurred: $e}');
      }
    }
  }

  @override
  Future<Map<String, dynamic>> getDailySales() async {
    try {
      final token = await _authTokenStorage.getToken();
      final response = await _dio.get(
        'http://10.0.2.2:3333/statistics/daily-sales',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw Exception(e.response?.data['message']);
      } else {
        throw Exception('An unexpected error occurred: $e}');
      }
    }
  }

  @override
  Future<Map<String, dynamic>> getHighlights() async {
    try {
      final token = await _authTokenStorage.getToken();
      final response = await _dio.get(
        'http://10.0.2.2:3333/statistics/highlights',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw Exception(e.response?.data['message']);
      } else {
        throw Exception('An unexpected error occurred: $e}');
      }
    }
  }

  @override
  Future<Map<String, dynamic>> registerSale(
    String clientId,
    double value,
    String date,
  ) async {
    try {
      final dto = RegisterSaleRequestDto(
        clientId: clientId,
        value: value,
        date: date,
      );

      final token = await _authTokenStorage.getToken();
      final response = await _dio.post(
        'http://10.0.2.2:3333/sales',
        data: dto.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw Exception(e.response?.data['message']);
      } else {
        throw Exception('An unexpected error occurred: $e}');
      }
    }
  }
}
