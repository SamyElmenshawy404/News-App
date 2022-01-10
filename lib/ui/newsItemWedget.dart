import 'package:flutter/material.dart';
import 'package:news_app/data_classes/model/news_response.dart';

import 'news_details_screen.dart';

class NewsItemWedget extends StatelessWidget {
  News news;

  NewsItemWedget(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(NewsDetailsScreen.routeName, arguments: news);
      },
      child: Container(
        margin: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(news.urlToImage ?? '',
                  height: 200, fit: BoxFit.cover),
            ),
            Text(news.source?.name ?? ''),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                news.title ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              news.publishedAt ?? '',
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
