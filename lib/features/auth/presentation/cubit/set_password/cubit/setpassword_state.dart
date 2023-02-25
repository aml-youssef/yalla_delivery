part of 'setpassword_cubit.dart';

abstract class SetpasswordState extends Equatable {
  const SetpasswordState();

  @override
  List<Object> get props => [];
}

class SetpasswordInitial extends SetpasswordState {}

class SetpasswordLoadedState extends SetpasswordState {
  final ResetAfterForget resetAfterForget;

  const SetpasswordLoadedState({required this.resetAfterForget});
  @override
  List<Object> get props => [resetAfterForget];
}

class SetpasswordLoadingState extends SetpasswordState {}

class SetpasswordErrorState extends SetpasswordState {
  final String errorMsg;

  const SetpasswordErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
