import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapplication/models/news_response.dart';
import 'package:newsapplication/models/sources_response.dart';

class ApiManager{
  static const apiKey='89423196335a4d09b93fef14b515f1f7';
   static Future<NewsResponse> apiLoadResources(String category) async{
    var parametars={
      'apiKey':apiKey,
      'category':category
    };
    var uri=Uri.https("newsapi.org", "/v2/top-headlines/sources",parametars);

    var response= await http.get(uri);
    var sourcesResponce=NewsResponse.fromJson(jsonDecode(response.body));
    if(response.statusCode==200)
      {

        return sourcesResponce;
      }
    else{
      if(sourcesResponce.message!=null)
        throw Exception(sourcesResponce.message);
      else throw Exception("error loading news sources");
    }


  }

  static Future<News_response> apiLoadNews({String sources,String query}) async{
    var parametars={
      'apiKey':apiKey,
      'sources':sources,
      'qInTitle':query
    };
    var uri=Uri.https("newsapi.org", "/v2/everything",parametars);

    var response= await http.get(uri);
    var sourcesResponce=News_response.fromJson(jsonDecode(response.body));
    if(response.statusCode==200)
    {

      return sourcesResponce;
    }
    else{
      if(sourcesResponce.message!=null)
        throw Exception(sourcesResponce.message);
      else throw Exception("error loading news sources");
    }


  }
}
