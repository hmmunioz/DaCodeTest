import 'dart:convert' show utf8;
import 'dart:convert';
import 'package:flutter/material.dart';

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

gotoPage(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}
