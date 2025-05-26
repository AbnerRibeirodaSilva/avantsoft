import 'client_highlights_entity.dart';

class StatisticsHighlightsEntity {
  final ClientHighlightsEntity mostTotal;
  final ClientHighlightsEntity mostAverage;
  final ClientHighlightsEntity mostFrequent;

  StatisticsHighlightsEntity({
    required this.mostTotal,
    required this.mostAverage,
    required this.mostFrequent,
  });
}
