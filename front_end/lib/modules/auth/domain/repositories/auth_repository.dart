import 'package:front_end/modules/auth/domain/entities/sign_in_entity.dart';

abstract class AuthRepository {
  Future<SignInEntity> signIn(String email, String password);
}
