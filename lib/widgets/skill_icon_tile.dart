import 'package:flutter/material.dart';

class SkillIconTile extends StatefulWidget {
  final String label;
  final String assetPath;

  const SkillIconTile({
    super.key,
    required this.label,
    required this.assetPath,
  });

  @override
  State<SkillIconTile> createState() => _SkillIconTileState();
}

class _SkillIconTileState extends State<SkillIconTile>
    with SingleTickerProviderStateMixin {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: _visible ? 1.0 : 0.0,
      child: AnimatedSlide(
        offset: _visible ? Offset.zero : const Offset(0, 0.1),
        duration: const Duration(milliseconds: 400),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.primary.withOpacity(0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  widget.assetPath,
                  fit: BoxFit.contain,
                  color: color.primary,
                ),
              ),
            ),
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: color.onBackground,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
