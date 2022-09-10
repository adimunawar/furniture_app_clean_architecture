import 'package:bloc/bloc.dart';
import 'package:e_furniture/features/authentication/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  AuthenticationBloc(this.authRepository) : super(const AuthenticationState()) {
    on<LoginUserWithUsername>(_onLogin);
    on<RegisterUserWithEmail>(_onRegister);
  }

  Future<void> _onLogin(
    LoginUserWithUsername event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    Future.delayed(const Duration(milliseconds: 4500));
    final tokenOrFailure = await authRepository.loginUserWithUsernamePassword(
        event.username!, event.password!);
    tokenOrFailure.fold(
        (failure) => emit(state.copyWith(status: CategoryStatus.success)),
        // (failure) => emit(state.copyWith(
        //     status: CategoryStatus.failure, errorHandler: failure)),
        (token) => emit(state.copyWith(status: CategoryStatus.success)));
  }

  Future<void> _onRegister(
    RegisterUserWithEmail event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    final tokenOrFailure = await authRepository.createUser(
        event.name!, event.email!, event.password!);
    tokenOrFailure.fold(
        (failure) => emit(state.copyWith(
            status: CategoryStatus.failure, errorHandler: failure)),
        (token) => emit(state.copyWith(status: CategoryStatus.success)));
    ;
  }
}
