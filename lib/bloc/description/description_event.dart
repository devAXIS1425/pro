part of 'description_bloc.dart';

abstract class DescriptionEvent extends Equatable {

  DescriptionEvent();
}

class DescriptionDataEvent extends DescriptionEvent{
  String id;
  DescriptionDataEvent(this.id);

  @override
  List<Object?> get props => [id];
}
