import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttergh/app/modules/home/presentation/controller/home_controller.dart';
import 'package:fluttergh/app/modules/home/presentation/pages/widgets/home_list_pokemon.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'POKEDEX',
          style: GoogleFonts.montserrat(
            fontSize: 28,
            color: colors.onPrimary,
          ),
        ),
        backgroundColor: colors.primary,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Opacity(
              child: SvgPicture.asset(
                'assets/pictures/normal.svg',
                height: size.height * 0.45,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              opacity: 0.20,
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
    );
  }
}
