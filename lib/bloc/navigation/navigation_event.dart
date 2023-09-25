part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}
class NavigationDataEvent extends NavigationEvent{
  final String id;
  const NavigationDataEvent(this.id);
  @override
  List<Object?> get props => [id];
}