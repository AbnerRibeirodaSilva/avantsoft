import '../../../../shared/core/dependency_injection/inject.dart';
import '../entities/statistics_daily_sales_entity.dart';
import '../repositories/home_repository.dart';

class GetStatisticsDailySalesUseCase {
  final _repository = getIt<HomeRepository>();

  Future<StatisticsDailySalesEntity> call() async {
    return await _repository.getDailySales();
  }
}
