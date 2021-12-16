import 'package:flutter/material.dart';
import 'package:newsapplication/api/api_manager.dart';
import 'package:newsapplication/models/CategoryDetailsModel.dart';
import 'package:newsapplication/models/CategoryItemModel.dart';
import 'package:newsapplication/models/sources_response.dart';
import 'package:newsapplication/widgets/category_tabs.dart';

class CategoryDetails extends StatelessWidget {
  CategoryItemModel category;

  CategoryDetails(this.category);

  @override
  Widget build(BuildContext context) {
    var categoryDetailsModel;
    return FutureBuilder<NewsResponse>(
      future: ApiManager.apiLoadResources('sports'),
      builder: (context, snapshot) {
    if (snapshot.hasData) {
      return CategoryTabs(snapshot.data.sources ??[]);
    } else if (snapshot.hasError) {
      return Center(child: Text('${snapshot.error}'));
    }
    // By default, show a loading spinner.
    return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
