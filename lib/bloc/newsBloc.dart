import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/bloc/newsStates.dart';

class Newscubit extends Cubit<Appstates>{

  Newscubit() : super(Initialstate());

  static Newscubit get(context) => BlocProvider.of(context);
  String appLanguage='en';

  void changeLanguage(String newLanguage){
    if(appLanguage==newLanguage)
      return;
    appLanguage=newLanguage;
    emit(LanguageAppstate());
  }

}