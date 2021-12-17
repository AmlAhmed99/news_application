import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapplication/bloc/newsBloc.dart';
import 'package:newsapplication/bloc/newsStates.dart';
import 'package:newsapplication/home_layout/home_layout.dart';
import 'package:newsapplication/screens/searchScreen.dart';
import 'package:newsapplication/screens/settingScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>Newscubit(),
      child: BlocConsumer<Newscubit,Appstates>(
        listener: (context,state){},
        builder:(context,state){
          return MaterialApp(
            routes: {
              HomeScreen.homeRourte:(context)=>HomeScreen(),
              SearchScreen.routeNameSearchScreen:(context)=>SearchScreen(),
              SettingScreen.SettingScreenRourte:(context)=>SettingScreen(),
            },
            initialRoute:HomeScreen.homeRourte,
            theme: ThemeData(
              primaryColor: Colors.green,
              scaffoldBackgroundColor: Colors.transparent,
              appBarTheme: AppBarTheme(
                elevation: 0,
                color: Colors.transparent,
                centerTitle: true,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.green,
                    statusBarIconBrightness: Brightness.light
                ),

              ),
              textTheme: TextTheme(
                headline4: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                ),
                headline3: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                ),
              ),

            ),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales:AppLocalizations.supportedLocales,
            locale: Locale(Newscubit.get(context).appLanguage),
          );
        } ,

      ),
    );
  }
}

