
import 'package:flutter/material.dart';
import 'package:newsapplication/models/CategoryItemModel.dart';
import 'package:newsapplication/widgets/category_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Category extends StatelessWidget {
  Function onCategoryClickCallback;
  Category(this.onCategoryClickCallback);
  @override
  Widget build(BuildContext context) {
    var catgories=[
      CategoryItemModel(AppLocalizations.of(context).sports,Colors.red,'assets/ball.png'),
      CategoryItemModel(AppLocalizations.of(context).politics,Colors.blue[900],'assets/Politics.png'),
      CategoryItemModel(AppLocalizations.of(context).health,Colors.pinkAccent,'assets/health.png'),
      CategoryItemModel(AppLocalizations.of(context).business,Colors.orange,'assets/bussines.png'),
      CategoryItemModel(AppLocalizations.of(context).environment,Colors.blue,'assets/environment.png'),
      CategoryItemModel(AppLocalizations.of(context).science,Colors.yellow,'assets/science.png'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 150,
            child: Text(AppLocalizations.of(context).pick,maxLines: 2,style: Theme.of(context).textTheme.headline3,),
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
