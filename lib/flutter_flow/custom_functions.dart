import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? removeFirstNChars(
  String? inputString,
  int? numberOfCharsToRemove,
) {
  // remove first n characters from string
  if (inputString == null || numberOfCharsToRemove == null) {
    return inputString;
  }
  if (numberOfCharsToRemove >= inputString.length) {
    return '';
  }
  return inputString.substring(numberOfCharsToRemove);
}

List<String>? convertStringToList(String? inputStringToConvertToList) {
// convert string with \n to list
  if (inputStringToConvertToList == null) {
    return null;
  }

  String replacedString = inputStringToConvertToList
      .replaceAll(r'\n', '\n')
      .replaceAll(RegExp(r'\d+\.\s+'), '')
      .replaceAll(RegExp(r'\"'), '')
      .replaceAll(RegExp(r'\\'), '');

  List<String> result = replacedString
      .split('\n')
      .map((line) => line.trim())
      .where((line) => line.isNotEmpty)
      .toList();

  return result;
}
