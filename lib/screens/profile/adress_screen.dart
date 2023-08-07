import 'package:flutter/material.dart';
import 'package:ecommerceassim/components/forms/auth_form_field.dart';
import 'package:ecommerceassim/components/forms/auth_form_field3.dart';
import 'package:ecommerceassim/components/utils/horizontal_spacer_box.dart';
import 'package:ecommerceassim/screens/screens_index.dart';

import '../../components/buttons/primary_button.dart';
import '../../components/forms/auth_form_field2.dart';
import '../../components/utils/vertical_spacer_box.dart';
import '../../shared/constants/app_enums.dart';
import '../../shared/constants/style_constants.dart';

class AdressScreen extends StatefulWidget {
  const AdressScreen({Key? key}) : super(key: key);

  @override
  State<AdressScreen> createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            onPressed: () {
              Navigator.pushNamed(context, Screens.profile);
            },
          ), //IconButton
        ],
        //IconButton
      ),
      body: Container(
          color: kOnSurfaceColor,
          width: size.width,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const VerticalSpacerBox(size: SpacerSize.small),
                const Row(
                  children: [
                    Text(
                      'Adicione um novo endereço',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const VerticalSpacerBox(size: SpacerSize.large),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                        child: Column(children: [
                      const Row(
                        children: [
                          Text(
                            'Nome',
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      AuthFormField(
                          label: '',
                          isPassword: false,
                          inputType: TextInputType.streetAddress,
                          onChanged: (String value) {}),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      const Row(
                        children: [
                          Text(
                            'Rua',
                          ),
                          Spacer(),
                          Text(
                            'Número',
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      Row(
                        children: [
                          AuthFormField3(
                              label: '',
                              isPassword: false,
                              inputType: TextInputType.streetAddress,
                              onChanged: (String value) {}),
                          const HorizontalSpacerBox(size: SpacerSize.small),
                          AuthFormField2(
                              label: '',
                              isPassword: false,
                              inputType: TextInputType.streetAddress,
                              onChanged: (String value) {}),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      const Row(
                        children: [
                          Text(
                            'Cidade',
                          ),
                          Spacer(),
                          Text(
                            'Estado',
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      Row(
                        children: [
                          AuthFormField3(
                              label: '',
                              isPassword: false,
                              inputType: TextInputType.streetAddress,
                              onChanged: (String value) {}),
                          const HorizontalSpacerBox(size: SpacerSize.small),
                          AuthFormField2(
                              label: '',
                              isPassword: false,
                              inputType: TextInputType.streetAddress,
                              onChanged: (String value) {}),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      const Row(
                        children: [
                          Text(
                            'Complemento',
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      AuthFormField(
                          label: '',
                          isPassword: false,
                          inputType: TextInputType.text,
                          onChanged: (String value) {}),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      const Row(
                        children: [
                          Text(
                            'CEP',
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: AuthFormField3(
                            label: '',
                            isPassword: false,
                            inputType: TextInputType.number,
                            onChanged: (String value) {}),
                      ),
                      const VerticalSpacerBox(size: SpacerSize.large),
                      const VerticalSpacerBox(size: SpacerSize.large),
                      const VerticalSpacerBox(size: SpacerSize.large),
                      const VerticalSpacerBox(size: SpacerSize.large),
                      const VerticalSpacerBox(size: SpacerSize.large),
                      const VerticalSpacerBox(size: SpacerSize.large),
                      const VerticalSpacerBox(size: SpacerSize.large),
                      const VerticalSpacerBox(size: SpacerSize.large),
                      PrimaryButton(
                        text: 'Salvar',
                        onPressed: () {
                          Navigator.pushNamed(context, Screens.selectAdress);
                        },
                        color: kDetailColor,
                      ),
                    ])))
              ],
            ),
          )),
    );
  }
}
