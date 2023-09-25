import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pro_connect_tz/repository/mock_new_repository.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationDataEvent>(_getData);
  }

  void _getData(NavigationDataEvent event, Emitter emit)async{
    try{
      final result = await MockNewsRepository().getArticle(event.id);
      emit(NavigatorSucceedState("Succeed", event.id));
    }catch(e){
      emit(const NavigatorFailureState("Something error"));
    }
  }
}
