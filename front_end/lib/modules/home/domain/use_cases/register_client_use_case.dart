import 'package:front_end/modules/home/domain/repositories/home_repository.dart';

import '../../../../shared/core/dependency_injection/inject.dart';

class RegisterClientUseCase {
  final _repository = getIt<HomeRepository>();

  Future<void> call({
    required String name,
    required String email,
    required String birthdate,
  }) async {
    return await _repository.registerClient(name, email, birthdate);
  }
}
