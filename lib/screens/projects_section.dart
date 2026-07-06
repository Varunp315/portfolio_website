import 'package:flutter/material.dart';
import '../models/project.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final List<Project> featuredProjects = [
      Project(
        title: 'Crypto Tracker',
        description:
            'Track Bitcoin prices and sentiment. Built with Flutter, Firebase, and beautiful dark mode UI.',
        githubLink: 'https://github.com/your_username/crypto-tracker',
        demoLink: 'https://your-crypto-tracker.web.app',
      ),
      Project(
        title: 'Portfolio Website',
        description:
            'This responsive website showcases my skills, projects, resume, and contact form. Built in Flutter Web.',
        githubLink: 'https://github.com/your_username/portfolio',
        demoLink: 'https://yourportfolio.com',
      ),
      Project(
        title: 'Blog App',
        description:
            'A mobile app for reading and writing blogs. Uses Flutter, Firestore, and Markdown formatting.',
        githubLink: 'https://github.com/your_username/blog-app',
        demoLink: null, // You can add a demo link later
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Projects',
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: color.primary,
            ),
          ),
          const SizedBox(height: 32),

          // Project Cards Grid
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: featuredProjects
                .map((project) => ProjectCard(project: project))
                .toList(),
          ),

          const SizedBox(height: 40),

          // View All Projects Button
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/projects');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: color.primary,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'View All Projects',
              style: textTheme.labelLarge?.copyWith(
                color: color.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
