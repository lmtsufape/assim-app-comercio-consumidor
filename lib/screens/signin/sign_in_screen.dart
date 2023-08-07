import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/shared/components/style_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerceassim/components/buttons/custom_text_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecommerceassim/components/buttons/primary_button.dart';
import 'package:ecommerceassim/components/forms/custom_text_form_field.dart';
import 'package:ecommerceassim/components/utils/vertical_spacer_box.dart';
import 'package:ecommerceassim/screens/signin/sign_in_controller.dart';
import 'package:ecommerceassim/shared/constants/app_number_constants.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import '../../shared/constants/app_enums.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**Declare this variable to get the Media Query of the screen in the current context */
    Size size = MediaQuery.of(context).size;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SignInController()),
        ],
        builder: (context, child) {
          return Consumer<SignInController>(
            builder: (context, controller, child) => Scaffold(
              appBar: const PreferredSize(
                  preferredSize: Size.fromHeight(360),
                  child: StyleBar(
                      title: 'Bem vindo(a) a ASSIM', hasLeading: true)),
              body: Container(
                color: kOnSurfaceColor,
                width: size.width,
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Center(
                      child: Text(
                        'Entrar',
                        style: kTitle.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const VerticalSpacerBox(size: SpacerSize.huge),
                    CustomTextFormField(
                      hintText: 'E-mail',
                      icon: Icons.email,
                      controller: controller.emailController,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    CustomTextFormField(
                      hintText: 'Senha',
                      isPassword: true,
                      icon: Icons.lock,
                      controller: controller.passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                          title: 'Esqueceu a senha?',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    controller.status == SignInStatus.loading
                        ? const CircularProgressIndicator()
                        : PrimaryButton(
                            text: 'Entrar',
                            onPressed: () => controller.signIn(context),
                            color: kDetailColor,
                          ),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(
                          color: kTextButtonColor,
                        ),
                        Text('ou'),
                        Divider(
                          color: kTextButtonColor,
                        ),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.google,
                                color: kErrorColor),
                            iconSize: 38),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.facebook,
                                color: kTextSign),
                            iconSize: 38)
                      ],
                    ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Não possui conta?'),
                              CustomTextButton(
                                title: 'Crie aqui',
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Screens.register);
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
        });
  }
}
