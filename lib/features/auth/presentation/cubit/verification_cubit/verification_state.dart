part of 'verification_cubit.dart';

abstract class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object> get props => [];
}

class VerificationInitialState extends VerificationState {}

class VerificationLoadingState extends VerificationState {}

class VerificationLoadedState extends VerificationState {

}


class VerificationErrorState extends VerificationState {
  final String errorMsg;

  const VerificationErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
