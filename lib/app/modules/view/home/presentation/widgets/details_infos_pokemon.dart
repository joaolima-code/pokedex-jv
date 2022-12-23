import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttergh/app/core/helpers/number.dart';

import 'package:fluttergh/app/core/helpers/string.dart';
import 'package:fluttergh/app/core/widgets/custom_bar_stats.dart';
import 'package:fluttergh/app/core/widgets/custom_infos_card.dart';
import 'package:fluttergh/app/core/widgets/custom_type_pokemon.dart';
import 'package:fluttergh/app/modules/data/home/domain/entities/pokemon.dart';
import 'package:fluttergh/app/modules/view/home/presentation/helpers/colors_helper.dart';
import 'package:fluttergh/app/modules/view/home/presentation/helpers/stats_helper.dart';

class DetailsInfosPokemon extends StatelessWidget {
  final Pokemon pokemon;

  const DetailsInfosPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          // Id pokemon
          Text(
            StringHelper.normalizerId(pokemon.id),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          // Tipos do pokemon
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTypePokemon(types: pokemon.types[0]),
              SizedBox(width: size.width * 0.02),
              pokemon.types.length > 1
                  ? CustomTypePokemon(types: pokemon.types[1])
                  : Container(),
            ],
          ),
          // Infos
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.04,
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
                    ),
                    CustomInfoCard(
                      icon: 'assets/pictures/height.svg',
                      title: 'Altura',
                      value: pokemon.height,
                      complementValue: 'm',
                    ),
                  ],
                ),
                // Estatiticas pokemon
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.06,
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
                          const Text(
                            'Estatísticas',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
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
