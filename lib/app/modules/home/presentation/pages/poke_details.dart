import 'package:flutter/material.dart';

import 'package:fluttergh/app/modules/home/domain/entities/pokemon.dart';
import 'package:fluttergh/app/modules/home/presentation/pages/widgets/details_image_pokemon.dart';
import 'package:fluttergh/app/modules/home/presentation/pages/widgets/details_infos_pokemon.dart';

class PokeDetails extends StatefulWidget {
  final Pokemon pokemon;

  const PokeDetails({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<PokeDetails> createState() => _PokeDetailsState();
}

class _PokeDetailsState extends State<PokeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsImagePokemon(pokemon: widget.pokemon),
            DetailsInfosPokemon(pokemon: widget.pokemon),
          ],
        ),
      ),
    );
  }
}
