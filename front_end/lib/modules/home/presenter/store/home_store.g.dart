// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$saleValueAtom =
      Atom(name: '_HomeStoreBase.saleValue', context: context);

  @override
  String get saleValue {
    _$saleValueAtom.reportRead();
    return super.saleValue;
  }

  @override
  set saleValue(String value) {
    _$saleValueAtom.reportWrite(value, super.saleValue, () {
      super.saleValue = value;
    });
  }

  late final _$saleDateAtom =
      Atom(name: '_HomeStoreBase.saleDate', context: context);

  @override
  String get saleDate {
    _$saleDateAtom.reportRead();
    return super.saleDate;
  }

  @override
  set saleDate(String value) {
    _$saleDateAtom.reportWrite(value, super.saleDate, () {
      super.saleDate = value;
    });
  }

  late final _$nameAtom = Atom(name: '_HomeStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom = Atom(name: '_HomeStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$birthdateAtom =
      Atom(name: '_HomeStoreBase.birthdate', context: context);

  @override
  String get birthdate {
    _$birthdateAtom.reportRead();
    return super.birthdate;
  }

  @override
  set birthdate(String value) {
    _$birthdateAtom.reportWrite(value, super.birthdate, () {
      super.birthdate = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_HomeStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$clientsAtom =
      Atom(name: '_HomeStoreBase.clients', context: context);

  @override
  List<ClientEntity> get clients {
    _$clientsAtom.reportRead();
    return super.clients;
  }

  @override
  set clients(List<ClientEntity> value) {
    _$clientsAtom.reportWrite(value, super.clients, () {
      super.clients = value;
    });
  }

  late final _$statisticsDailySalesAtom =
      Atom(name: '_HomeStoreBase.statisticsDailySales', context: context);

  @override
  StatisticsDailySalesEntity? get statisticsDailySales {
    _$statisticsDailySalesAtom.reportRead();
    return super.statisticsDailySales;
  }

  @override
  set statisticsDailySales(StatisticsDailySalesEntity? value) {
    _$statisticsDailySalesAtom.reportWrite(value, super.statisticsDailySales,
        () {
      super.statisticsDailySales = value;
    });
  }

  late final _$statisticsHighlightsAtom =
      Atom(name: '_HomeStoreBase.statisticsHighlights', context: context);

  @override
  StatisticsHighlightsEntity? get statisticsHighlights {
    _$statisticsHighlightsAtom.reportRead();
    return super.statisticsHighlights;
  }

  @override
  set statisticsHighlights(StatisticsHighlightsEntity? value) {
    _$statisticsHighlightsAtom.reportWrite(value, super.statisticsHighlights,
        () {
      super.statisticsHighlights = value;
    });
  }

  late final _$fetchClientsAsyncAction =
      AsyncAction('_HomeStoreBase.fetchClients', context: context);

  @override
  Future<void> fetchClients() {
    return _$fetchClientsAsyncAction.run(() => super.fetchClients());
  }

  late final _$registerSaleAsyncAction =
      AsyncAction('_HomeStoreBase.registerSale', context: context);

  @override
  Future<void> registerSale({required String clientId}) {
    return _$registerSaleAsyncAction
        .run(() => super.registerSale(clientId: clientId));
  }

  late final _$registerClientAsyncAction =
      AsyncAction('_HomeStoreBase.registerClient', context: context);

  @override
  Future<void> registerClient() {
    return _$registerClientAsyncAction.run(() => super.registerClient());
  }

  late final _$fetchStatisticsDailySalesAsyncAction =
      AsyncAction('_HomeStoreBase.fetchStatisticsDailySales', context: context);

  @override
  Future<void> fetchStatisticsDailySales() {
    return _$fetchStatisticsDailySalesAsyncAction
        .run(() => super.fetchStatisticsDailySales());
  }

  late final _$fetchStatisticsHighlightsAsyncAction =
      AsyncAction('_HomeStoreBase.fetchStatisticsHighlights', context: context);

  @override
  Future<void> fetchStatisticsHighlights() {
    return _$fetchStatisticsHighlightsAsyncAction
        .run(() => super.fetchStatisticsHighlights());
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  dynamic setSaleValue(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setSaleValue');
    try {
      return super.setSaleValue(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSaleDate(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setSaleDate');
    try {
      return super.setSaleDate(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBirthdate(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setBirthdate');
    try {
      return super.setBirthdate(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String firstMissingAlphabetLetter({required String name}) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.firstMissingAlphabetLetter');
    try {
      return super.firstMissingAlphabetLetter(name: name);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
saleValue: ${saleValue},
saleDate: ${saleDate},
name: ${name},
email: ${email},
birthdate: ${birthdate},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
clients: ${clients},
statisticsDailySales: ${statisticsDailySales},
statisticsHighlights: ${statisticsHighlights}
    ''';
  }
}
