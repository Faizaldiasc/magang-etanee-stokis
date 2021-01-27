import 'package:flutter/material.dart';

class SearchNotifier extends ChangeNotifier {
  String _search;
  SearchNotifier(String s) : _search = s ?? "";

  String get search => _search;

  set search(String c) {
    _search = c;
    notifyListeners();
  }
}