import 'dart:convert' show utf8;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<Map<String, String>> getHeaders() async {
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  return headers;
}

String decodedUtf8(String text) {
  try {
    return utf8.decode(text.runes.toList()).toString();
  } catch (e) {
    return text;
  }
}

String formatDateString(String dateStr) {
  DateTime dateTime = DateTime.parse(dateStr).toLocal();

  var formatter = DateFormat("dd MMM yyyy \nhh:mm a", "es_ES");

  return formatter.format(dateTime);
}

gotoPage(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}
