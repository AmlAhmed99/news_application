
import 'package:flutter/material.dart';
import 'package:newsapplication/models/news_response.dart';

class NewsItemWidget extends StatelessWidget {
  News news;

  NewsItemWidget(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              news.urlToImage ?? "",
              fit: BoxFit.cover,
              height: 200,
            ),

          ),
          Text(news.source?.name ?? ""),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              news.title ?? "",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Text(
            news.publishedAt ?? "",
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
