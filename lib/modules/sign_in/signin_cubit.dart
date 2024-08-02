import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  void signIn() async {
    if (formKey.currentState?.validate() != true) return;
    formKey.currentState!.save();

    log(email.toString());
    log(password.toString());

    emit(LoadingState());

    final response = await AuthRepoApi.login(email!, password!);
    log(response.toString());

    if (response != null) {
      emit(SuccessState());
    } else {
      emit(FailuteState());
    }
  }
}
