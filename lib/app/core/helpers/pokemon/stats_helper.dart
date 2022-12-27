import 'package:flutter/material.dart';

class StatsHelper {
  static Color getColorStat({
    required String stats,
  }) {
    switch (stats) {
      case 'attack':
        return Colors.red.shade400;
      case 'hp':
        return Colors.green;
      case 'defense':
        return Colors.lightBlue;
      case 'special-attack':
        return Colors.red.shade900;
      case 'special-defense':
        return Colors.blue.shade900;
      case 'speed':
        return Colors.orange.shade500;
      default:
        return Colors.grey.shade300;
    }
  }

  static String getIconStat({
    required String stats,
  }) {
    switch (stats) {
      case 'attack':
        return 'assets/pictures/attack.svg';
      case 'hp':
        return 'assets/pictures/hp.svg';
      case 'defense':
        return 'assets/pictures/defense.svg';
      case 'special-attack':
        return 'assets/pictures/sword.svg';
      case 'special-defense':
        return 'assets/pictures/shield.svg';
      case 'speed':
        return 'assets/pictures/speed.svg';
      default:
        return 'assets/pictures/normal.svg';
    }
  }

  static String getName({
    required String stats,
  }) {
    switch (stats) {
      case 'attack':
        return 'Ataque';
      case 'hp':
        return 'Vida';
      case 'defense':
        return 'Defesa';
      case 'special-attack':
        return 'S.Ataque';
      case 'special-defense':
        return 'S.Defesa';
      case 'speed':
        return 'Velocidade';
      default:
        return 'Indefinido';
    }
  }
}
