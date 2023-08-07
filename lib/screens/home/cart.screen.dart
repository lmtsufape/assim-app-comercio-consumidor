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
import '../../components/buttons/primary_button.dart';
import '../../shared/constants/app_number_constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    //late int melancia = 0;
    //late int limao = 0;
    late int selectedIndex = 0;
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
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(children: [
                      Row(
                        children: [
                          const Text(
                            'Subtotal',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const HorizontalSpacerBox(size: SpacerSize.small),
                          Text(
                            'R\$ ${controller.total.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.medium),
                      PrimaryButton(
                        text: 'Fechar Pedido (${controller.counter} itens)',
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Screens.finalizePurchase);
                        },
                        color: kDetailColor,
                      ),
                      const VerticalSpacerBox(size: SpacerSize.large),
                      InkWell(
                        child: Container(
                          width: 420,
                          height: 235,
                          decoration: BoxDecoration(
                            color: kOnSurfaceColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: kTextButtonColor.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 3,
                                offset: const Offset(
                                    0, 0), // changes position of shadow
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
                                      height: 150.0,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(Assets.melancia),
                                        ),
                                      ),
                                    ),
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.small),
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        VerticalSpacerBox(
                                            size: SpacerSize.large),
                                        Row(
                                          children: [
                                            Text(
                                              'Melancia',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        VerticalSpacerBox(
                                            size: SpacerSize.medium),
                                        Row(
                                          children: [
                                            Text(
                                              'RS 5,50',
                                              style: TextStyle(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.end,
                                            ),
                                            HorizontalSpacerBox(
                                                size: SpacerSize.tiny),
                                            Text(
                                              'Kg',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        VerticalSpacerBox(
                                            size: SpacerSize.small),
                                        Row(
                                          children: [
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
                                            IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.phone,
                                                color: Colors.green,
                                                size: 30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const HorizontalSpacerBox(
                                    size: SpacerSize.huge),
                                const Text(
                                  'Quantidade:',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.end,
                                ),
                                Row(
                                  children: [
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.small),
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        if (controller.melancia > 0 &&
                                            controller.counter > 0) {
                                          setState(() {
                                            controller.melancia--;
                                            controller.decrementCounter();
                                            controller.total -= 5.50;
                                          });
                                        }
                                      },
                                    ),
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.small),
                                    Text(
                                      controller.melancia.toString(),
                                      style: const TextStyle(fontSize: 15),
                                      textAlign: TextAlign.end,
                                    ),
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.small),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          controller.melancia++;
                                          controller.incrementCounter();
                                          controller.total += 5.50;
                                        });
                                      },
                                    ),
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.large),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          controller.melancia--;
                                          controller.decrementCounter();
                                          controller.total -= 5.50;
                                        });
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                kErrorColor),
                                      ),
                                      child: const Text(
                                        'Excluir',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const VerticalSpacerBox(size: SpacerSize.tiny),
                              ],
                            ),
                          ),
                        ),
                        onTap: () async {},
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      InkWell(
                        child: Container(
                          width: 420,
                          height: 235,
                          decoration: BoxDecoration(
                            color: kOnSurfaceColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: kTextButtonColor.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 3,
                                offset: const Offset(
                                    0, 0), // changes position of shadow
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
                                      height: 150.0,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(Assets.limao),
                                        ),
                                      ),
                                    ),
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        VerticalSpacerBox(
                                            size: SpacerSize.large),
                                        Row(
                                          children: [
                                            Text(
                                              'Limão',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        VerticalSpacerBox(
                                            size: SpacerSize.medium),
                                        Row(
                                          children: [
                                            Text(
                                              'RS 3,50',
                                              style: TextStyle(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.end,
                                            ),
                                            HorizontalSpacerBox(
                                                size: SpacerSize.tiny),
                                            Text(
                                              'Kg',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        VerticalSpacerBox(
                                            size: SpacerSize.small),
                                        Row(
                                          children: [
                                            Text(
                                              'Vendido por ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'João Frutas',
                                              style: TextStyle(
                                                  fontSize: 16, color: kButtom),
                                            ),
                                            IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.phone,
                                                color: Colors.green,
                                                size: 30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const HorizontalSpacerBox(
                                    size: SpacerSize.huge),
                                const Text(
                                  'Quantidade:',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.end,
                                ),
                                Row(
                                  children: [
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.small),
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        if (controller.limao > 0 &&
                                            controller.counter > 0) {
                                          setState(() {
                                            controller.limao--;
                                            controller.decrementCounter();
                                            controller.total -= 3.50;
                                          });
                                        }
                                      },
                                    ),
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.small),
                                    Text(
                                      controller.limao.toString(),
                                      style: const TextStyle(fontSize: 15),
                                      textAlign: TextAlign.end,
                                    ),
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.small),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          controller.limao++;
                                          controller.incrementCounter();
                                          controller.total += 3.50;
                                        });
                                      },
                                    ),
                                    const HorizontalSpacerBox(
                                        size: SpacerSize.large),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          controller.limao--;
                                          controller.decrementCounter();
                                          controller.total -= 3.50;
                                        });
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                kErrorColor),
                                      ),
                                      child: const Text(
                                        'Excluir',
                                        style: TextStyle(
                                          fontSize: 15,
                                          // color: kTextButtonColor
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const VerticalSpacerBox(size: SpacerSize.tiny),
                              ],
                            ),
                          ),
                        ),
                        onTap: () async {},
                      ),
                    ]),
                  ),
                ),
              ))),
    );
  }
}
