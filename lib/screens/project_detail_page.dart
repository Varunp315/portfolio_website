import 'package:flutter/material.dart';
import '../models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailPage extends StatelessWidget {
  final Project project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
        backgroundColor: color.surface,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: color.primary,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              children: project.tools
                  .map(
                    (tool) => Chip(
                      label: Text(tool),
                      backgroundColor: color.primary.withOpacity(0.1),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            Image.asset(project.imageAsset, height: 220, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(project.description, style: textTheme.bodyMedium),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              children: [
                if (project.githubLink != null)
                  ElevatedButton.icon(
                    icon: const Icon(Icons.code),
                    label: const Text("GitHub"),
                    onPressed: () => launchUrl(Uri.parse(project.githubLink!)),
                  ),
                if (project.demoLink != null)
                  OutlinedButton.icon(
                    icon: const Icon(Icons.launch),
                    label: const Text("Live Demo"),
                    onPressed: () => launchUrl(Uri.parse(project.demoLink!)),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
