import 'package:bloc/bloc.dart';
import 'package:e_furniture/features/authentication/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  AuthenticationBloc(this.authRepository) : super(AuthenticationInitial()) {
    on<LoginUserWithUsername>((event, emit) async {
      emit(AuthenticationLoading());
      Future.delayed(
        const Duration(seconds: 15),
      );
      final tokenOrFailure = await authRepository.loginUserWithUsernamePassword(
          event.username!, event.password!);
      tokenOrFailure.fold(
          (failure) => emit(AuthenticationFailure(errorHandler: failure)),
          (token) => emit(AuthenticatedUser()));
    });

    on<RegisterUserWithEmail>(((event, emit) async {
      emit(AuthenticationLoading());
      final tokenOrFailure = await authRepository.createUser(
          event.name!, event.email!, event.password!);

      tokenOrFailure.fold(
          (failure) => emit(AuthenticationFailure(errorHandler: failure)),
          (token) => emit(AuthenticatedUser()));
    }));
  }
}
