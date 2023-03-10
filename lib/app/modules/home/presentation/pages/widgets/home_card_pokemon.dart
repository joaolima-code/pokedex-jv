import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttergh/app/core/helpers/string.dart';

import 'package:fluttergh/app/modules/home/domain/entities/pokemon.dart';
import 'package:fluttergh/app/modules/home/presentation/controller/home_controller.dart';
import 'package:fluttergh/app/core/helpers/pokemon/colors_helper.dart';
import 'package:fluttergh/app/modules/home/presentation/pages/poke_details.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final bool themeDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => Modular.to.push(
        MaterialPageRoute(
          builder: (context) => PokeDetails(
            pokemon: pokemon,
          ),
        ),
      ),
      child: Container(
        width: size.width * 0.43,
        height: size.height * 0.25,
        decoration: BoxDecoration(
            color: !themeDark
                ? ColorsHelper.getColorType(type: pokemon.types[0])
                : ColorsHelper.getColorTypeDark(type: pokemon.types[0]),
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
                  !themeDark
                      ? 'assets/pictures/pokeball_white.png'
                      : 'assets/pictures/pokeball_dark.png',
                  height: size.height * 0.2,
                  width: size.width * 0.30,
                ),
                opacity: 0.25,
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
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
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
                            color: theme.colorScheme.surface,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              StringHelper.upperCasePrimary(pokemon.types[0]),
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        pokemon.types.length > 1
                            ? Container(
                                padding: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: theme.colorScheme.surface,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    StringHelper.upperCasePrimary(
                                        pokemon.types[1]),
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white70,
                                    ),
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
