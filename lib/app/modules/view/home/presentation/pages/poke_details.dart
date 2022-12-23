import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttergh/app/core/helpers/number.dart';
import 'package:fluttergh/app/core/helpers/string.dart';
import 'package:fluttergh/app/core/widgets/custom_bar_stats.dart';
import 'package:fluttergh/app/core/widgets/custom_icon_button.dart';
import 'package:fluttergh/app/core/widgets/custom_type_pokemon.dart';

import 'package:fluttergh/app/modules/data/home/domain/entities/pokemon.dart';
import 'package:fluttergh/app/modules/view/home/presentation/helpers/colors_helper.dart';
import 'package:fluttergh/app/modules/view/home/presentation/helpers/icons_helper.dart';
import 'package:fluttergh/app/modules/view/home/presentation/helpers/stats_helper.dart';
import 'package:fluttergh/app/modules/view/home/presentation/widgets/details_image_pokemon.dart';
import 'package:fluttergh/app/modules/view/home/presentation/widgets/details_infos_pokemon.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsImagePokemon(pokemon: widget.pokemon),
              DetailsInfosPokemon(pokemon: widget.pokemon),
            ],
          ),
        ),
      ),
    );
  }
}
