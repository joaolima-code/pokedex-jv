import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fluttergh/app/core/widgets/custom_icon_button.dart';
import 'package:fluttergh/app/modules/home/domain/entities/pokemon.dart';
import 'package:fluttergh/app/core/helpers/pokemon/colors_helper.dart';
import 'package:fluttergh/app/core/helpers/pokemon/icons_helper.dart';

class DetailsImagePokemon extends StatelessWidget {
  final Pokemon pokemon;

  const DetailsImagePokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool themeDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: size.height * 0.45,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.40,
            decoration: BoxDecoration(
              color: !themeDark
                  ? ColorsHelper.getColorType(type: pokemon.types[0])
                  : ColorsHelper.getColorTypeDark(type: pokemon.types[0]),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.elliptical(250, 95),
                bottomRight: Radius.elliptical(250, 95),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.05),
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                IconsHelper.getIconType(type: pokemon.types[0]),
                height: size.height * 0.3,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.network(
              pokemon.imagem ??
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/${pokemon.id}.svg',
              alignment: Alignment.bottomRight,
              height: size.height * 0.325,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.025,
              vertical: size.width * 0.1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  onPressed: () => Modular.to.pop(),
                  icon: Icons.arrow_back_ios_new_rounded,
                  color: !themeDark
                      ? Colors.white
                      : Theme.of(context).colorScheme.surface,
                ),
                CustomIconButton(
                  onPressed: () {},
                  icon: Icons.favorite_border_rounded,
                  color: !themeDark
                      ? Colors.white
                      : Theme.of(context).colorScheme.surface,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
