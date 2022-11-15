import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitialState());

  late String currentverificationId;

  Future<void> sendVerificationCode(String phoneNumber) async {
    emit(VerificationLoadingState());
    print('kosmy=$phoneNumber');
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+201207333848',
      timeout: const Duration(seconds: 5),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        emit(VerificationErrorState(errorMsg: e.message!));
      },
      codeSent: (String verificationId, int? resendToken) {
        currentverificationId = verificationId;
        emit(VerificationLoadedState());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> checkVerificationCode(
      String verificationId, String smsCode) async {
    emit(VerificationLoadingState());

    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message ?? 'error 3o3o3o3o3o3o3o');
      emit(VerificationErrorState(
          errorMsg: e.message ?? 'error 3o3o3o3o3o3o3o'));
    }
    if (auth.currentUser != null) {
      emit(VerificationLoadedState());
    }
  }

  Future<void> setNewPassword(String newPassword) async {
    emit(VerificationLoadingState());

    ////////

    emit(VerificationLoadedState());
  }
}
