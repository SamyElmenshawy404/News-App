import 'package:flutter/material.dart';
import 'package:news_app/data_classes/Api_manager.dart';
import 'package:news_app/data_classes/model/news_response.dart';
import 'package:news_app/data_classes/model/sources_response.dart';
import 'package:news_app/ui/newsItemWedget.dart';

class NewsListItem extends StatefulWidget {
  Sources? sources;
  String? query;

  NewsListItem({this.sources, this.query});

  @override
  _NewsListItemState createState() => _NewsListItemState();
}

class _NewsListItemState extends State<NewsListItem> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          print('At the bottom');
        }
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.loadNews(
            sources: widget.sources?.id, query: widget.query),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            //Todo:in case Error retry
            return Center(child: Text('${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          }
          return ListView.builder(
            controller: scrollController,
            itemBuilder: (buildContext, index) {
              return NewsItemWedget(snapshot.data!.articles!.elementAt(index));
            },
            itemCount: snapshot.data?.articles?.length ?? 0,
          );
        },
      ),
    );
  }
}
