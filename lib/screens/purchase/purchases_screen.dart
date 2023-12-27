import 'package:ecommerceassim/screens/home/components/custom_app_bar.dart';
import 'package:ecommerceassim/screens/profile/components/custom_order.dart';
import 'package:ecommerceassim/screens/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceassim/components/utils/horizontal_spacer_box.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:provider/provider.dart';
import '../../components/utils/vertical_spacer_box.dart';
import '../../shared/components/dialogs/finish_dialog.dart';
import '../../shared/constants/app_enums.dart';
import '../screens_index.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({Key? key}) : super(key: key);

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
        create: (_) => ProfileController(),
        builder: (context, child) => Consumer<ProfileController>(
            builder: ((context, controller, child) => Scaffold(
                appBar: const CustomAppBar(),
                endDrawer: buildCustomDrawer(context),
                body: Container(
                    color: kOnSurfaceColor,
                    width: size.width,
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      const VerticalSpacerBox(size: SpacerSize.small),
                      OrderCard(
                        orderNumber: '#0001',
                        sellerName: 'Frutas Mix',
                        itemsTotal: 55.34,
                        shippingHandling: 10.00,
                        date: '07/10/2022',
                        status: 'Em andamento',
                        onTap: () {
                          // Ação ao tocar no cardy
                        },
                      ),
                      const VerticalSpacerBox(size: SpacerSize.medium),
                      OrderCard(
                        orderNumber: '#0002',
                        sellerName: 'Legumes Mix',
                        itemsTotal: 21.65,
                        shippingHandling: 13.00,
                        date: '08/10/2022',
                        status: 'Entregue',
                        onTap: () {
                          // Ação ao tocar no cardy
                        },
                      ),
                      const VerticalSpacerBox(size: SpacerSize.medium),
                      OrderCard(
                        orderNumber: '#0003',
                        sellerName: 'Verduras Mix',
                        itemsTotal: 33.55,
                        shippingHandling: 15.00,
                        date: '09/10/2022',
                        status: 'Cancelado',
                        onTap: () {
                          // Ação ao tocar no cardy
                        },
                      ),
                      const VerticalSpacerBox(size: SpacerSize.medium),
                    ])))))));
  }
}
