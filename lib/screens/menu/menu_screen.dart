import 'package:ecommerceassim/components/utils/horizontal_spacer_box.dart';
import 'package:ecommerceassim/components/utils/vertical_spacer_box.dart';
import 'package:ecommerceassim/screens/home/home_screen_controller.dart';
import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/shared/components/BottomNavigation.dart';
import 'package:ecommerceassim/shared/constants/app_enums.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../assets/index.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => HomeScreenController(),
      builder: (context, child) => Consumer<HomeScreenController>(
        builder: ((context, controller, child) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Ecommerce ASSIM',
                  style: TextStyle(color: kOnSurfaceColor),
                ),
                centerTitle: true,
                backgroundColor: kDetailColor,
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: kOnSurfaceColor,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Screens.profile);
                    },
                  ), //IconButton
                ],
                //IconButton
              ),
              bottomNavigationBar:
                  BottomNavigation(selectedIndex: selectedIndex),
              body: SingleChildScrollView(
                child: Container(
                  color: kOnSurfaceColor,
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              hintText: 'Buscar',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              isDense: true,
                              prefixIcon: Icon(
                                Icons.search,
                                color: kDetailColor,
                                size: 25,
                              ),
                            )),
                      ),
                      const VerticalSpacerBox(size: SpacerSize.medium),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Screens.menu);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: kOnSurfaceColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              kTextButtonColor.withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 3,
                                          offset: const Offset(
                                              0, 0), // chaes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Wrap(
                                        children: [
                                          Center(
                                              child: Image.asset(
                                            Assets.vegetais,
                                            fit: BoxFit.cover,
                                            height: 48,
                                          )),
                                          Container(
                                            alignment: Alignment.bottomCenter,
                                            child: const Text(
                                              'Vegetais',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Screens.menu);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: kOnSurfaceColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              kTextButtonColor.withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 3,
                                          offset: const Offset(0,
                                              0), // cha// changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Wrap(
                                        children: [
                                          Center(
                                              child: Image.asset(
                                            Assets.frutas,
                                            fit: BoxFit.cover,
                                            height: 48,
                                          )),
                                          Container(
                                            alignment: Alignment.bottomCenter,
                                            child: const Text(
                                              'Frutas',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Screens.menu);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: kOnSurfaceColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              kTextButtonColor.withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 3,
                                          offset: const Offset(0,
                                              0), // cha/ changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Wrap(
                                        children: [
                                          Center(
                                              child: Image.asset(
                                            Assets.folhosos,
                                            fit: BoxFit.cover,
                                            height: 48,
                                          )),
                                          Container(
                                            alignment: Alignment.bottomCenter,
                                            child: const Text(
                                              'Folhosos',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Screens.menu);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: kOnSurfaceColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              kTextButtonColor.withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 3,
                                          offset: const Offset(0,
                                              0), // cha // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Wrap(
                                        children: [
                                          Center(
                                              child: Image.asset(
                                            Assets.carnes,
                                            fit: BoxFit.cover,
                                            height: 48,
                                          )),
                                          Container(
                                            alignment: Alignment.bottomCenter,
                                            child: const Text(
                                              'Carnes',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Screens.menu);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: kOnSurfaceColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              kTextButtonColor.withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 3,
                                          offset: const Offset(0,
                                              0), // cha // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Wrap(
                                        children: [
                                          Row(
                                            children: [
                                              Center(
                                                  child: Image.asset(
                                                Assets.ovos,
                                                fit: BoxFit.cover,
                                                height: 30,
                                              )),
                                              Image.asset(
                                                Assets.leite,
                                                fit: BoxFit.cover,
                                                height: 50,
                                              )
                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment.bottomCenter,
                                            child: const Text(
                                              'Leite e Ovos',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.large),
                      SingleChildScrollView(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Container(
                                  width: 210,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: kOnSurfaceColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            kTextButtonColor.withOpacity(0.5),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: const Offset(
                                            0, 0), // chages position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Wrap(
                                      children: [
                                        Row(
                                          children: [
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.large),
                                            Container(
                                              width: 160.0,
                                              height: 180.0,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image:
                                                      AssetImage(Assets.banana),
                                                ),
                                              ),
                                            ),
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.large),
                                          ],
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'RS 0,25',
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'Unidade',
                                        ),
                                        const Row(
                                          children: [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Banana',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.tiny),
                                        const Row(
                                          children: [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Vendido por ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'Maria',
                                              style: TextStyle(
                                                  fontSize: 16, color: kButtom),
                                            ),
                                            Spacer(),
                                            IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.add_box,
                                                color: kButtom,
                                                size: 35,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () async {},
                              ),
                              const HorizontalSpacerBox(size: SpacerSize.tiny),
                              InkWell(
                                child: Container(
                                  width: 210,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: kOnSurfaceColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            kTextButtonColor.withOpacity(0.5),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: const Offset(0,
                                            0), //// changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Wrap(
                                      children: [
                                        Row(
                                          children: [
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.large),
                                            Container(
                                              width: 160.0,
                                              height: 180.0,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image:
                                                      AssetImage(Assets.maca),
                                                ),
                                              ),
                                            ),
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.large),
                                          ],
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'RS 1,18',
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'Unidade',
                                        ),
                                        const Row(
                                          children: [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Maça',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.tiny),
                                        const Row(
                                          children: [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Vendido por ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'João',
                                              style: TextStyle(
                                                  fontSize: 16, color: kButtom),
                                            ),
                                            Spacer(),
                                            IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.add_box,
                                                color: kButtom,
                                                size: 35,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () async {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      SingleChildScrollView(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Container(
                                  width: 210,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: kOnSurfaceColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            kTextButtonColor.withOpacity(0.5),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: const Offset(0,
                                            0), // cha/ changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Wrap(
                                      children: [
                                        Row(
                                          children: [
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.large),
                                            Container(
                                              width: 160.0,
                                              height: 180.0,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      Assets.melancia),
                                                ),
                                              ),
                                            ),
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.large),
                                          ],
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'RS 3,18',
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'Unidade',
                                        ),
                                        const Row(
                                          children: [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Melancia',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.tiny),
                                        const Row(
                                          children: [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Vendido por ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'Maria',
                                              style: TextStyle(
                                                  fontSize: 16, color: kButtom),
                                            ),
                                            Spacer(),
                                            IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.add_box,
                                                color: kButtom,
                                                size: 35,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () async {},
                              ),
                              const HorizontalSpacerBox(size: SpacerSize.tiny),
                              InkWell(
                                child: Container(
                                  width: 210,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: kOnSurfaceColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            kTextButtonColor.withOpacity(0.5),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: const Offset(0,
                                            0), //// changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Wrap(
                                      children: [
                                        Row(
                                          children: [
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.large),
                                            Container(
                                              width: 160.0,
                                              height: 180.0,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image:
                                                      AssetImage(Assets.limao),
                                                ),
                                              ),
                                            ),
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.large),
                                          ],
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'RS 0,50',
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                        const HorizontalSpacerBox(
                                            size: SpacerSize.small),
                                        const Text(
                                          'Unidade',
                                        ),
                                        const Row(
                                          children: [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Limão',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.tiny),
                                        const Row(
                                          children: [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Vendido por ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'João',
                                              style: TextStyle(
                                                  fontSize: 16, color: kButtom),
                                            ),
                                            Spacer(),
                                            IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.add_box,
                                                color: kButtom,
                                                size: 35,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () async {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
