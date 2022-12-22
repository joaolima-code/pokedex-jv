import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:fluttergh/app/core/connectivity/domain/repositories/connectivity_repositorie.dart';
import 'package:fluttergh/app/core/errors/errors.dart';
import 'package:fluttergh/app/core/errors/messages.dart';
import 'package:fluttergh/app/modules/data/home/domain/entities/custom_search.dart';
import 'package:fluttergh/app/modules/data/home/domain/entities/simple_pokemon.dart';
import 'package:fluttergh/app/modules/data/home/domain/repositories/pokedex_repository.dart';

part 'get_all_pokemon_usecase.g.dart';

abstract class GetAllPokemonUseCase {
  Future<Either<SimpleError, List<SimplePokemon>>> call({
    required CustomSearch customSearch,
  });
}

@Injectable(singleton: false)
class GetAllPokemonUseCaseImpl implements GetAllPokemonUseCase {
  final PokedexRepository pokedexRepository;
  final ConnectivityService connectivityService;

  GetAllPokemonUseCaseImpl({
    required this.pokedexRepository,
    required this.connectivityService,
  });

  @override
  Future<Either<SimpleError, List<SimplePokemon>>> call({
    required CustomSearch customSearch,
  }) async {
    final result = await connectivityService.isOnline();

    if (result.isLeft()) {
      return Left(
        SimpleError(
          message: Messages.OFFLINE_CONNECTION,
        ),
      );
    }

    // final failuresValidator = SearchLogValidator.validateFields(
    //   logCustomSearch,
    // );

    // if (failuresValidator.isNotEmpty) {
    //   return Left(
    //     SimpleError(
    //       message: Messages.INVALID_DATA_FORM,
    //       failuresValidator: failuresValidator,
    //     ),
    //   );
    // }

    final response = await pokedexRepository.listAllPokemon(
      customSearch: customSearch,
    );

    return response.fold(
      (failure) => Left(SimpleError(message: failure.message)),
      (listPokemon) => Right(listPokemon),
    );
  }
}
