import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

Widget verticalSpacing(double height) => SizedBox(height: height.h);

Widget horizontalSpacing(double width) => SizedBox(width: width.w);

String trimWord(String input, String wordToTrim) {
  return input.replaceAll(wordToTrim, "").trim();
}

/// Function to count words in the text
int countWords(String text) {
  List<String> words = text.trim().split(RegExp(r'\s+'));
  return words.isEmpty || words.first == "" ? 0 : words.length;
}

String formatFullDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat("d MMMM, yyyy").format(dateTime);
}

String formatEventTime(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  String dayOfWeek = DateFormat("EEEE").format(dateTime);
  String startTime = DateFormat("h:mm a").format(dateTime);
  String endTime = DateFormat(
    "h:mm a",
  ).format(dateTime.add(const Duration(hours: 3))); // Adding 3 hours
  return "$dayOfWeek, $startTime - $endTime";
}
