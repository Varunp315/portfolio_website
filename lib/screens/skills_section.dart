import 'package:flutter/material.dart';
import '../widgets/skill_category.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Skill data for each category
    final codingSkills = [
      {'name': 'C++', 'icon': 'assets/icons/cpp.png'},
      {'name': 'Python', 'icon': 'assets/icons/python.png'},
      {'name': 'Java', 'icon': 'assets/icons/java.png'},
      {'name': 'Dart', 'icon': 'assets/icons/dart.png'},
      {'name': 'JavaScript', 'icon': 'assets/icons/js.png'},
      {'name': 'HTML', 'icon': 'assets/icons/html.png'},
      {'name': 'CSS', 'icon': 'assets/icons/css.png'},
    ];

    final toolSkills = [
      {'name': 'Git', 'icon': 'assets/icons/git.png'},
      {'name': 'GitHub', 'icon': 'assets/icons/github.png'},
      {'name': 'Firebase', 'icon': 'assets/icons/firebase.png'},
      {'name': 'Notion', 'icon': 'assets/icons/notion.png'},
      {'name': 'Figma', 'icon': 'assets/icons/figma.png'},
      {'name': 'VS Code', 'icon': 'assets/icons/vscode.png'},
    ];

    final otherSkills = [
      {'name': 'Teamwork', 'icon': 'assets/icons/team.png'},
      {'name': 'Problem Solving', 'icon': 'assets/icons/problem.png'},
      {'name': 'Communication', 'icon': 'assets/icons/chat.png'},
      {'name': 'Time Management', 'icon': 'assets/icons/time.png'},
    ];

    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 40),
          isMobile
              ? Column(
                  children: [
                    SkillCategory(title: 'Coding', skills: codingSkills),
                    const SizedBox(height: 40),
                    SkillCategory(title: 'Tools', skills: toolSkills),
                    const SizedBox(height: 40),
                    SkillCategory(title: 'Others', skills: otherSkills),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SkillCategory(
                        title: 'Coding',
                        skills: codingSkills,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SkillCategory(title: 'Tools', skills: toolSkills),
                    ),
                    Flexible(
                      flex: 1,
                      child: SkillCategory(
                        title: 'Others',
                        skills: otherSkills,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
