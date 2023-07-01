import 'package:flutter/material.dart';

class Category {
  const Category(
      {required this.id,
      required this.title,
      this.color = const Color(0XFFEA5C2B)});

  final String id;
  final String title;
  final Color color;
}
