part of 'description_bloc.dart';

abstract class DescriptionState extends Equatable {
  Article item;
  DescriptionState(this.item);
}

class DescriptionInitial extends DescriptionState {
  DescriptionInitial(super.item);

  @override
  List<Object> get props => [];
}

class DescriptionSucceedState extends DescriptionState{
  String message;
  DescriptionSucceedState(this.message,super.item);

  @override
  List<Object?> get props =>[message,item];
}
class DescriptionFailureState extends DescriptionState{
  String message;
  DescriptionFailureState(this.message,super.item);

  @override
  List<Object?> get props =>[message,item];
}
