part of 'tab_bloc.dart';

@immutable
abstract class TabEvent {}

class OnTabChange extends TabEvent {
  final int selectedIndex;

  OnTabChange({required this.selectedIndex});
}


class StartLoading extends TabEvent{}