import 'package:flutter/material.dart';
import 'package:newsapplication/widgets/ShowLanguageItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingScreen extends StatelessWidget {
  static const SettingScreenRourte = 'SettingScreenRoute';
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
                title: Text(AppLocalizations.of(context).app_title),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                      color: Colors.green
                  ),
                ),
              ),
            ),
            body: Center(child: ShowLanguageItem()),
          ),
        ],
      ),
    );
  }
}
