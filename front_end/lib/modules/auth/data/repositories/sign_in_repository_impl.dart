import 'package:front_end/modules/auth/data/models/response/sign_in_response_dto.dart';
import 'package:front_end/modules/auth/domain/entities/sign_in_entity.dart';
import 'package:front_end/modules/auth/domain/repositories/auth_repository.dart';
import 'package:front_end/shared/core/dependency_injection/inject.dart';

import '../datasource/auth_datasource.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _datasource = getIt<AuthDatasource>();

  @override
  Future<SignInEntity> signIn(String email, String password) async {
    try {
      final response = await _datasource.signIn(email, password);

      final result = SignInResponseDto.fromJson(response);

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
