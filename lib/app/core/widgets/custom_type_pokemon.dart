import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttergh/app/core/helpers/string.dart';

import 'package:fluttergh/app/core/helpers/pokemon/colors_helper.dart';
import 'package:fluttergh/app/core/helpers/pokemon/icons_helper.dart';

class CustomTypePokemon extends StatelessWidget {
  final String types;

  const CustomTypePokemon({
    Key? key,
    required this.types,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsHelper.getColorType(type: types),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.030, vertical: size.height * 0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.height * 0.040,
              height: size.height * 0.040,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(
                  IconsHelper.getIconType(type: types),
                  color: ColorsHelper.getColorType(type: types),
                ),
              ),
            ),
            SizedBox(width: size.width * 0.015),
            Text(
              StringHelper.upperCasePrimary(types),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
