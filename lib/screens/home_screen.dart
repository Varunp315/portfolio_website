import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import 'about_section.dart';
import 'projects_section.dart';
import 'contact_section.dart';
import 'skills_section.dart';
import '../widgets/intro_section.dart';
import 'footer_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();
  bool showShadow = false;

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      final shouldShow = scrollController.offset > 10;
      if (showShadow != shouldShow) {
        setState(() {
          showShadow = shouldShow;
        });
      }
    });
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavBar(
          onNavItemSelected: (section) {
            switch (section) {
              case 'Home':
                _scrollTo(homeKey);
                break;
              case 'About':
                _scrollTo(aboutKey);
                break;
              case 'Skills':
                _scrollTo(skillsKey);
                break;
              case 'Projects':
                _scrollTo(projectsKey);
                break;
              case 'Contact':
                _scrollTo(contactKey);
                break;
            }
          },
          //showShadow: showShadow,
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(key: homeKey, child: const IntroSection()),
                Container(key: aboutKey, child: const AboutSection()),
                Container(key: skillsKey, child: const SkillsSection()),
                Container(key: projectsKey, child: const ProjectsSection()),
                Container(key: contactKey, child: const ContactSection()),
                const FooterSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/*
import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/intro_section.dart';
import '../screens/contact_section.dart';
import '../screens/footer_section.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const HomeScreen({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();
  bool showShadow = false;

  final GlobalKey contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      final shouldShow = scrollController.offset > 10;
      if (showShadow != shouldShow) {
        setState(() {
          showShadow = shouldShow;
        });
      }
    });
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleNav(String section) {
    switch (section) {
      case 'Projects':
        Navigator.pushNamed(context, '/projects');
        break;
      case 'Blog':
        // Scroll to Blog Section (if added later)
        break;
      case 'Contact':
        _scrollTo(contactKey);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavBar(
          onToggleTheme: widget.toggleTheme,
          isDarkMode: widget.isDarkMode,
          onNavItemSelected: _handleNav,
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                const IntroSection(),
                Container(key: contactKey, child: const ContactSection()),
                const FooterSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
*/