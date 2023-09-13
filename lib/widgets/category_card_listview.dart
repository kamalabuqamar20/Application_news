import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_card.dart';

import '../models/categories_model.dart';

class CategoryCardListViwe extends StatelessWidget {
  const CategoryCardListViwe({
    super.key,
  });
  final List<CategoriesModel> caregory = const [
    CategoriesModel(image: 'assets/sports.avif', nameCategory: 'sports'),
    CategoriesModel(image: 'assets/science.avif', nameCategory: 'science'),
    CategoriesModel(image: 'assets/health.avif', nameCategory: 'health'),
    CategoriesModel(
        image: 'assets/technology.jpeg', nameCategory: 'technology'),
    CategoriesModel(
        image: 'assets/entertaiment.avif', nameCategory: 'entertainment'),
    CategoriesModel(image: 'assets/business.avif', nameCategory: 'business'),
    CategoriesModel(image: 'assets/general.avif', nameCategory: 'general'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: caregory.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            categoriesModel: caregory[index],
          );
        },
      ),
    );
  }
}
