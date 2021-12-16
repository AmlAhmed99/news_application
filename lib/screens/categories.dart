
import 'package:flutter/material.dart';
import 'package:newsapplication/models/CategoryItemModel.dart';
import 'package:newsapplication/widgets/category_item.dart';

class Category extends StatelessWidget {
  var catgories=[
    CategoryItemModel("Sports",Colors.red,'assets/ball.png'),
    CategoryItemModel("Politics",Colors.blue[900],'assets/Politics.png'),
    CategoryItemModel("Health",Colors.pinkAccent,'assets/health.png'),
    CategoryItemModel("Business",Colors.orange,'assets/bussines.png'),
    CategoryItemModel("Environment",Colors.blue,'assets/environment.png'),
    CategoryItemModel("Science",Colors.yellow,'assets/science.png'),
  ];
  Function onCategoryClickCallback;
  Category(this.onCategoryClickCallback);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 150,
            child: Text('Pick Your category of interest',maxLines: 2,style: Theme.of(context).textTheme.headline3,),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10
                ),
                itemBuilder: (context,index)=>CategoryItem(catgories[index],index,
                    (category){
                      onCategoryClickCallback(category);
                    }),
                itemCount: catgories.length,

            ),
          ),
        ),
      ],
    );
  }
}
