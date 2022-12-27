import 'package:flutter/material.dart';

class IconsHelper {
  static String getIconType({
    required String type,
  }) {
    switch (type) {
      case 'normal':
        return 'assets/pictures/normal.svg';
      case 'fire':
        return 'assets/pictures/fire.svg';
      case 'water':
        return 'assets/pictures/water.svg';
      case 'grass':
        return 'assets/pictures/grass.svg';
      case 'electric':
        return 'assets/pictures/electric.svg';
      case 'ice':
        return 'assets/pictures/ice.svg';
      case 'fighting':
        return 'assets/pictures/fighting.svg';
      case 'poison':
        return 'assets/pictures/poison.svg';
      case 'ground':
        return 'assets/pictures/ground.svg';
      case 'flying':
        return 'assets/pictures/flying.svg';
      case 'psychic':
        return 'assets/pictures/psychic.svg';
      case 'bug':
        return 'assets/pictures/bug.svg';
      case 'rock':
        return 'assets/pictures/rock.svg';
      case 'ghost':
        return 'assets/pictures/ghost.svg';
      case 'dark':
        return 'assets/pictures/dark.svg';
      case 'dragon':
        return 'assets/pictures/dragon.svg';
      case 'steel':
        return 'assets/pictures/steel.svg';
      case 'fairy':
        return 'assets/pictures/fairy.svg';
      default:
        return 'assets/pictures/normal.svg';
    }
  }
}
