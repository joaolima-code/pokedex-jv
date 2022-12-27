// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeStore = BindInject(
  (i) => HomeStore(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$actualPageAtom = Atom(name: '_HomeStoreBase.actualPage');

  @override
  String? get actualPage {
    _$actualPageAtom.reportRead();
    return super.actualPage;
  }

  @override
  set actualPage(String? value) {
    _$actualPageAtom.reportWrite(value, super.actualPage, () {
      super.actualPage = value;
    });
  }

  final _$actualPokemonAtom = Atom(name: '_HomeStoreBase.actualPokemon');

  @override
  Pokemon? get actualPokemon {
    _$actualPokemonAtom.reportRead();
    return super.actualPokemon;
  }

  @override
  set actualPokemon(Pokemon? value) {
    _$actualPokemonAtom.reportWrite(value, super.actualPokemon, () {
      super.actualPokemon = value;
    });
  }

  final _$offsetPositionAtom = Atom(name: '_HomeStoreBase.offsetPosition');

  @override
  int get offsetPosition {
    _$offsetPositionAtom.reportRead();
    return super.offsetPosition;
  }

  @override
  set offsetPosition(int value) {
    _$offsetPositionAtom.reportWrite(value, super.offsetPosition, () {
      super.offsetPosition = value;
    });
  }

  final _$limitPageAtom = Atom(name: '_HomeStoreBase.limitPage');

  @override
  int get limitPage {
    _$limitPageAtom.reportRead();
    return super.limitPage;
  }

  @override
  set limitPage(int value) {
    _$limitPageAtom.reportWrite(value, super.limitPage, () {
      super.limitPage = value;
    });
  }

  final _$listSimplePokemonAtom =
      Atom(name: '_HomeStoreBase.listSimplePokemon');

  @override
  ObservableList<SimplePokemon> get listSimplePokemon {
    _$listSimplePokemonAtom.reportRead();
    return super.listSimplePokemon;
  }

  @override
  set listSimplePokemon(ObservableList<SimplePokemon> value) {
    _$listSimplePokemonAtom.reportWrite(value, super.listSimplePokemon, () {
      super.listSimplePokemon = value;
    });
  }

  final _$listPokemonAtom = Atom(name: '_HomeStoreBase.listPokemon');

  @override
  ObservableList<Pokemon> get listPokemon {
    _$listPokemonAtom.reportRead();
    return super.listPokemon;
  }

  @override
  set listPokemon(ObservableList<Pokemon> value) {
    _$listPokemonAtom.reportWrite(value, super.listPokemon, () {
      super.listPokemon = value;
    });
  }

  final _$failuresValidatorAtom =
      Atom(name: '_HomeStoreBase.failuresValidator');

  @override
  List<Failure> get failuresValidator {
    _$failuresValidatorAtom.reportRead();
    return super.failuresValidator;
  }

  @override
  set failuresValidator(List<Failure> value) {
    _$failuresValidatorAtom.reportWrite(value, super.failuresValidator, () {
      super.failuresValidator = value;
    });
  }

  final _$stateAtom = Atom(name: '_HomeStoreBase.state');

  @override
  StoreStateEnum get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StoreStateEnum value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  dynamic setActualPage(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setActualPage');
    try {
      return super.setActualPage(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPokemonList(List<SimplePokemon> value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.addPokemonList');
    try {
      return super.addPokemonList(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPokemon(Pokemon value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.addPokemon');
    try {
      return super.addPokemon(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
actualPage: ${actualPage},
actualPokemon: ${actualPokemon},
offsetPosition: ${offsetPosition},
limitPage: ${limitPage},
listSimplePokemon: ${listSimplePokemon},
listPokemon: ${listPokemon},
failuresValidator: ${failuresValidator},
state: ${state}
    ''';
  }
}
