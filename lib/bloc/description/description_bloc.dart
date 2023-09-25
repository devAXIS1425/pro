
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pro_connect_tz/main.dart';
import 'package:pro_connect_tz/repository/mock_new_repository.dart';
import 'package:pro_connect_tz/repository/models/article.dart';

part 'description_event.dart';
part 'description_state.dart';

class DescriptionBloc extends Bloc<DescriptionEvent, DescriptionState> {
  DescriptionBloc() : super(DescriptionInitial(ad)) {
    on<DescriptionDataEvent>(_getData);
  }

  void _getData(DescriptionDataEvent event,Emitter emit)async{
    try{
      final result = await MockNewsRepository().getArticle(event.id);
      emit(DescriptionSucceedState("Succeed", result));
    }catch(e){
      emit(DescriptionFailureState("Something error",state.item));
    }
  }
}
