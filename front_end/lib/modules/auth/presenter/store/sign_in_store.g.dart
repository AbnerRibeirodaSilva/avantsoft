// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInStore on _SignInStoreBase, Store {
  late final _$emailAtom =
      Atom(name: '_SignInStoreBase.email', context: context);

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

  late final _$passwordAtom =
      Atom(name: '_SignInStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SignInStoreBase.isLoading', context: context);

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
      Atom(name: '_SignInStoreBase.errorMessage', context: context);

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

  late final _$isLoggedInAtom =
      Atom(name: '_SignInStoreBase.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$signInAsyncAction =
      AsyncAction('_SignInStoreBase.signIn', context: context);

  @override
  Future<void> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  late final _$_SignInStoreBaseActionController =
      ActionController(name: '_SignInStoreBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoggedIn(bool value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.setIsLoggedIn');
    try {
      return super.setIsLoggedIn(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
