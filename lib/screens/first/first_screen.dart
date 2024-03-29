import 'package:ecommerceassim/components/buttons/custom_text_button.dart';
import 'package:ecommerceassim/components/buttons/primary_button.dart';
import 'package:ecommerceassim/components/utils/vertical_spacer_box.dart';
import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/shared/core/controllers/sign_in_controller.dart';
import 'package:ecommerceassim/shared/components/style_bar.dart';
import 'package:ecommerceassim/shared/constants/app_enums.dart';
import 'package:ecommerceassim/shared/constants/app_number_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:provider/provider.dart';
import '../../shared/constants/style_constants.dart';
import './first_controller.dart';

class FirstScreen extends StatelessWidget {
  final String? displayName;
  final FirstController? controller;
  const FirstScreen({super.key, this.displayName, this.controller});

  @override
  Widget build(BuildContext context) {
    /**Declare this variable to get the Media Query of the screen in the current context */
    Size size = MediaQuery.of(context).size;
    final String? displayName =
        ModalRoute.of(context)?.settings.arguments as String?;

    final String buttonText = displayName != null
        ? 'Continuar como $displayName'
        : 'Continuar como convidado';

    return GetBuilder<FirstController>(
      init: FirstController(),
      builder: (controller) => Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(320),
            child: StyleBar(
              title: 'Eba, que bom que você voltou!',
              hasLeading: false,
            )),
        body: Container(
          color: kOnSurfaceColor,
          width: size.width,
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Wrap(
                children: [
                  Text(
                    'Para começar, que tal entrar com sua conta?',
                    style: TextStyle(fontSize: 23, color: kTextFirst),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Spacer(),
              //controller.status == SignInStatus.loading
              //? const CircularProgressIndicator()
              PrimaryButton(
                text: "Continuar como ${controller.userName}",
                onPressed: () {},
                color: kDetailColor,
              ),

              const VerticalSpacerBox(size: SpacerSize.large),
              PrimaryButton(
                text: 'Não sou ${controller.userName}',
                onPressed: () {
                  Navigator.pushNamed(context, Screens.signin);
                },
                color: kTextButtonColor,
              ),
              SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /*controller.errorMessage != null
                              ? Text(
                                  controller.errorMessage!,
                                  style: kCaption1,
                                )*/
                    const SizedBox(),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    CustomTextButton(
                      title: 'Continuar como convidado',
                      onPressed: () {
                        Navigator.pushNamed(context, Screens.home);
                      },
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Não possui conta?'),
                        CustomTextButton(
                          title: 'Crie aqui',
                          onPressed: () {
                            Navigator.pushNamed(context, Screens.register);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
