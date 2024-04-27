import 'package:ecommerceassim/assets/index.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';

class CategoryMenu extends StatelessWidget {
  final String categoryName;
  final String assetPath;
  final VoidCallback onTap;

  const CategoryMenu({
    super.key,
    required this.categoryName,
    required this.assetPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 75,
        height: 70,
        decoration: BoxDecoration(
          color: kDetailColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: kTextButtonColor.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 3,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Image.asset(
                assetPath,
                fit: BoxFit.cover,
                height: categoryName == "Mel" ? 25 : 30,
                color: Colors.white,
              ),
            ),
            if (categoryName != "Plantas/Ervas Medicinais" &&
                categoryName != "Polpa de Frutas" &&
                categoryName != "Produtos Beneficiados")
              const Padding(padding: EdgeInsets.only(top: 12.0)),
            if (categoryName == "Polpa de Frutas" ||
                categoryName == "Produtos Beneficiados")
              const Padding(padding: EdgeInsets.only(top: 4.0)),
            Text(
              categoryName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryMenuList extends StatelessWidget {
  const CategoryMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {"categoryName": "Mel", "assetPath": Assets.mel},
      {"categoryName": "Legumes", "assetPath": Assets.vegetais},
      {"categoryName": "Polpa de Frutas", "assetPath": Assets.polpa},
      {"categoryName": "Grãos", "assetPath": Assets.graos},
      {"categoryName": "Verduras", "assetPath": Assets.folhosos},
      {"categoryName": "Raízes", "assetPath": Assets.raizes},
      {"categoryName": "Frutas", "assetPath": Assets.frutas},
      {
        "categoryName": "Produtos Beneficiados",
        "assetPath": Assets.beneficiados
      },
      {
        "categoryName": "Plantas/Ervas Medicinais",
        "assetPath": Assets.medicinal
      },
    ];

    void handleCategoryTap(String categoryName) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Produtos da categoria de $categoryName'),
          duration: const Duration(seconds: 1),
        ),
      );
    }

    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 22.0 : 0, right: 10.0),
            child: CategoryMenu(
              categoryName: categories[index]["categoryName"]!,
              assetPath: categories[index]["assetPath"]!,
              onTap: () =>
                  handleCategoryTap(categories[index]["categoryName"]!),
            ),
          );
        },
      ),
    );
  }
}
