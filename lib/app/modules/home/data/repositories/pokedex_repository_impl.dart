import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:fluttergh/app/core/errors/errors.dart';
import 'package:fluttergh/app/core/errors/messages.dart';
import 'package:fluttergh/app/core/helpers/failure.dart';

import 'package:fluttergh/app/modules/home/domain/entities/custom_search.dart';
import 'package:fluttergh/app/modules/home/domain/entities/pokemon.dart';
import 'package:fluttergh/app/modules/home/domain/entities/simple_pokemon.dart';
import 'package:fluttergh/app/modules/home/domain/entities/stats.dart';
import 'package:fluttergh/app/modules/home/domain/repositories/pokedex_repository.dart';
import 'package:fluttergh/app/modules/home/data/datasources/pokedex_datasource.dart';
import 'package:fluttergh/app/modules/home/data/dto/pokemon_dto.dart';
import 'package:fluttergh/app/modules/home/data/dto/simple_pokemon_dto.dart';

part 'pokedex_repository_impl.g.dart';

@Injectable(singleton: false)
class PokedexRepositoryImpl implements PokedexRepository {
  final PokedexDataSource pokedexDataSource;

  PokedexRepositoryImpl(
    this.pokedexDataSource,
  );

  @override
  Future<Either<Failure, List<SimplePokemon>>> listAllPokemon({
    required CustomSearch customSearch,
  }) async {
    final response = await pokedexDataSource.getRemoteListPokemon(
      customSearch: customSearch,
    );

    return response.fold(
      (failure) => Left(
        SimpleError(message: failure.message),
      ),
      (response) {
        try {
          List<SimplePokemonDto> pokedex = response;

          List<SimplePokemon> result = pokedex
              .map((pokemon) =>
                  SimplePokemon(name: pokemon.name, url: pokemon.url))
              .toList();

          return Right(result);
        } catch (e) {
          return Left(SimpleError(message: Messages.FAILED_TO_GET_ALL_POKEMON));
        }
      },
    );
  }

  @override
  Future<Either<Failure, Pokemon>> getByIdPokemon({
    required int id,
  }) async {
    final response = await pokedexDataSource.getByIdPokemon(
      id: id,
    );

    return response.fold(
      (failure) => Left(
        SimpleError(message: failure.message),
      ),
      (response) {
        try {
          PokemonDto pokemon = response;

          Pokemon result = Pokemon(
            name: pokemon.name!,
            id: pokemon.id!,
            imagem: pokemon.sprites?.other?.dreamWorld?.frontDefault ??
                pokemon.sprites?.frontDefault,
            icon: pokemon.sprites?.frontDefault,
            types: pokemon.types!.map((e) => e.type!.name!).toList(),
            height: pokemon.height!,
            weight: pokemon.weight!,
            stats: pokemon.stats!
                .map((e) => StatsPokemon(
                    baseStat: e.baseStat!, statName: e.stat!.name!))
                .toList(),
          );

          return Right(result);
        } catch (e) {
          return Left(SimpleError(message: Messages.FAILED_TO_GET_POKEMON));
        }
      },
    );
  }
}
