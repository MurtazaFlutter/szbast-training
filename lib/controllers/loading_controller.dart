import 'package:flutter/material.dart';

class LoadingController extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoad) {
    _isLoading = isLoad;
    notifyListeners();
  }
}
