/*port 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;
  final void Function(String section) onNavItemSelected;
  final bool showShadow;

  const NavBar({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
    required this.onNavItemSelected,
    this.showShadow = false,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  bool _drawerOpen = false;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  Future<void> _launchResume(BuildContext context) async {
    final uri = Uri.parse(
      'https://drive.google.com/file/d/1bgd9o3LkjCQN2z5UqPURh3xIfwAQB_4P/view',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Could not open resume.')));
    }
  }

  List<Widget> _navButtons(BuildContext context, {bool isVertical = false}) {
    final color = Theme.of(context).colorScheme;
    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: color.primary,
      fontWeight: FontWeight.w600,
    );

    final buttonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      foregroundColor: color.primary,
      //overlayColor: MaterialStateProperty.all(color.primary.withOpacity(0.1)),
    );

    List<Widget> items = [
      TextButton(
        style: buttonStyle,
        onPressed: () {
          widget.onNavItemSelected('Home');
          if (isVertical) _closeDrawer();
        },
        child: Text('Home', style: style),
      ),
      TextButton(
        style: buttonStyle,
        onPressed: () {
          widget.onNavItemSelected('About');
          if (isVertical) _closeDrawer();
        },
        child: Text('About', style: style),
      ),
      TextButton(
        style: buttonStyle,
        onPressed: () {
          widget.onNavItemSelected('Projects');
          if (isVertical) _closeDrawer();
        },
        child: Text('Projects', style: style),
      ),
      TextButton(
        style: buttonStyle,
        onPressed: () {
          widget.onNavItemSelected('Contact');
          if (isVertical) _closeDrawer();
        },
        child: Text('Contact', style: style),
      ),
      TextButton(
        style: buttonStyle,
        onPressed: () => _launchResume(context),
        child: Text('Resume', style: style),
      ),
      IconButton(
        icon: Icon(
          widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          color: color.primary,
        ),
        onPressed: widget.onToggleTheme,
        tooltip: "Toggle Theme",
      ),
    ];

    return items;
  }

  void _openDrawer() {
    setState(() => _drawerOpen = true);
    _controller.forward();
  }

  void _closeDrawer() {
    _controller.reverse().then((_) {
      setState(() => _drawerOpen = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final shadow = widget.showShadow
        ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ]
        : [];

    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color: color.surface.withOpacity(0.95),
            //boxShadow: shadow,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 700;

              return isMobile
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Varun Pathak',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: color.primary,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _drawerOpen ? Icons.close : Icons.menu,
                            color: color.primary,
                          ),
                          onPressed: _drawerOpen ? _closeDrawer : _openDrawer,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Varun Pathak',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: color.primary,
                          ),
                        ),
                        Row(children: _navButtons(context)),
                      ],
                    );
            },
          ),
        ),

        // Mobile fullscreen drawer
        if (_drawerOpen)
          Positioned.fill(
            top: 72,
            child: SlideTransition(
              position: _slideAnimation,
              child: Container(
                color: color.surface,
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _navButtons(context, isVertical: true)
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: item,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

*/
/*
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final void Function(String section) onNavItemSelected;

  const NavBar({
    super.key,
    required this.onNavItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      color: color.surface.withOpacity(0.95),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Name
          Text(
            'Varun Pathak',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color.primary,
            ),
          ),
          // Right: Actions
          Row(
            children: [
              TextButton(
                onPressed: () => onNavItemSelected('Blog'),
                child: const Text('Blog'),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () => onNavItemSelected('Projects'),
                child: const Text('Projects'),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: color.primary,
                ),
                onPressed: onToggleTheme,
                tooltip: 'Toggle Theme',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final void Function(String section) onNavItemSelected;

  const NavBar({
    super.key,
    required this.onNavItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: color.surface.withOpacity(0.95),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Varun Pathak',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: color.primary,
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => onNavItemSelected('Home'),
                child: const Text('Home'),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () => onNavItemSelected('Blog'),
                child: const Text('Blog'),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () => onNavItemSelected('Projects'),
                child: const Text('Projects'),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final void Function(String section) onNavItemSelected;

  const NavBar({
    super.key,
    required this.onNavItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: color.surface.withOpacity(0.95),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Varun Pathak',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: color.primary,
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => onNavItemSelected('Home'),
                child: const Text('Home'),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () => onNavItemSelected('Blog'),
                child: const Text('Blog'),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () => onNavItemSelected('Projects'),
                child: const Text('Projects'),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
}
