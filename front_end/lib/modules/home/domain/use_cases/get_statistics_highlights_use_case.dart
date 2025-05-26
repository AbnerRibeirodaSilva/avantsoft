import 'package:front_end/modules/home/domain/entities/statistics_highlights_entity.dart';

import '../../../../shared/core/dependency_injection/inject.dart';
import '../repositories/home_repository.dart';

class GetStatisticsHighlightsUseCase {
  final _repository = getIt<HomeRepository>();

  Future<StatisticsHighlightsEntity> call() async {
    return await _repository.getStatisticsHighlights();
  }
}
