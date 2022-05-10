part of 'app_level_bloc.dart';

abstract class AppLevelState extends Equatable {
  const AppLevelState();

  @override
  List<Object> get props => [];
}

class AppLevelIntial extends AppLevelState {}

class AppLevelAuthenticated extends AppLevelState {}

class AppLevelUnauthenticated extends AppLevelState {}

class AppFirstTime extends AppLevelState {}
