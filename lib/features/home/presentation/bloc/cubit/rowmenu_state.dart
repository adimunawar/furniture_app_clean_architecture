part of 'rowmenu_cubit.dart';

class RowmenuState extends Equatable {
  final int selectedindex;
  const RowmenuState({this.selectedindex = 0});

  @override
  List<Object> get props => [selectedindex];
}
