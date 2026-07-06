import 'package:flutter/material.dart';
import 'typing_backspacing_text.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TypingBackspacingText(
            prefix: 'Hi, I’m ',
            texts: [
              'Varun Pathak',
              'a 4th year B.Tech student at Delhi Technological University',
              'a Flutter Developer',
              'a Coding Enthusiast',
              'a Squash, Swimming & Chess Player',
              'passionate about building beautiful, functional apps',
            ],
            textStyle: textTheme.headlineSmall?.copyWith(
              color: color.primary,
              fontWeight: FontWeight.bold,
            ),
            typingSpeed: const Duration(milliseconds: 50),
            backspaceSpeed: const Duration(milliseconds: 30),
            pauseDuration: const Duration(milliseconds: 1000),
          ),
        ],
      ),
    );
  }
}
