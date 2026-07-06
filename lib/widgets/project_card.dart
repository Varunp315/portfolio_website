/*import 'package:flutter/material.dart';
import '../models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

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

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/project-detail', arguments: project);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Theme.of(context).cardColor,
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color.primary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                project.description,
                style: textTheme.bodyMedium?.copyWith(
                  color: color.onSurface.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                children: [
                  if (project.githubLink != null)
                    ElevatedButton.icon(
                      icon: const Icon(Icons.code),
                      label: const Text("GitHub"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color.primary,
                        foregroundColor: color.onPrimary,
                      ),
                      onPressed: () => _launchURL(project.githubLink!),
                    ),
                  if (project.demoLink != null)
                    OutlinedButton.icon(
                      icon: const Icon(Icons.open_in_new),
                      label: const Text("Demo"),
                      onPressed: () => _launchURL(project.demoLink!),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import '../models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  void _launchURL(String? url) async {
    if (url == null || url.isEmpty) return;
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: color.surface,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.imageAsset.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  project.imageAsset,
                  fit: BoxFit.cover,
                  height: 160,
                  width: double.infinity,
                ),
              ),
            const SizedBox(height: 10),
            Text(
              project.title,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              project.description,
              style: textTheme.bodyMedium?.copyWith(
                color: color.onSurface.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              children: project.tools
                  .map(
                    (tool) => Chip(
                      label: Text(tool),
                      backgroundColor: color.primaryContainer,
                      labelStyle: TextStyle(color: color.onPrimaryContainer),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                if (project.githubLink != null)
                  TextButton.icon(
                    onPressed: () => _launchURL(project.githubLink),
                    icon: const Icon(Icons.code),
                    label: const Text("GitHub"),
                  ),
                if (project.demoLink != null)
                  TextButton.icon(
                    onPressed: () => _launchURL(project.demoLink),
                    icon: const Icon(Icons.link),
                    label: const Text("Demo"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
