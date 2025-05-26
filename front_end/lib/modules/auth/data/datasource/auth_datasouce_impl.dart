import 'package:dio/dio.dart';
import 'package:front_end/shared/core/dependency_injection/inject.dart';

import '../models/request/sign_in_request_dto.dart';
import 'auth_datasource.dart';

class AuthDatasouceImpl extends AuthDatasource {
  final dio = getIt<Dio>();

  @override
  Future<Map<String, dynamic>> signIn(String email, String password) async {
    try {
      final dto = SignInRequestDto(email: email, password: password);

      final response = await dio.post(
        'http://10.0.2.2:3333/auth/login',
        data: dto.toJson(),
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
