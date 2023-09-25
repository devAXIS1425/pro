part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {

  const MainEvent();
}

class MainAllDataEvent extends MainEvent{

  @override
  List<Object?> get props =>[];
}

class MainAllReverstDataEvent extends MainEvent{

  @override
  List<Object?> get props =>[];
}



