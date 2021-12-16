
import 'package:flutter/material.dart';
import 'package:newsapplication/api/api_manager.dart';
import 'package:newsapplication/models/news_response.dart';
import 'package:newsapplication/models/sources_response.dart';
import 'package:newsapplication/widgets/news_item_widget.dart';

class NewsItem extends StatelessWidget {
  Source selectedSources;
  NewsItem([this.selectedSources]);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: FutureBuilder<News_response>(
        future: ApiManager.apiLoadNews(sources: selectedSources.id,),
        builder:(context,snapshot){
          if(snapshot.hasError)
            {
              print('error ${snapshot.error.toString()}');
              return Center(child: Text(snapshot.error.toString()));
            }
          else if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator());
            }
          return ListView.builder(
            itemCount:snapshot.data.articles.length ,
              itemBuilder: (context,index){
            return NewsItemWidget(snapshot.data.articles.elementAt(index));
          });



        } ,
      ),
    );
  }
}
