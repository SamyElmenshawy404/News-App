import 'package:flutter/material.dart';
import 'package:news_app/data_classes/Category.dart';
import 'package:news_app/ui/item_category.dart';

class CategoriesScreen extends StatelessWidget {
  Function onClickCategoryCallBack;

  CategoriesScreen(this.onClickCategoryCallBack);

  List<Category> categories = [
    Category('categoryId', 'assets/images/ball.png', 'Sports',
        Color.fromARGB(255, 201, 28, 34)),
    Category('categoryId', 'assets/images/Politics.png', 'Politics',
        Color.fromARGB(255, 0, 62, 144)),
    Category('categoryId', 'assets/images/health.png', 'health',
        Color.fromARGB(255, 237, 30, 121)),
    Category('categoryId', 'assets/images/bussines.png', 'bussines',
        Color.fromARGB(255, 207, 126, 72)),
    Category('categoryId', 'assets/images/environment.png', 'environment',
        Color.fromARGB(255, 72, 130, 207)),
    Category('categoryId', 'assets/images/science.png', 'science',
        Color.fromARGB(255, 242, 211, 82)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Pick your category \nof interest',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemBuilder: (buildContext, index) {
                return ItemCategory(categories[index], index, (category) {
                  onClickCategoryCallBack(category);
                });
              },
              itemCount: categories.length),
        ))
      ],
    ));
  }
}
