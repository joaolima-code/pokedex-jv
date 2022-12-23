import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fluttergh/app/core/widgets/custom_icon_button.dart';
import 'package:fluttergh/app/modules/data/home/domain/entities/pokemon.dart';
import 'package:fluttergh/app/modules/view/home/presentation/helpers/colors_helper.dart';
import 'package:fluttergh/app/modules/view/home/presentation/helpers/icons_helper.dart';

class DetailsImagePokemon extends StatelessWidget {
  final Pokemon pokemon;

  const DetailsImagePokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.45,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.40,
            decoration: BoxDecoration(
              color: ColorsHelper.getColorType(type: pokemon.types[0])
                  .withOpacity(0.95),
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
              child: Opacity(
                child: SvgPicture.asset(
                  IconsHelper.getIconType(type: pokemon.types[0]),
                  height: size.height * 0.3,
                ),
                opacity: 0.8,
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
              vertical: size.width * 0.025,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  onPressed: () => Modular.to.navigate('/'),
                  icon: Icons.arrow_back_ios_new_rounded,
                ),
                CustomIconButton(
                  onPressed: () {},
                  icon: Icons.favorite_border_rounded,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
