import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomBarStats extends StatelessWidget {
  final String title;
  final String assetIcon;
  final Color color;
  final double percent;
  final bool animation;

  const CustomBarStats({
    Key? key,
    required this.title,
    required this.assetIcon,
    required this.color,
    required this.percent,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: size.width * 0.22,
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),
        Expanded(
          child: LinearPercentIndicator(
            animation: animation,
            animationDuration: 1500,
            // width: size.width * 0.6,
            lineHeight: size.height * 0.025,
            percent: percent,
            progressColor: color,
            barRadius: const Radius.circular(10.0),
          ),
        ),
        SizedBox(width: size.width * 0.02),
        SvgPicture.asset(
          assetIcon,
          color: color,
          width: size.width * 0.055,
        ),
      ],
    );
  }
}
