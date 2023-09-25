import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pro_connect_tz/repository/mock_new_repository.dart';
import 'package:pro_connect_tz/repository/models/article.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial(const [])) {
    on<MainAllDataEvent>(_getLatest);
    on<MainAllReverstDataEvent>(_getFalure);
  }

  ///1
  void _getLatest(MainAllDataEvent event ,Emitter emit)async{
    try{
      final result = await MockNewsRepository().getLatestArticles();
      if(result.isNotEmpty){
        emit( MainAllDataSuccessState("Succeed",result));
      }
    }catch(e){
      emit( MainDataFailure("Something error",state.list));
    }
  }

  ///2
  void _getFalure(MainAllReverstDataEvent event ,Emitter emit)async{
    try{
      final result = await MockNewsRepository().getFeaturedArticles();
      if(result.isNotEmpty){
        emit(MainAllReverstDataSuccessState("Succeed",result));
      }
    }catch(e){
      emit( MainDataFailure("Something error",state.list));
    }
  }


}
