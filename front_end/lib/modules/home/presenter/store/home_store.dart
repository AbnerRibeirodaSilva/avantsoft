import 'package:front_end/modules/home/domain/entities/client_entity.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/core/dependency_injection/inject.dart';
import '../../domain/entities/statistics_daily_sales_entity.dart';
import '../../domain/entities/statistics_highlights_entity.dart';
import '../../domain/use_cases/get_clients_list_use_case.dart';
import '../../domain/use_cases/get_statistics_daily_sales_use_case.dart';
import '../../domain/use_cases/get_statistics_highlights_use_case.dart';
import '../../domain/use_cases/register_client_use_case.dart';
import '../../domain/use_cases/register_sale_use_case.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final _getClientListUseCase = getIt<GetClientsListUseCase>();
  final _registerClientUseCase = getIt<RegisterClientUseCase>();
  final _registerSaleUseCase = getIt<RegisterSaleUseCase>();
  final _getStatisticsDailySalesUseCase =
      getIt<GetStatisticsDailySalesUseCase>();
  final _getStatisticsHighlightsUseCase =
      getIt<GetStatisticsHighlightsUseCase>();

  @observable
  String saleValue = '';

  @observable
  String saleDate = '';

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String birthdate = '';

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @observable
  List<ClientEntity> clients = [];

  @observable
  StatisticsDailySalesEntity? statisticsDailySales;

  @observable
  StatisticsHighlightsEntity? statisticsHighlights;

  @action
  setSaleValue(String value) {
    saleValue = value;
  }

  @action
  setSaleDate(String value) {
    saleDate = value;
  }

  @action
  setName(String value) {
    name = value;
  }

  @action
  setEmail(String value) {
    email = value;
  }

  @action
  setBirthdate(String value) {
    birthdate = value;
  }

  @action
  setLoading(bool value) {
    isLoading = value;
  }

  @action
  Future<void> fetchClients() async {
    setLoading(true);
    try {
      final result = await _getClientListUseCase.call();
      clients = result.clients;
    } catch (e) {
      errorMessage =
          'Failed to load clients ${e.toString().replaceAll('Exception: ', '')}';
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<void> registerSale({required String clientId}) async {
    setLoading(true);
    try {
      await _registerSaleUseCase.call(
        clientId: clientId,
        value: double.parse(saleValue),
        date: saleDate,
      );
      await fetchClients();
    } catch (e) {
      errorMessage =
          'Failed to register sale ${e.toString().replaceAll('Exception: ', '')}';
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<void> registerClient() async {
    setLoading(true);
    try {
      await _registerClientUseCase.call(
        name: name,
        email: email,
        birthdate: birthdate,
      );
      await fetchClients();
    } catch (e) {
      errorMessage =
          'Failed to create client ${e.toString().replaceAll('Exception: ', '')}';
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<void> fetchStatisticsDailySales() async {
    setLoading(true);
    try {
      final result = await _getStatisticsDailySalesUseCase.call();

      statisticsDailySales = result;
    } catch (e) {
      errorMessage =
          'Failed to load daily sales statistics ${e.toString().replaceAll('Exception: ', '')}';
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<void> fetchStatisticsHighlights() async {
    setLoading(true);
    try {
      final result = await _getStatisticsHighlightsUseCase.call();
      statisticsHighlights = result;
    } catch (e) {
      errorMessage =
          'Failed to load statistics highlights ${e.toString().replaceAll('Exception: ', '')}';
    } finally {
      setLoading(false);
    }
  }

  @action
  String firstMissingAlphabetLetter({required String name}) {
    const alphabet = 'abcdefghijklmnopqrstuvwxyz';
    final normalizedName = name.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');

    final existingLetters = normalizedName.split('').toSet();

    for (final letter in alphabet.split('')) {
      if (!existingLetters.contains(letter)) {
        return letter;
      }
    }

    return '-';
  }
}
