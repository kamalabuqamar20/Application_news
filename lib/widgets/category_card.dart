import 'package:flutter/material.dart';
import 'package:news_app/models/categories_model.dart';


import '../pages/view_category.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoriesModel});
  final CategoriesModel categoriesModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ViewCategory(
                    category: categoriesModel.nameCategory,
                  )));
        },
        child: Container(
          width: 170,
          height: 140,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(categoriesModel.image), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(
            categoriesModel.nameCategory,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
