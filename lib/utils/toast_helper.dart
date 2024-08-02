import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

showErrorToast(dynamic message) => showToast(
      " $message ",
      position: ToastPosition.bottom,
      dismissOtherToast: true,
      duration: const Duration(seconds: 3),
      textPadding: const EdgeInsets.all(10),
      radius: 15,
      backgroundColor: Colors.red,
    );

showSuccessToast(dynamic message) => showToast(
      " $message ",
      position: ToastPosition.bottom,
      dismissOtherToast: true,
      duration: const Duration(seconds: 3),
      textPadding: const EdgeInsets.all(10),
      radius: 15,
      backgroundColor: Colors.green,
    );
