
import 'package:flutter/material.dart';
import 'package:newsapplication/models/sources_response.dart';
import 'package:newsapplication/widgets/newsItem.dart';
import 'package:newsapplication/widgets/tabItems.dart';

class CategoryTabs extends StatefulWidget {

  List<Source> sources;
  CategoryTabs(this.sources);

  @override
  _CategoryTabsState createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: DefaultTabController(           
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources.map((e) => TabItem(
                e,
              selectedIndex==widget.sources.indexOf(e)
              )).toList(),
              onTap: (index){
                selectedIndex=index;
                setState(() {

                });
              },

            ),
            NewsItem(widget.sources[selectedIndex])
          ],
        ),
      ),
    );
  }
}
