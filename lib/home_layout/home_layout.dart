import 'package:flutter/material.dart';
import 'package:newsapplication/models/CategoryItemModel.dart';
import 'package:newsapplication/screens/CategoryDetails.dart';
import 'package:newsapplication/screens/categories.dart';
import 'package:newsapplication/screens/searchScreen.dart';

class HomeScreen extends StatefulWidget {
  static const homeRourte = 'HomeScreenRoute';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              child: AppBar(
                title: Text('Sports'),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, SearchScreen.routeNameSearchScreen);
                    },
                  )
                ],
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                      color: Colors.green
                  ),
                ),
              ),
            ),
            drawer: Drawer(
              child: Container(
                //margin: EdgeInsets.symmetric(vertical: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'News App',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      color: Colors.green,
                      width: double.infinity,
                      height: 120,
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.list,
                              size: 36,
                            ),
                            Text(
                              'Categories',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline3,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        selectedCategory = null;
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings,
                              size: 36,
                            ),
                            Text(
                              'Settings',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline3,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: selectedCategory == null
                ? Category(onCategoryClickCallback)
                : CategoryDetails(selectedCategory),
          ),
        ],
      ),
    );
  }

  CategoryItemModel selectedCategory = null;

  void onCategoryClickCallback(CategoryItemModel category) {
    print(category.name);
    selectedCategory = category;
    setState(() {});
  }
}
