import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  String? name;
  String? email;
  String? password;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signUp() async {
    if (formKey.currentState?.validate() != true) return;
    formKey.currentState!.save();

    emit(LoadingState());

    final response = await AuthRepoApi.register(email!, password!, name!);

    if (response != null) {
      emit(SuccessState());
    } else {
      emit(FailuteState());
    }
  }
}
