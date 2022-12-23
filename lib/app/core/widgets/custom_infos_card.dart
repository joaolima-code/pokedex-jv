import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fluttergh/app/core/helpers/number.dart';

class CustomInfoCard extends StatelessWidget {
  final String title;
  final String icon;
  final int value;
  final String? complementValue;

  const CustomInfoCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.value,
    this.complementValue,
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
                color: Colors.grey.shade500,
                width: size.width * 0.06,
              ),
              SizedBox(width: size.width * 0.03),
              Text(
                title,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.025),
          Text(
            NumberHelper.convertWeightEHeight(value) + ' $complementValue',
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          )
        ],
      ),
    );
  }
}
