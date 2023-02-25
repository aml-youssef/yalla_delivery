import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../domain/entities/reset_after_forget.dart';
import '../../../../domain/usecases/reset_after_forget_usecase.dart';
part 'setpassword_state.dart';

class SetpasswordCubit extends Cubit<SetpasswordState> {
  SetpasswordCubit({required this.resetAfterForgetUseCase})
      : super(SetpasswordInitial());
  final ResetAfterForgetUseCase resetAfterForgetUseCase;

  Future<void> setPassword({
    required String phone,
    required String password,
    required String token,
  }) async {
    emit(SetpasswordLoadingState());

    Either<Failure, ResetAfterForget> result = await resetAfterForgetUseCase(
        paramter: ResetAfterForgetPasramters(
      phone: phone,
      password: password,
      token: token,
    ));
    emit(result.fold((l) => SetpasswordErrorState(errorMsg: l.messege),
        (r) => SetpasswordLoadedState(resetAfterForget: r)));
  }
}
