import 'dart:async';
import 'package:flutter/material.dart';

// This is a fake full-screen ad page.
class InterstitialAdScreen extends StatefulWidget {
  const InterstitialAdScreen({super.key});

  @override
  State<InterstitialAdScreen> createState() => _InterstitialAdScreenState();
}

class _InterstitialAdScreenState extends State<InterstitialAdScreen> {
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    // Simulate loading the ad content with a 2-second delay.
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isAdLoaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          // The main ad content
          Center(
            child: _isAdLoaded
                ? _buildAdContent()
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Colors.white),
                      SizedBox(height: 20),
                      Text('در حال بارگذاری تبلیغ...', style: TextStyle(color: Colors.white)),
                    ],
                  ),
          ),
          // Close button in the top-right corner
          Positioned(
            top: 40,
            right: 10,
            child: IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.close, color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdContent() {
    // A sample ad layout
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.store, color: Colors.blueAccent, size: 80),
        const SizedBox(height: 20),
        const Text(
          'فروشگاه شگفت‌انگیز ما',
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'محصولات جدید رسید! تا ۵۰٪ تخفیف',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            // In a real ad, this would open a URL.
          },
          child: const Text('مشاهده محصولات'),
        ),
      ],
    );
  }
}