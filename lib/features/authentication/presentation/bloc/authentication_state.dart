part of 'authentication_bloc.dart';

enum CategoryStatus { initial, success, failure, loading, selected }

extension CategoryStatusX on CategoryStatus {
  bool get isInitial => this == CategoryStatus.initial;
  bool get isSuccess => this == CategoryStatus.success;
  bool get isError => this == CategoryStatus.failure;
  bool get isLoading => this == CategoryStatus.loading;
  bool get isSelected => this == CategoryStatus.selected;
}

class AuthenticationState extends Equatable {
  final Failure? errorHandler;
  final CategoryStatus? status;
  const AuthenticationState(
      {this.errorHandler, this.status = CategoryStatus.initial});

  @override
  List<Object> get props => [status!];

  AuthenticationState copyWith({
    final Failure? errorHandler,
    final CategoryStatus? status,
  }) {
    return AuthenticationState(
        status: status ?? this.status,
        errorHandler: errorHandler ?? this.errorHandler);
  }
}

// class AuthenticationInitial extends AuthenticationState {}

// class AuthenticationLoading extends AuthenticationState {}

// class AuthenticationFailure extends AuthenticationState {
//   final Failure? errorHandler;

//   const AuthenticationFailure({this.errorHandler});
// }

// class AuthenticatedUser extends AuthenticationState {}
