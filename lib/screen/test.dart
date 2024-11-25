import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';
import 'onboarding_screen.dart';



class AnimationDetailsScreen extends StatelessWidget {
  const AnimationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Details')),
      body: FutureBuilder<LottieComposition>(
        future: AssetLottie('assets/lottie/ai_ask.json').load(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          }

          // Access the composition to get width and height
          final composition = snapshot.data!;
          final width = composition.bounds.width;
          final height = composition.bounds.height;

          // Scale dimensions dynamically based on screen size
          final scaleFactor = mq.width / width; // Scale proportionally
          final scaledWidth = mq.width; // Match the screen width
          final scaledHeight = height * scaleFactor; // Maintain aspect ratio

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the Lottie animation
              Lottie.asset('assets/lottie/ai_ask.json'),
              Lottie.asset(
                'assets/lottie/ai_image.json',
                width: scaledWidth,
                height: scaledHeight,
              ),

              const SizedBox(height: 20),

              // Display width and height
              Text(
                'Width: $scaledWidth',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Height: $scaledHeight',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          );
        },
      ),
    );
  }
}
