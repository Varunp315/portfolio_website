import 'package:flutter/material.dart';
import 'skill_icon_tile.dart';

class SkillCategory extends StatelessWidget {
  final String title;
  final List<Map<String, String>> skills;

  const SkillCategory({super.key, required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(
            color: color.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 24,
          runSpacing: 24,
          children: skills
              .map(
                (skill) => SizedBox(
                  width: 80, // consistent size
                  child: SkillIconTile(
                    label: skill['name']!,
                    assetPath: skill['icon']!,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
