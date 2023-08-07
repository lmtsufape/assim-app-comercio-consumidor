import 'package:ecommerceassim/screens/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceassim/components/utils/horizontal_spacer_box.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:provider/provider.dart';
import '../../components/utils/vertical_spacer_box.dart';
import '../../shared/components/dialogs/finish_dialog.dart';
import '../../shared/constants/app_enums.dart';
import '../screens_index.dart';

class SelectAdress extends StatelessWidget {
  const SelectAdress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
        create: (_) => ProfileController(),
        builder: (context, child) => Consumer<ProfileController>(
            builder: ((context, controller, child) =>  Scaffold(
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
                child: Column(children: [
              const VerticalSpacerBox(size: SpacerSize.small),
              const Row(
                children: [
                  Text(
                    'Selecionar um endereço de envio',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const VerticalSpacerBox(size: SpacerSize.large),
              InkWell(
                child: Row(
                  children: [
                    Container(
                      width: 440,
                      height: 285,
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
                      child: Wrap(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 35.0,
                                height: 55.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const Text(
                                'USADO RECENTEMENTE',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const FinishVisitDialog());
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: kTextButtonColor,
                                  ),
                                  iconSize: 30),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Row(
                              children: [
                                HorizontalSpacerBox(size: SpacerSize.large),
                                Text('Eduarda', style: TextStyle(fontSize: 17)),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Row(
                              children: [
                                HorizontalSpacerBox(size: SpacerSize.large),
                                Text('Rua Professora Esmeralda Barros, 67',
                                    style: TextStyle(fontSize: 17)),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Row(
                              children: [
                                HorizontalSpacerBox(size: SpacerSize.large),
                                Text('Apartamento',
                                    style: TextStyle(fontSize: 17)),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Row(
                              children: [
                                HorizontalSpacerBox(size: SpacerSize.large),
                                Text('Caruaru, PE, 55044-070',
                                    style: TextStyle(fontSize: 17)),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Row(
                              children: [
                                HorizontalSpacerBox(size: SpacerSize.large),
                                Text('Brasil', style: TextStyle(fontSize: 17)),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Row(
                              children: [
                                HorizontalSpacerBox(size: SpacerSize.large),
                                Text('Telefone: (81) 99699-7476',
                                    style: TextStyle(fontSize: 17)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Screens.adress);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(kDetailColor),
                                  ),
                                  child: const Text(
                                    'Editar',
                                    style: TextStyle(
                                        fontSize: 15, color: kOnSurfaceColor),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () async {},
              ),
              const VerticalSpacerBox(size: SpacerSize.medium),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 440,
                      height: 75,
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
                                Container(
                                  width: 35.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const Text(
                                  'Adicione um novo endereço',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: kTextButtonColor,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Screens.adress);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: kTextButtonColor,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, Screens.adress);
                },
              ),
            ])))))));
  }
}
