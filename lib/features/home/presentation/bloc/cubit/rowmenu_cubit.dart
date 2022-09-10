import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rowmenu_state.dart';

class RowmenuCubit extends Cubit<RowmenuState> {
  RowmenuCubit() : super(const RowmenuState(selectedindex: 0));

  void onTapmenu(int index) {
    return emit(RowmenuState(selectedindex: index));
  }
}
