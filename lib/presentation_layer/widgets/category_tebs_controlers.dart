import 'package:flutter/material.dart';
import 'package:news_app/data_layer/model/sources_response.dart';
import 'package:news_app/presentation_layer/widgets/NewsListWedget.dart';
import 'package:news_app/presentation_layer/widgets/TabItem.dart';

class CategoryTabs extends StatefulWidget {
  List<Sources> sources;

  CategoryTabs(this.sources);

  @override
  _CategoryTabsState createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        initialIndex: 0,
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
                labelPadding: EdgeInsets.all(8),
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                tabs: widget.sources
                    .map((element) => TabItem(element,
                        selectedIndex == widget.sources.indexOf(element)))
                    .toList()),
            NewsListItem(sources: widget.sources[selectedIndex])
          ],
        ),
      ),
    );
  }
}
