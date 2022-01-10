import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data_classes/Api_manager.dart';
import 'package:news_app/data_classes/Category.dart';
import 'package:news_app/data_classes/model/news_response.dart';
import 'package:news_app/ui/categories_details_screen.dart';
import 'package:news_app/ui/categories_screen.dart';

import 'newsItemWedget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/pattern.png',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Row(
              children: [
                IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: NewsSearch());
                  },
                  icon: Icon(Icons.search),
                ),
                Text('News App'),
              ],
            ),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  color: Theme.of(context).primaryColor,
                  width: double.infinity,
                  child: Text(
                    'News App',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      selectedCategory = null;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(11),
                    child: Row(
                      children: [
                        Icon(
                          Icons.list,
                          size: 28,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Categories',
                          style: Theme.of(context).textTheme.headline3,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(11),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 28,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Settings',
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: selectedCategory == null
              ? CategoriesScreen(onCategoryClickCallBack)
              : CategoryDetailsScreen(selectedCategory!),
        )
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryClickCallBack(Category category) {
    print(category.title);

    setState(() {
      selectedCategory = category;
    });
  }
}

class NewsSearch extends SearchDelegate {
  late Future<NewsResponse> newsResponse;

  NewsSearch() {
    newsResponse = ApiManager.loadNews(query: query);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            newsResponse = ApiManager.loadNews(query: query);
            showResults(context);
          },
          icon: Icon(Icons.search))
    ];
    // TODO: implement buildActions
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: FutureBuilder<NewsResponse>(
        future: newsResponse,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            //Todo:in case Error retry
            return Center(child: Text('${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (buildContext, index) {
              return NewsItemWedget(snapshot.data!.articles!.elementAt(index));
            },
            itemCount: snapshot.data?.articles?.length ?? 0,
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Text('Suggestions'),
    );
  }
}
