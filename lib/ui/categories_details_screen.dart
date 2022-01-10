import 'package:flutter/material.dart';
import 'package:news_app/data_classes/Api_manager.dart';
import 'package:news_app/data_classes/Category.dart';
import 'package:news_app/data_classes/model/sources_response.dart';
import 'package:news_app/ui/category_tebs_controlers.dart';

class CategoryDetailsScreen extends StatelessWidget {
  Category category;

  CategoryDetailsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SourcesResponse>(
        future: ApiManager.loadNewsSources(category.title),
        builder:
            (BuildContext? context, AsyncSnapshot<SourcesResponse> snapshot) {
          if (snapshot.hasError) {
            print('in error');
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            print('in data');
            return CategoryTabs(snapshot.data?.sources ?? []);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('in waiting');
            return Center(child: const CircularProgressIndicator());
          }
          throw Exception('there is a null ');
        },
      ),
    );
  }
}
