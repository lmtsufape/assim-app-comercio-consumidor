// ignore_for_file: prefer_const_constructors

import 'package:ecommerceassim/components/navBar/custom_app_bar.dart';
import 'package:ecommerceassim/components/buttons/primary_button.dart';
import 'package:ecommerceassim/components/utils/horizontal_spacer_box.dart';
import 'package:ecommerceassim/screens/profile/components/custom_ink.dart';
import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/screens/signin/sign_in_screen.dart';
import 'package:ecommerceassim/shared/components/BottomNavigation.dart';
import 'package:ecommerceassim/shared/constants/app_enums.dart';
import 'package:ecommerceassim/shared/constants/app_number_constants.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/constants/style_constants.dart';
import '../../shared/core/controllers/sign_in_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserStorage userStorage = UserStorage();
    int selectedIndex = 3;

    return Scaffold(
        appBar: const CustomAppBar(),
        bottomNavigationBar: BottomNavigation(selectedIndex: selectedIndex),
        body: Container(
          color: kOnSurfaceColor,
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  Navigator.pushNamed(context, Screens.home);
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 480,
                      height: 100,
                      child: Center(
                        child: Wrap(
                          children: [
                            Row(
                              children: [
                                const HorizontalSpacerBox(
                                    size: SpacerSize.tiny),
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
                                FutureBuilder<String>(
                                  future: userStorage.getUserName(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text(
                                        'Carregando...',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: kTextButtonColor),
                                      );
                                    } else if (snapshot.hasError ||
                                        snapshot.data == '') {
                                      return const Text(
                                        'Convidado',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: kTextButtonColor),
                                        textAlign: TextAlign.end,
                                      );
                                    } else {
                                      // Here we can safely access the snapshot data
                                      return Text(
                                        snapshot.data ?? 'Usuário',
                                        style: const TextStyle(
                                            fontSize: 22,
                                            color: kTextButtonColor),
                                        textAlign: TextAlign.end,
                                      );
                                    }
                                  },
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
              CustomInkWell(
                icon: Icons.list_alt,
                text: 'Pedidos',
                onTap: () {
                  Navigator.pushNamed(context, Screens.purchases);
                },
              ),
              CustomInkWell(
                icon: Icons.pin_drop,
                text: 'Endereços',
                onTap: () {
                  Navigator.pushNamed(context, Screens.selectAdress);
                },
              ),
              /*  CustomInkWell(
                icon: Icons.credit_card,
                text: 'Pagamentos',
                onTap: () {
                  Navigator.pushNamed(context, Screens.selectCard);
                },
              ),
              CustomInkWell(
                icon: Icons.favorite,
                text: 'Favoritos',
                onTap: () {
                  Navigator.pushNamed(context, Screens.favorite);
                },
              ), */
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: PrimaryButton(
                  text: 'Sair',
                  onPressed: () {
                    userStorage.clearUserCredentials();

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  color: kDetailColor,
                ),
              ),
            ],
          ),
        ));
  }
}
