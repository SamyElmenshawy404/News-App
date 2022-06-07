import 'package:flutter/material.dart';
import 'package:news_app/my_theme_date.dart';
import 'package:news_app/presentation_layer/screens/HomeScreen.dart';
import 'package:news_app/presentation_layer/widgets/news_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeDate.lightTheme,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
