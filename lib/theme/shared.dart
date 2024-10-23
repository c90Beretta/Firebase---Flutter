import 'package:flutter/material.dart';

class DesignConstants {
  static const TextStyle labelStyle = TextStyle(
    color: Color(0xFF95A1AC),
    fontSize: 14,
    fontFamily: 'Manrope',
  );

  static const TextStyle hintStyle = TextStyle(
    color: Color(0xFF95A1AC),
    fontSize: 14,
    fontFamily: 'Manrope',
  );

  static OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0x00000000),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  static OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0x00000000),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0x00000000),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  static OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0x00000000),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  static const EdgeInsetsDirectional contentPadding =
      EdgeInsetsDirectional.fromSTEB(16, 24, 24, 24);
}
