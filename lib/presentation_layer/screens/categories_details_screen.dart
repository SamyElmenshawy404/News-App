import 'package:flutter/material.dart';
import 'package:news_app/data_layer/model/Category.dart';
import 'package:news_app/presentation_layer/widgets/category_tebs_controlers.dart';

import '../../data_layer/Api_manager.dart';
import '../../data_layer/model/sources_response.dart';

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
