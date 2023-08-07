import 'package:ecommerceassim/components/buttons/primary_button.dart';
import 'package:ecommerceassim/components/utils/horizontal_spacer_box.dart';
import 'package:ecommerceassim/components/utils/vertical_spacer_box.dart';
import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/shared/constants/app_enums.dart';
import 'package:ecommerceassim/shared/constants/app_number_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/constants/style_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              onPressed: () {},
            ), //IconButton
          ],
          //IconButton
        ),
        // ignore: sized_box_for_whitespace
        body: Container(
          color: kOnSurfaceColor,
          child: Column(
            children: [
              InkWell(
                onTap: () async {},
                child: Row(
                  children: [
                    Container(
                      width: 480,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: kDetailColor,
                      ),
                      child: Center(
                        child: Wrap(
                          children: [
                            Row(
                              children: [
                                const HorizontalSpacerBox(
                                    size: SpacerSize.large),
                                const HorizontalSpacerBox(
                                    size: SpacerSize.small),
                                Container(
                                  width: 62.0,
                                  height: 62.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg"),
                                    ),
                                  ),
                                ),
                                const HorizontalSpacerBox(
                                    size: SpacerSize.medium),
                                const Text(
                                  'Maria Eduarda',
                                  style: TextStyle(
                                      fontSize: 22, color: kOnSurfaceColor),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Screens.purchases);
                },
                child: Row(
                  children: [
                    Container(
                      width: 480,
                      height: 60,
                      decoration: BoxDecoration(
                        color: kOnSurfaceColor,
                        boxShadow: [
                          BoxShadow(
                            color: kTextButtonColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Wrap(
                          children: [
                            VerticalSpacerBox(size: SpacerSize.large),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HorizontalSpacerBox(size: SpacerSize.large),
                                Icon(
                                  Icons.list_alt,
                                  size: 32,
                                ),
                                HorizontalSpacerBox(size: SpacerSize.medium),
                                Text(
                                  'Pedidos',
                                  style: TextStyle(
                                      fontSize: 21, color: kTextButtonColor),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Screens.selectAdress);
                },
                child: Row(
                  children: [
                    Container(
                      width: 480,
                      height: 60,
                      decoration: BoxDecoration(
                        color: kOnSurfaceColor,
                        boxShadow: [
                          BoxShadow(
                            color: kTextButtonColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Wrap(
                          children: [
                            VerticalSpacerBox(size: SpacerSize.large),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HorizontalSpacerBox(size: SpacerSize.large),
                                Icon(
                                  Icons.pin_drop,
                                  size: 32,
                                ),
                                HorizontalSpacerBox(size: SpacerSize.medium),
                                Text(
                                  'Endereços',
                                  style: TextStyle(
                                      fontSize: 21, color: kTextButtonColor),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Screens.selectCard);
                },
                child: Row(
                  children: [
                    Container(
                      width: 480,
                      height: 60,
                      decoration: BoxDecoration(
                        color: kOnSurfaceColor,
                        boxShadow: [
                          BoxShadow(
                            color: kTextButtonColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Wrap(
                          children: [
                            VerticalSpacerBox(size: SpacerSize.large),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HorizontalSpacerBox(size: SpacerSize.large),
                                Icon(
                                  Icons.credit_card,
                                  size: 32,
                                ),
                                HorizontalSpacerBox(size: SpacerSize.medium),
                                Text(
                                  'Pagamentos',
                                  style: TextStyle(
                                      fontSize: 21, color: kTextButtonColor),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Screens.favorite);
                },
                child: Row(
                  children: [
                    Container(
                      width: 480,
                      height: 60,
                      decoration: BoxDecoration(
                        color: kOnSurfaceColor,
                        boxShadow: [
                          BoxShadow(
                            color: kTextButtonColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 5), // changes position of shadow
                          )
                        ],
                      ),
                      child: const Center(
                        child: Wrap(
                          children: [
                            VerticalSpacerBox(size: SpacerSize.large),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HorizontalSpacerBox(size: SpacerSize.large),
                                Icon(
                                  Icons.favorite,
                                  size: 32,
                                ),
                                HorizontalSpacerBox(size: SpacerSize.medium),
                                Text(
                                  'Favoritos',
                                  style: TextStyle(
                                      fontSize: 21, color: kTextButtonColor),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: PrimaryButton(
                  text: 'Sair',
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  color: kDetailColor,
                ),
              ),
            ],
          ),
        ));
  }
}
