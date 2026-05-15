import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Toast {
  const Toast._();

  static void success(
    BuildContext? context, {
    String? text,
    String? description,
  }) {
    _show(
      context,
      text: text ?? 'Success.',
      type: .success,
      description: description,
    );
  }

  static void info(
    BuildContext? context, {
    String? text,
    String? description,
  }) {
    _show(
      context,
      text: text ?? 'Info.',
      type: .info,
      description: description,
    );
  }

  static void warning(
    BuildContext? context, {
    String? text,
    String? description,
  }) {
    _show(
      context,
      text: text ?? 'Warning.',
      type: .warning,
      description: description,
    );
  }

  static void error(
    BuildContext? context, {
    String? text,
    String? description,
  }) {
    _show(
      context,
      text: text ?? 'Error.',
      type: .error,
      description: description,
    );
  }

  static void _show(
    BuildContext? context, {
    required ToastificationType type,
    required String text,
    required String? description,
  }) {
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.flat,
      title: Text(text),
      description: description != null ? Text(description) : null,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 3),
      dragToClose: true,
    );
  }
}
