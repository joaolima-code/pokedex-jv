import 'package:dartz/dartz.dart';
import 'package:fluttergh/app/core/helpers/failure.dart';
import 'package:fluttergh/app/modules/data/home/domain/entities/custom_search.dart';
import 'package:fluttergh/app/modules/data/home/domain/entities/pokemon.dart';
import 'package:fluttergh/app/modules/data/home/domain/entities/simple_pokemon.dart';

abstract class PokedexRepository {
  Future<Either<Failure, List<SimplePokemon>>> listAllPokemon({
    required CustomSearch customSearch,
  });

  Future<Either<Failure, Pokemon>> getByIdPokemon({
    required int id,
  });
}
