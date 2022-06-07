import 'package:flutter/material.dart';
import 'package:news_app/data_layer/model/Category.dart';

class ItemCategory extends StatelessWidget {
  int index;
  Category category;
  Function onCategoryClick;

  ItemCategory(this.category, this.index, this.onCategoryClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategoryClick(category);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: category.backGround,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(index % 2 == 0 ? 0 : 20),
              bottomRight: Radius.circular(index % 2 == 0 ? 20 : 0),
            )),
        child: Column(
          children: [
            Image.asset(
              category.imagePath,
              height: 120,
            ),
            Text(
              category.title,
              style: Theme.of(context).textTheme.headline2,
            )
          ],
        ),
      ),
    );
  }
}
