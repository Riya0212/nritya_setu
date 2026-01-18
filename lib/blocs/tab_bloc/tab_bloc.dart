import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabState.initial()) {
    on<OnTabChange>(_onTabChanged);
  }

  Future<void> _onTabChanged(OnTabChange event, Emitter<TabState> emit) async {
    // Update selected tab
    emit(
      state.copyWith(
        selectedIndex: event.selectedIndex,
        isLoading: event.selectedIndex == 0,
      ),
    );

    // Simulate loading only for tab 0
    if (event.selectedIndex == 0) {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(isLoading: false));
    }
  }
}
