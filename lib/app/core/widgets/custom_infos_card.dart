import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fluttergh/app/core/helpers/number.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInfoCard extends StatelessWidget {
  final String title;
  final String icon;
  final int value;
  final String? complementValue;
  final Color color;

  const CustomInfoCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.value,
    this.complementValue,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                icon,
                width: size.width * 0.06,
                color: color,
              ),
              SizedBox(width: size.width * 0.03),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.025),
          Text(
            NumberHelper.convertWeightEHeight(value) + ' $complementValue',
            textAlign: TextAlign.end,
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
