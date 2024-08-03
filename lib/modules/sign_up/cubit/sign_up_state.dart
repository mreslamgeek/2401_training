part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class LoadingState extends SignUpState {}

final class SuccessState extends SignUpState {}

final class FailuteState extends SignUpState {}
