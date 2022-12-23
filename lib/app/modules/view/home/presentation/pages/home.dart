import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergh/app/modules/view/home/controller/home_controller.dart';
import 'package:fluttergh/app/modules/view/home/presentation/widgets/home_list_pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get<HomeController>();

  @override
  void initState() {
    controller.initData();
    // controller.store.scrollController.addListener(() {
    //   if (controller.store.scrollController.position.pixels >=
    //       controller.store.scrollController.position.maxScrollExtent) {
    //     final offsetPosition = controller.store.offsetPosition + 20;
    //     controller.fetchAllPokemon(offsetPosition);
    //   }
    // });
    super.initState();
  }

  // @override
  // void dispose() {
  //   controller.cleanData();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokedex',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
          ),
        ),
        backgroundColor: Colors.white70,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Opacity(
              child: Image.asset(
                'assets/pictures/pokeball_dark.png',
                height: 240,
                width: 240,
              ),
              opacity: 0.035,
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: controller.store.scrollController,
            child: Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.05,
                right: size.width * 0.05,
              ),
              child: Column(
                children: [
                  ListPokemon(
                    controller: controller,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_for_work),
        onPressed: () => Modular.to.navigate(
          '/details/pokemon.name',
          arguments: controller.store.listPokemon[0],
        ),
      ),
    );
  }
}
