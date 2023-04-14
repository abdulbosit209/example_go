import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tabs_state.dart';

class TabsCubit extends Cubit<TabsState> {
  TabsCubit() : super(const TabsState(currentPage: 0));

  void changeTabState(int changedIndex){
    emit(state.copyWith(currentPage: changedIndex));
  }
}
