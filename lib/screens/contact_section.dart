import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Contact Me',
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color.primary,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Feel free to reach out via email or connect on LinkedIn/GitHub.',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(height: 1.5),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.email),
                    label: const Text('Email'),
                    onPressed: () =>
                        _launchUrl('mailto:varunnpathakk@gmail.com'),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.link),
                    label: const Text('LinkedIn'),
                    onPressed: () =>
                        _launchUrl('https://www.linkedin.com/in/varun-pathak5'),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.code),
                    label: const Text('GitHub'),
                    onPressed: () => _launchUrl('https://github.com/Varunp315'),
                  ),
                ],
              ),
              // OPTIONAL FORM INPUT
              // const SizedBox(height: 30),
              // TextField(decoration: InputDecoration(labelText: 'Your Message')),
            ],
          ),
        ),
      ),
    );
  }
}
