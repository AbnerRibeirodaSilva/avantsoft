import 'package:front_end/modules/home/domain/entities/client_list_entity.dart';
import 'package:front_end/modules/home/domain/repositories/home_repository.dart';

import '../../../../shared/core/dependency_injection/inject.dart';

class GetClientsListUseCase {
  final _repository = getIt<HomeRepository>();

  Future<ClientListEntity> call() async {
    return await _repository.getClientsList();
  }
}
