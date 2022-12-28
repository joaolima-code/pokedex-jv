import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fluttergh/app/core/helpers/string.dart';
import 'package:fluttergh/app/core/widgets/custom_bar_stats.dart';
import 'package:fluttergh/app/core/widgets/custom_infos_card.dart';
import 'package:fluttergh/app/core/widgets/custom_type_pokemon.dart';
import 'package:fluttergh/app/modules/home/domain/entities/pokemon.dart';
import 'package:fluttergh/app/core/helpers/pokemon/colors_helper.dart';
import 'package:fluttergh/app/core/helpers/pokemon/stats_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsInfosPokemon extends StatelessWidget {
  final Pokemon pokemon;

  const DetailsInfosPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool themeDark = Theme.of(context).brightness == Brightness.dark;

    double valuePecentage = 100;

    for (final stats in pokemon.stats) {
      if (stats.baseStat > valuePecentage) {
        valuePecentage = (valuePecentage * 1.25);
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.015,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nome pokemon
          Text(
            StringHelper.upperCasePrimary(pokemon.name),
            style: GoogleFonts.montserrat(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          // Id pokemon
          Text(
            StringHelper.normalizerId(pokemon.id),
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          // Tipos do pokemon
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTypePokemon(
                types: pokemon.types[0],
                themeDark: themeDark,
              ),
              SizedBox(width: size.width * 0.02),
              pokemon.types.length > 1
                  ? CustomTypePokemon(
                      types: pokemon.types[1],
                      themeDark: themeDark,
                    )
                  : Container(),
            ],
          ),
          // Infos
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.04,
            ),
            child: Column(
              children: [
                // Informações biologicas
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomInfoCard(
                      icon: 'assets/pictures/weight.svg',
                      title: 'Peso',
                      value: pokemon.weight,
                      complementValue: 'kg',
                      color: ColorsHelper.getColorType(type: pokemon.types[0]),
                    ),
                    CustomInfoCard(
                      icon: 'assets/pictures/height.svg',
                      title: 'Altura',
                      value: pokemon.height,
                      complementValue: 'm',
                      color: ColorsHelper.getColorType(type: pokemon.types[0]),
                    ),
                  ],
                ),
                // Estatiticas pokemon
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.06,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/pictures/stats.svg',
                            color: ColorsHelper.getColorType(
                                type: pokemon.types[0]),
                            width: size.width * 0.09,
                          ),
                          SizedBox(width: size.width * 0.02),
                          Text(
                            'Estatísticas',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.montserrat(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      for (final stats in pokemon.stats) ...{
                        CustomBarStats(
                          title: StatsHelper.getName(stats: stats.statName),
                          assetIcon: StatsHelper.getIconStat(
                            stats: stats.statName,
                          ),
                          color: StatsHelper.getColorStat(
                            stats: stats.statName,
                          ),
                          percent: stats.baseStat / valuePecentage,
                          valueCenter: stats.baseStat.toString(),
                          animation: true,
                        ),
                        SizedBox(height: size.height * 0.015),
                      }
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
