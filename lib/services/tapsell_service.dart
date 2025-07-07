import 'package:flutter/foundation.dart'; // ✅ Step 1: Import this to use kDebugMode
import 'package:flutter/material.dart';
import '../presentation/common_widgets/interstitial_ad_screen.dart';

// This class simulates the Tapsell SDK.
class TapsellService {
  bool _isInitialized = false;

  Future<void> initialize() async {
    // ✅ Step 2: Wrap print in a kDebugMode check
    if (kDebugMode) {
      print('Tapsell Service: Initializing...');
    }
    await Future.delayed(const Duration(seconds: 1));
    _isInitialized = true;
    if (kDebugMode) {
      print('Tapsell Service: Initialized successfully!');
    }
  }

  Future<void> showInterstitialAd(BuildContext context) async {
    if (!_isInitialized) {
      if (kDebugMode) {
        print('Tapsell Service: Not initialized. Cannot show ad.');
      }
      return;
    }
    
    if (kDebugMode) {
      print('Tapsell Service: Requesting an interstitial ad...');
    }
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterstitialAdScreen(),
        fullscreenDialog: true,
      ),
    );
    if (kDebugMode) {
      print('Tapsell Service: Interstitial ad closed.');
    }
  }
}