import 'package:mobx/mobx.dart';

import '../../../../shared/core/dependency_injection/inject.dart';
import '../../../../shared/core/local_storage/auth_token_storage.dart';
import '../../domain/use_cases/sign_in_use_case.dart';

part 'sign_in_store.g.dart';

class SignInStore = _SignInStoreBase with _$SignInStore;

abstract class _SignInStoreBase with Store {
  final _signInUseCase = getIt<SignInUseCase>();
  final _authTokenStorage = getIt<AuthTokenStorage>();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @observable
  bool isLoggedIn = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  void setIsLoggedIn(bool value) => isLoggedIn = value;

  @action
  Future<void> signIn() async {
    setLoading(true);
    try {
      final result = await _signInUseCase(email: email, password: password);
      await _authTokenStorage.saveAuthToken(result.token);
      setIsLoggedIn(true);
    } catch (e) {
      errorMessage =
          'Failed to sign in: ${e.toString().replaceAll('Exception: ', '')}';
    } finally {
      setLoading(false);
    }
  }
}
