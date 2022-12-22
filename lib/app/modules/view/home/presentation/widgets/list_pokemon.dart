import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:fluttergh/app/modules/view/home/controller/home_controller.dart';
import 'package:fluttergh/app/modules/view/home/presentation/widgets/card_pokemon.dart';

class ListPokemon extends StatelessWidget {
  final HomeController controller;

  const ListPokemon({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) {
        if (controller.store.isLoading) {
          return Center(
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.42),
              child: const CircularProgressIndicator(),
            ),
          );
        }

        return controller.store.listPokemon.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(top: size.height * 0.02),
                child: Column(
                  children: [
                    Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: size.width * 0.035,
                      spacing: size.height * 0.018,
                      children: controller.store.listPokemon.map(
                        (pokemon) {
                          return CardPokemon(
                            pokemon: pokemon,
                            controller: controller,
                          );
                        },
                      ).toList(),
                    ),
                    SizedBox(height: size.height * 0.008),
                    if (controller.store.isLoading) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            alignment: Alignment.bottomCenter,
                            child: const CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    ]
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.only(top: size.height * 0.75),
                child: const Center(
                  child: Text(
                    'Nenhum pokemon encontrado',
                    // style: AppTheme.textStyles.userNotFound.copyWith(
                    //   fontSize: size.height * 0.03,
                    // ),
                  ),
                ),
              );
      },
    );
  }
}
