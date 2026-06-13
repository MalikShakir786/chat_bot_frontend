import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors
  static const Color primary = Color(0xFF6366F1);
  static const Color secondary = Color(0xFF38BDF8);
  static const Color grey = Color(0xFFAAAAAA);

  // Accent Colors
  static const Color success = Color(0xFF10B981);
  static const Color danger = Color(0xFFEF4444);

  // Text Colors
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textHint = Color(0xFF94A3B8);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      primary,
      secondary
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}