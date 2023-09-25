part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  final List<Article> list;
  const MainState(this.list);
}

class MainInitial extends MainState {
  MainInitial(super.list);

  @override
  List<Object> get props => [];
}


class MainAllDataSuccessState extends MainState {
  final String message;

  const MainAllDataSuccessState( this.message,super.list);

  @override
  List<Object> get props => [message];
}

class MainAllReverstDataSuccessState extends MainState {
  final String message;

  const MainAllReverstDataSuccessState( this.message,super.list);

  @override
  List<Object> get props => [message];
}

class MainDataFailure extends MainState {
  final String message;
  const MainDataFailure( this.message,super.list);

  @override
  List<Object> get props => [message];
}

