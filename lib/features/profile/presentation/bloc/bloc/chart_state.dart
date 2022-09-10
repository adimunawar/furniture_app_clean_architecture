part of 'chart_bloc.dart';

abstract class ChartState extends Equatable {
  const ChartState();
  
  @override
  List<Object> get props => [];
}

class ChartInitial extends ChartState {}
