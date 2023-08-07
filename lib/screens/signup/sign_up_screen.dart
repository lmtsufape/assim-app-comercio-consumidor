import 'package:ecommerceassim/screens/signup/sign_up_controller.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/buttons/custom_text_button.dart';
import '../../components/buttons/primary_button.dart';
import '../../components/utils/vertical_spacer_box.dart';
import '../../shared/components/dialogs/default_alert_dialog.dart';
import '../../shared/constants/app_enums.dart';
import '../../shared/constants/app_number_constants.dart';
import '../../shared/core/navigator.dart';
import '../screens_index.dart';
import 'components/info_first_screen.dart';

import 'components/info_second_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    /**Declare this variable to get the Media Query of the screen in the current context */
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: kDetailColor,
          elevation: 0,
        ),
        backgroundColor: kDetailColor,
        body: Stack(
          children: [
            Container(
                width: size.width,
                margin: EdgeInsets.only(top: size.height * 0.15),
                padding: const EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    const VerticalSpacerBox(size: SpacerSize.huge),
                    Center(
                      child: Text(
                        //Esse infoIndex é o index do PageView que está no controller,
                        // ao clicar no botão próximo ele vai para o próximo index e a partr disso muda o texto
                        controller.infoIndex == 0 ? 'Cadastro' : 'Endereço',
                        style: kTitle2.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kSecondaryDarkColor),
                      ),
                    ),
                    const VerticalSpacerBox(size: SpacerSize.huge),
                    Form(
                      child: Column(
                          // Essa lista de children é para o PageView,
                          //cada index do PageView tem um children diferente que é um componente de cadastro diferente,
                          // cada um com seus campos
                          children: controller.infoIndex == 0
                              ? [
                                  InfoFirstScreen(controller),
                                ]
                              : [
                                  InfoSecondScreen(controller),
                                ]),
                    ),
                    const VerticalSpacerBox(size: SpacerSize.huge),
                    controller.screenState == ScreenState.loading
                        ? const CircularProgressIndicator()
                        : controller.infoIndex != 1
                            ? PrimaryButton(
                                text: 'Próximo',
                                onPressed: () {
                                  //Ele verifca a força da senha, se for menor que 1/2 ele não deixa ir para o próximo index
                                  //Importante adicionar depois uma lógica que deixe o botão cinza quando a senha for menor que 1/2
                                  controller.strength < 1 / 2
                                      ? () => null
                                      : controller.next();
                                },
                                color: kDetailColor,
                              )
                            : PrimaryButton(
                                text: 'Concluir',
                                onPressed: () {
                                  if (controller.validateEmptyFields() ==
                                      false) {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            DefaultAlertDialog(
                                              title: 'Erro',
                                              body: 'Preencha todos os campos',
                                              cancelText: 'Ok',
                                              confirmText: 'Ok',
                                              onConfirm: () => Get.back(),
                                              cancelColor: kErrorColor,
                                              confirmColor: kSuccessColor,
                                            ));
                                  } else if (controller.validateEmail() ==
                                      false) {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            DefaultAlertDialogOneButton(
                                              title: 'Erro',
                                              body: 'Digite um email válido',
                                              confirmText: 'Ok',
                                              onConfirm: () => Get.back(),
                                              buttonColor: kAlertColor,
                                            ));
                                  } else if (controller.validateNumber() ==
                                      false) {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            DefaultAlertDialogOneButton(
                                              title: 'Erro',
                                              body:
                                                  'Número de telefone inválido',
                                              confirmText: 'Ok',
                                              onConfirm: () => Get.back(),
                                              buttonColor: kAlertColor,
                                            ));
                                  } else {
                                    controller.signUp(context);
                                  }
                                },
                                color: kDetailColor,
                              ),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    controller.infoIndex != 0
                        ? Center(
                            child: CustomTextButton(
                                onPressed: () => controller.back(),
                                title: 'Anterior'),
                          )
                        : const SizedBox(),
                    SizedBox(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          controller.errorMessage != null
                              ? Text(
                                  controller.errorMessage!,
                                  style: kCaption1,
                                )
                              : const SizedBox(),
                          const VerticalSpacerBox(size: SpacerSize.small),
                          controller.infoIndex == 0
                              ? CustomTextButton(
                                  title: 'Já tenho conta',
                                  onPressed: () {
                                    navigatorKey.currentState!
                                        .pushReplacementNamed(Screens.signin);
                                  },
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Bem vindo(a) a ASSIM',
                    style: kTitle1.copyWith(color: kBackgroundColor),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.75,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
