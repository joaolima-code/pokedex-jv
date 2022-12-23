import 'package:flutter/material.dart';
import 'package:fluttergh/app/core/helpers/enum/store_state.dart';
import 'package:fluttergh/app/modules/data/home/domain/entities/pokemon.dart';
import 'package:fluttergh/app/modules/data/home/domain/entities/simple_pokemon.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:fluttergh/app/core/helpers/failure.dart';

part 'home_store.g.dart';

@Injectable()
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  ScrollController scrollController = ScrollController();

  @observable
  String? actualPage;

  @action
  setActualPage(String value) => actualPage = value;

  @observable
  Pokemon? actualPokemon;

  @observable
  int offsetPosition = 0;

  @observable
  int limitPage = 20;

  @observable
  ObservableList<SimplePokemon> listSimplePokemon = ObservableList.of([]);

  @action
  void addPokemonList(List<SimplePokemon> value) =>
      listSimplePokemon.addAll(value);

  @observable
  ObservableList<Pokemon> listPokemon = ObservableList.of([]);

  @action
  void addPokemon(Pokemon value) => listPokemon.add(value);

  @observable
  List<Failure> failuresValidator = [];

  @observable
  StoreStateEnum state = StoreStateEnum.none;

  bool get isLoading => state == StoreStateEnum.loading;
  bool get hasError => state == StoreStateEnum.error;
  bool get completed => state == StoreStateEnum.completed;
}
