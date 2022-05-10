import 'package:bloc/bloc.dart';
import 'package:e_furniture/features/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:e_furniture/utils/shared.dart';
import 'package:equatable/equatable.dart';

part 'app_level_event.dart';
part 'app_level_state.dart';

class AppLevelBloc extends Bloc<AppLevelEvent, AppLevelState> {
  final AuthLocalDatasource localDatasource;

  AppLevelBloc(this.localDatasource) : super(AppLevelIntial()) {
    on<AppStarted>((event, emit) async {
      emit(AppLevelIntial());
      await Future.delayed(const Duration(milliseconds: 900));
      //Check if user has entered for first time
      final bool isFirstTime = await localDatasource.isFirstTime();
      if (isFirstTime) {
        emit(AppFirstTime());
      } else {
        //check if user has token or not
        final String token = await localDatasource.getAuthToken();
        if (token.isNotEmpty) {
          appToken = token;
          emit(AppLevelAuthenticated());
        } else {
          emit(AppLevelUnauthenticated());
        }
      }
    });

    on<SetAuthenticated>(((event, emit) {
      add(AppStarted());
    }));
    on<SetUnauthenticated>(((event, emit) {
      //delete token
      localDatasource.setAuthToken('');
      //remove headers
      appToken = null;
      emit(AppLevelUnauthenticated());
    }));
    on<SetIsFirstTime>(((event, emit) async {
      await localDatasource.setIsFirstTime();
      add(AppStarted());
    }));
  }
}
