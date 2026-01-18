part of 'tab_bloc.dart';

@immutable
class TabState {
  final int selectedIndex;
  final bool isLoading;

  const TabState({
    required this.selectedIndex,
    required this.isLoading,
  });

  factory TabState.initial() {
    return const TabState(
      selectedIndex: 0,
      isLoading: false,
    );
  }

  TabState copyWith({
    int? selectedIndex,
    bool? isLoading,
  }) {
    return TabState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
