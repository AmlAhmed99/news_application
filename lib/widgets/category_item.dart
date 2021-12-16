
import 'package:flutter/material.dart';
import 'package:newsapplication/models/CategoryItemModel.dart';
import 'package:newsapplication/screens/categories.dart';

class CategoryItem extends StatelessWidget {
  CategoryItemModel category;
  int index;
  Function onCategoryClick;
  CategoryItem(this.category,this.index,this.onCategoryClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onCategoryClick(category);
      },
      child: Container(
        child: Column(
          children: [
            Container(
                child: Image.asset(category.categoryImage,height: 120,),
            ),
            Text(category.name)
          ],
        ),
        decoration: BoxDecoration(
            color: category.categoryColor,
            borderRadius: BorderRadius.only(
                topLeft:Radius.circular(20) ,
                topRight: Radius.circular(20),
                bottomLeft: index%2==0?Radius.circular(20):Radius.circular(0),
                bottomRight:index%2==0?Radius.circular(0):Radius.circular(20)
            )
        ),
      ),
    );
  }
}
