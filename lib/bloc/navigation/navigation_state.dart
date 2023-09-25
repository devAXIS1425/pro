part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();
}

class NavigationInitial extends NavigationState {
  @override
  List<Object> get props => [];
}


class NavigatorInitial extends NavigationState {
  const NavigatorInitial();

  @override
  List<Object> get props => [];
}

class NavigatorSucceedState extends NavigationState{
  final String message;
  final String id;
  const NavigatorSucceedState(this.message,this.id);
  @override
  List<Object?> get props => [message,id];
}

class NavigatorFailureState extends NavigationState{
  final String message;
  const NavigatorFailureState(this.message);
  @override
  List<Object?> get props => [message];
}

