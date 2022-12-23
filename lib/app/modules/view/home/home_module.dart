import 'package:flutter_modular/flutter_modular.dart';

import 'package:fluttergh/app/modules/data/home/domain/usecases/get_all_pokemon_usecase.dart';
import 'package:fluttergh/app/modules/data/home/domain/usecases/get_by_id_pokemon_usecase.dart';
import 'package:fluttergh/app/modules/data/home/service/datasources/pokedex_datasource.dart';
import 'package:fluttergh/app/modules/data/home/service/repositories/pokedex_repository_impl.dart';
import 'package:fluttergh/app/modules/view/home/controller/home_controller.dart';
import 'package:fluttergh/app/modules/view/home/controller/home_store.dart';
import 'package:fluttergh/app/modules/view/home/presentation/pages/poke_details.dart';

import 'presentation/pages/home.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        // UseCases
        $GetAllPokemonUseCaseImpl,
        $GetByIdPokemonUseCaseImpl,
        // Repositories
        $PokedexRepositoryImpl,
        // DataSource
        $PokedexDataSource,
        //Stores
        $HomeStore,
        Bind.factory(
          (i) => HomeController(
            store: i(),
            getAllPokemonUseCase: i(),
            getByIdPokemonUseCase: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/details/:name',
          child: (context, args) => PokeDetails(pokemon: args.data),
        )
      ];
}
