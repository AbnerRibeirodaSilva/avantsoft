import '../../../../shared/core/dependency_injection/inject.dart';
import '../repositories/home_repository.dart';

class RegisterSaleUseCase {
  final _repository = getIt<HomeRepository>();

  Future<void> call({
    required String clientId,
    required double value,
    required String date,
  }) async {
    return await _repository.registerSale(clientId, value, date);
  }
}
