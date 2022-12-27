import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:fluttergh/app/core/dio/authenticated_dio.dart';
import 'package:fluttergh/app/core/errors/errors.dart';
import 'package:fluttergh/app/core/helpers/failure.dart';
import 'package:fluttergh/app/modules/home/domain/entities/custom_search.dart';
import 'package:fluttergh/app/modules/home/data/dto/pokemon_dto.dart';
import 'package:fluttergh/app/modules/home/data/dto/simple_pokemon_dto.dart';

part 'pokedex_datasource.g.dart';

@Injectable(singleton: false)
class PokedexDataSource {
  final AuthenticatedDio dio;

  PokedexDataSource({
    required this.dio,
  });

  Future<Either<Failure, List<SimplePokemonDto>>> getRemoteListPokemon({
    required CustomSearch customSearch,
  }) async {
    try {
      final response = await dio.get(
        '/pokemon?offset=${customSearch.offset}&limit=${customSearch.limit}',
      );

      final rawList = response.data["results"] as List;

      final result = rawList
          .map((pokemonDto) => SimplePokemonDto.fromMap(pokemonDto))
          .toList();

      return Right(result);
    } on DioError catch (e) {
      return Left(
        SimpleError(message: e.response!.data['message']),
      );
    } catch (e) {
      return Left(SimpleError(message: e.toString()));
    }
  }

  Future<Either<Failure, PokemonDto>> getByIdPokemon({
    required int id,
  }) async {
    try {
      final response = await dio.get(
        '/pokemon/$id',
      );

      final result = PokemonDto.fromMap(response.data);

      return Right(result);
    } on DioError catch (e) {
      return Left(
        SimpleError(message: e.response!.data['message']),
      );
    } catch (e) {
      return Left(SimpleError(message: e.toString()));
    }
  }
}
