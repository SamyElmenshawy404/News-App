import 'package:flutter/material.dart';
import 'package:news_app/data_classes/model/sources_response.dart';

class TabItem extends StatelessWidget {
  Sources sources;
  bool isSelected;

  TabItem(this.sources, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
      ),
      child: Text(
        sources.name ?? '',
        style: TextStyle(
            color: isSelected ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
