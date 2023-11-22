// ignore: file_names

import 'dart:convert';

List<String> categoryMapperFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String categoryMapperToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));