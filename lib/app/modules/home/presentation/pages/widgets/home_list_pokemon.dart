import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:fluttergh/app/modules/home/presentation/controller/home_controller.dart';
import 'package:fluttergh/app/modules/home/presentation/pages/widgets/home_card_pokemon.dart';

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
        return controller.store.listPokemon.length > 10
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
            : Center(
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.42),
                  child: Image.asset('assets/pictures/pika_loader.gif'),
                ),
              );
      },
    );
  }
}
