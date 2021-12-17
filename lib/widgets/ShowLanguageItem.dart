
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newsapplication/bloc/newsBloc.dart';
import 'package:newsapplication/bloc/newsStates.dart';
class ShowLanguageItem extends StatefulWidget {

  @override
  _ShowLanguageItemState createState() => _ShowLanguageItemState();
}

class _ShowLanguageItemState extends State<ShowLanguageItem> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>Newscubit(),
      child:BlocConsumer<Newscubit,Appstates>(
        listener: (context,state){},
        builder:(context,state) {

     return InkWell(
      child: Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(AppLocalizations.of(context).languages,style:TextStyle(
      color:Colors.black,
      fontSize: 20
      ),),
      Icon(Icons.arrow_drop_down)
      ],
      ),
      )),
      onTap: () {
      showLanguageButtomSheet(AppLocalizations.of(context).english,AppLocalizations.of(context).arabic);
      },
      );
        },
      )
    );
  }

  void showLanguageButtomSheet(text1,text2){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            child: ConditionalBuilder(condition: Newscubit.get(context).appLanguage=='en' ,
                builder: (context){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  selectedItem(text1,'en'),
                   unSelectedItem(text2,'ar')
                ],
              );
                },
              fallback: (context){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  selectedItem(text2,'ar'),
                   unSelectedItem(text1,'en')
                ],
              );
              } ,
            ),
          );
        }
    );
  }

  Widget selectedItem(text1,lang){
    return Row(
      children: [
        TextButton(
          onPressed: (){
            Newscubit.get(context).changeLanguage(lang);
          },
          child: Text(text1,style: TextStyle(
            color: Colors.green,
          ),),
        ),
        Icon(Icons.check,color: Colors.green),
      ],
    );
  }

  Widget unSelectedItem(text2,lang){
    return TextButton(
      onPressed: (){
        Newscubit.get(context).changeLanguage(lang);
      },
      child: Text(text2,style: TextStyle(
        color: Colors.black,
      ),),
    );
  }
}
