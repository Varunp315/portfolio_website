/*import 'package:flutter/material.dart';
import '../models/project.dart';
import '../widgets/project_card.dart';

class AllProjectsPage extends StatelessWidget {
  const AllProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final List<Project> allProjects = [
      Project(
        title: 'Crypto Tracker',
        description:
            'Track Bitcoin prices and sentiment. Built with Flutter, Firebase, and beautiful dark mode UI.',
        githubLink: 'https://github.com/your_username/crypto-tracker',
        demoLink: 'https://your-crypto-tracker.web.app',
        tools: ['Flutter', 'Firebase', 'REST APIs'],
        imageAsset: 'assets/images/crypto.png',
      ),
      Project(
        title: 'Portfolio Website',
        description:
            'Responsive personal website built in Flutter Web with animations, dark mode, and section navigation.',
        githubLink: 'https://github.com/your_username/portfolio',
        demoLink: 'https://yourportfolio.com',
        tools: ['Flutter Web', 'Material 3'],
        imageAsset: 'assets/images/portfolio.png',
      ),
      Project(
        title: 'Blog App',
        description:
            'A mobile blogging app with Firebase backend and Markdown support. Clean UI and category filtering.',
        githubLink: 'https://github.com/your_username/blog-app',
        demoLink: null,
        tools: ['Flutter', 'Firebase', 'Markdown'],
        imageAsset: 'assets/images/blog.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Projects'),
        backgroundColor: color.surface,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Explore All Projects',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: color.primary,
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: allProjects
                  .map((project) => ProjectCard(project: project))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../models/project.dart';
import '../widgets/project_card.dart';

class AllProjectsPage extends StatelessWidget {
  const AllProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    final List<Project> allProjects = [
      Project(
        title: 'Crypto Tracker App',
        description: 'A real-time Flutter app to track crypto prices and news.',
        githubLink: 'https://github.com/yourusername/crypto-tracker',
        demoLink: '',
        tools: ['Flutter', 'REST API', 'Firebase'],
        imageAsset: 'assets/images/crypto_tracker.png',
      ),
      Project(
        title: 'Portfolio Website',
        description: 'This portfolio site built using Flutter Web.',
        githubLink: 'https://github.com/yourusername/portfolio',
        demoLink: '',
        tools: ['Flutter', 'Responsive UI'],
        imageAsset: 'assets/images/portfolio.png',
      ),
      Project(
        title: 'FireTV Recommendation System',
        description: 'Personalized ML-based content recommendation engine.',
        githubLink: 'https://github.com/yourusername/firetv-recommendation',
        demoLink: '',
        tools: ['Python', 'FastAPI', 'ML'],
        imageAsset: 'assets/images/recommender.png',
      ),
      // Add more projects here...
    ];

    return Scaffold(
      body: Column(
        children: [
          NavBar(
            onNavItemSelected: (section) {
              if (section == 'Home') {
                Navigator.pushNamed(context, '/');
              } else if (section == 'Projects') {
                // Already here
              } else if (section == 'Blog') {
                // Future implementation
              }
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: GridView.builder(
                itemCount: allProjects.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  return ProjectCard(project: allProjects[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
