import 'package:flutter_modular/flutter_modular.dart';

import 'package:fluttergh/app/core/helpers/enum/store_state.dart';
import 'package:fluttergh/app/modules/home/domain/entities/custom_search.dart';
import 'package:fluttergh/app/modules/home/domain/usecases/get_all_pokemon_usecase.dart';
import 'package:fluttergh/app/modules/home/domain/usecases/get_by_id_pokemon_usecase.dart';

import 'home_store.dart';

class HomeController {
  final HomeStore store;
  final GetAllPokemonUseCase getAllPokemonUseCase;
  final GetByIdPokemonUseCase getByIdPokemonUseCase;

  HomeController({
    required this.store,
    required this.getAllPokemonUseCase,
    required this.getByIdPokemonUseCase,
  });

  Future<void> initData() async {
    if (store.listPokemon.isEmpty) {
      await fetchAllPokemon(store.offsetPosition);
    }
    // await fetchByIdPokemon(1);
  }

  Future<void> selectPage(String path) async {
    store.actualPage = "/pokedex";

    store.setActualPage(store.actualPage!);

    Modular.to.navigate(store.actualPage!);
  }

  Future<void> fetchAllPokemon(int? offsetPage) async {
    store.state = StoreStateEnum.loading;

    final customSearch = _buildSearch();

    final result = await getAllPokemonUseCase(
      customSearch: customSearch,
    );

    result.fold(
      (failure) {
        store.state = StoreStateEnum.error;
      },
      (listPokemon) {
        store.addPokemonList(listPokemon);

        for (final pokemon in listPokemon) {
          final idPokemon = _selectIdUrl(pokemon.url);

          fetchByIdPokemon(idPokemon);
        }

        store.state = StoreStateEnum.completed;
      },
    );
  }

  CustomSearch _buildSearch() {
    return CustomSearch(
      limit: store.limitPage,
      offset: store.offsetPosition,
    );
  }

  Future<void> fetchByIdPokemon(int id) async {
    final result = await getByIdPokemonUseCase(
      id: id,
    );

    result.fold(
      (failure) {
        store.state = StoreStateEnum.error;
      },
      (pokemon) async {
        store.addPokemon(pokemon);
        await sortListPokemon();
      },
    );
  }

  int _selectIdUrl(String url) {
    final stringId = url
        .replaceAll('https://pokeapi.co/api/v2/pokemon/', '')
        .replaceAll('/', '');

    final idPokemon = int.parse(stringId);

    return idPokemon;
  }

  Future<void> sortListPokemon() async {
    store.listPokemon.sort(
      (a, b) => a.id.compareTo(b.id),
    );
  }

  void cleanData() {
    store.offsetPosition = 0;
    store.limitPage = 20;

    store.listSimplePokemon.clear();
    store.listPokemon.clear();
  }
}
