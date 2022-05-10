part of 'app_level_bloc.dart';

abstract class AppLevelEvent extends Equatable {
  const AppLevelEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AppLevelEvent {}

class SetAuthenticated extends AppLevelEvent {}

class SetUnauthenticated extends AppLevelEvent {}

class SetIsFirstTime extends AppLevelEvent {}

class SetTokenToDefaultHeaders extends AppLevelEvent {
  final String token;

  const SetTokenToDefaultHeaders({required this.token});

  @override
  List<Object> get props => [token];
}
