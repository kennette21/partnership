import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

List<String> getArrayFromKeywordString(String keywordString) {
  // Add your function code here!
  return keywordString.split(", ");
}

String? getStringFromKeywordArray(List<String>? keywordArray) {
  if (keywordArray != null) {
    return keywordArray.join(", ");
  }
  return null;
}
