import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactLinksSection extends StatelessWidget {
  const ContactLinksSection({super.key});

  void _openUrl(String url) =>
      launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Contact form
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Me',
                  style: textTheme.headlineSmall?.copyWith(
                    color: color.primary,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: 'Message',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(onPressed: () {}, child: const Text('Send')),
              ],
            ),
          ),

          const SizedBox(width: 40),

          // Links section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find Me On',
                  style: textTheme.headlineSmall?.copyWith(
                    color: color.primary,
                  ),
                ),
                const SizedBox(height: 16),
                IconButton(
                  icon: const Icon(Icons.linked_camera),
                  onPressed: () => _openUrl('https://linkedin.com/'),
                ),
                IconButton(
                  icon: const Icon(Icons.code),
                  onPressed: () => _openUrl('https://github.com/'),
                ),
                IconButton(
                  icon: const Icon(Icons.mail),
                  onPressed: () => _openUrl('mailto:you@example.com'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
