import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial()) {
    checkAuth();
  }

  void checkAuth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var tokken = prefs.getString('tokken');

    if (tokken != null) {
      navKey.currentState?.pushNamedAndRemoveUntil(AppRoutes.HOME, (route) => false);
    }
  }
}
