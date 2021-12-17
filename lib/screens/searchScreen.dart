
import 'package:flutter/material.dart';
import 'package:newsapplication/api/api_manager.dart';
import 'package:newsapplication/models/news_response.dart';
import 'package:newsapplication/widgets/news_item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SearchScreen extends StatefulWidget {
  static const routeNameSearchScreen='routeNameSearchScreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Image.asset(
              'assets/pattern.png',
              fit: BoxFit.cover,
            ),
            height: double.infinity,
            width: double.infinity,
          ),
          Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(80.0),
                child:AppBar(
                  title:TextField(

                    onChanged: (q){
                         query=q;
                         setState(() {

                         });
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                        Icons.search,
                        color: Colors.green,
                      ),),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.green),
                      hintText:AppLocalizations.of(context).search,
                      fillColor: Colors.white,
                    ),
                  ),
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                        color: Colors.green
                    ),
                  ),
                )),
          body:FutureBuilder<News_response>(
            future:  ApiManager.apiLoadNews(query:query),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount:snapshot.data.articles.length ,
                    itemBuilder: (context,index) {
                      return NewsItemWidget(snapshot.data.articles[index]);
                    }
                );

              } else if (snapshot.hasError) {
                return Center(child: Text('Empty items'));
              }
              // By default, show a loading spinner.
              return Center(child: const CircularProgressIndicator());
            },
          ),
          ),
        ],
      ),
    );
  }

}
