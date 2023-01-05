import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:fluttergh/app/core/connectivity/domain/service/connectivity_service.dart';
import 'package:fluttergh/app/core/errors/errors.dart';
import 'package:fluttergh/app/core/errors/messages.dart';
import 'package:fluttergh/app/modules/home/domain/entities/pokemon.dart';
import 'package:fluttergh/app/modules/home/domain/repositories/pokedex_repository.dart';

part 'get_by_id_pokemon_usecase.g.dart';

abstract class GetByIdPokemonUseCase {
  Future<Either<SimpleError, Pokemon>> call({
    required int id,
  });
}

@Injectable(singleton: false)
class GetByIdPokemonUseCaseImpl implements GetByIdPokemonUseCase {
  final PokedexRepository pokedexRepository;
  final ConnectivityService connectivityService;

  GetByIdPokemonUseCaseImpl({
    required this.pokedexRepository,
    required this.connectivityService,
  });

  @override
  Future<Either<SimpleError, Pokemon>> call({
    required int id,
  }) async {
    final result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return Left(
        SimpleError(
          message: Messages.OFFLINE_CONNECTION,
        ),
      );
    }

    final response = await pokedexRepository.getByIdPokemon(
      id: id,
    );

    return response.fold(
      (failure) => Left(SimpleError(message: failure.message)),
      (pokemon) => Right(pokemon),
    );
  }
}
