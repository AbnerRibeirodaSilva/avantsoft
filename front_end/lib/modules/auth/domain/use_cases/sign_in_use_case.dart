import '../../../../shared/core/dependency_injection/inject.dart';
import '../entities/sign_in_entity.dart';
import '../repositories/auth_repository.dart';

class SignInUseCase {
  final _repository = getIt<AuthRepository>();

  Future<SignInEntity> call({
    required String email,
    required String password,
  }) async {
    return await _repository.signIn(email, password);
  }
}
