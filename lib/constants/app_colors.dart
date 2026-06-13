import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors
  static const Color primary = Color(0xFF6366F1); // Purple
  static const Color secondary = Color(0xFF38BDF8); // Blue

  // Accent Colors
  static const Color success = Color(0xFF10B981); // Green
  static const Color danger = Color(0xFFEF4444); // Red

  // Background Colors
  static const Color scaffoldBg = Color(0xFFF8FAFC);
  static const Color white = Color(0xFFFFFFFF);
  static const Color fieldBg = Color(0xFFF1F5F9);

  // Text Colors
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textHint = Color(0xFF94A3B8);

  // Border Colors
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFCBD5E1);

  // Icon Colors
  static const Color iconPrimary = primary;
  static const Color iconSecondary = secondary;
  static const Color iconInactive = Color(0xFF94A3B8);

  // Chat Bubble Colors
  static const Color senderBubble = primary;
  static const Color receiverBubble = Color(0xFFF8FAFC);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF6366F1),
      Color(0xFF38BDF8),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}