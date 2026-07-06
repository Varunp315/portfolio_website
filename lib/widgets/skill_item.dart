import 'package:flutter/material.dart';

class SkillItem extends StatefulWidget {
  final IconData icon;
  final String name;

  const SkillItem({super.key, required this.icon, required this.name});

  @override
  State<SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem>
    with SingleTickerProviderStateMixin {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    // Add a short delay to stagger entrance
    Future.delayed(Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _visible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final isDark = color.brightness == Brightness.dark;

    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      child: AnimatedSlide(
        offset: _visible ? Offset.zero : const Offset(0, 0.1),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        child: Chip(
          backgroundColor: isDark
              ? color.primary.withOpacity(0.1)
              : color.primary.withOpacity(0.2),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 18, color: color.primary),
              const SizedBox(width: 6),
              Text(widget.name, style: TextStyle(color: color.primary)),
            ],
          ),
        ),
      ),
    );
  }
}
