import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailTile extends StatelessWidget {
  final String title;
  final String description;
  final List<String> tools;
  final String? githubLink;
  final String? demoLink;
  final String imageAsset;

  const ProjectDetailTile({
    super.key,
    required this.title,
    required this.description,
    required this.tools,
    this.githubLink,
    this.demoLink,
    required this.imageAsset,
  });

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: color.primary,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: tools
              .map(
                (tool) => Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: color.primary),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    tool,
                    style: textTheme.bodySmall?.copyWith(color: color.primary),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          style: textTheme.bodyMedium?.copyWith(
            color: color.onSurface.withOpacity(0.9),
          ),
        ),
        const SizedBox(height: 16),
        if (imageAsset.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imageAsset, height: 200),
          ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          children: [
            if (githubLink != null)
              ElevatedButton.icon(
                icon: const Icon(Icons.code),
                label: const Text("GitHub"),
                onPressed: () => _launchURL(githubLink!),
              ),
            if (demoLink != null)
              OutlinedButton.icon(
                icon: const Icon(Icons.link),
                label: const Text("Live Demo"),
                onPressed: () => _launchURL(demoLink!),
              ),
          ],
        ),
      ],
    );
  }
}
