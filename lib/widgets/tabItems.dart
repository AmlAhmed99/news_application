
import 'package:flutter/material.dart';
import 'package:newsapplication/models/sources_response.dart';

class TabItem extends StatelessWidget {
  Source sources;
  bool isSelected;

  TabItem(this.sources, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected? Colors.green:Colors.transparent,
         borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.green,
          width: 2
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(sources.name,style: TextStyle(
          color: isSelected?Colors.white:Colors.green,
          fontSize: 18
        ),),
      ),
    );
  }
}
