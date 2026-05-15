import 'package:flutter/material.dart';

extension ColorsX on Color {
  Color o(double opacity) => withValues(alpha: opacity);

  Color get o0 => o(0.0);
  Color get o1 => o(0.1);
  Color get o2 => o(0.2);
  Color get o3 => o(0.3);
  Color get o4 => o(0.4);
  Color get o5 => o(0.5);
  Color get o6 => o(0.6);
  Color get o7 => o(0.7);
  Color get o8 => o(0.8);
  Color get o9 => o(0.9);
}
