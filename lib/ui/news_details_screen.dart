import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data_classes/model/news_response.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'details';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Text(news.source?.name ?? ''),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
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
              padding: const EdgeInsets.symmetric(vertical: 12.0),
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
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Text(
                news.content ?? '',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                launchURL(news.url ?? '');
              },
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('view full article',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  Icon(
                    Icons.arrow_right,
                    size: 25,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
