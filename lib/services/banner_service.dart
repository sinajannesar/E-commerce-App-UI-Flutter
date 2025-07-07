import 'package:flutter/material.dart';

// This service manages the visibility of the banner across the app.
class BannerService extends ChangeNotifier {
  bool _isBannerVisible = false;
  bool get isBannerVisible => _isBannerVisible;

  void toggleBannerVisibility(bool isVisible) {
    _isBannerVisible = isVisible;
    // Notify all listening widgets to rebuild.
    notifyListeners();
  }
}