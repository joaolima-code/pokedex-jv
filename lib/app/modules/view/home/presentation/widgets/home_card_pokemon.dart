import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttergh/app/core/helpers/string.dart';

import 'package:fluttergh/app/modules/data/home/domain/entities/pokemon.dart';
import 'package:fluttergh/app/modules/view/home/controller/home_controller.dart';
import 'package:fluttergh/app/modules/view/home/presentation/helpers/colors_helper.dart';

class CardPokemon extends StatelessWidget {
  final Pokemon pokemon;
  final HomeController controller;

  const CardPokemon({
    Key? key,
    required this.pokemon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Modular.to.navigate(
        '/details/${pokemon.name}',
        arguments: pokemon,
      ),
      child: Container(
        width: size.width * 0.43,
        height: size.height * 0.25,
        decoration: BoxDecoration(
            color: ColorsHelper.getColorType(type: pokemon.types[0]),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black45,
                blurRadius: 5.0,
              )
            ]),
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Opacity(
                child: Image.asset(
                  'assets/pictures/pokeball_white.png',
                  height: size.height * 0.2,
                  width: size.width * 0.30,
                ),
                opacity: 0.20,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.network(
                pokemon.imagem ??
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/${pokemon.id}.svg',
                alignment: Alignment.bottomRight,
                height: size.height * 0.15,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringHelper.upperCasePrimary(pokemon.name),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(80, 255, 255, 255)),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              StringHelper.upperCasePrimary(pokemon.types[0]),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        pokemon.types.length > 1
                            ? Container(
                                padding: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color.fromARGB(
                                        80, 255, 255, 255)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    StringHelper.upperCasePrimary(
                                        pokemon.types[1]),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
