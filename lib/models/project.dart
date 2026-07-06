class Project {
  final String title;
  final String description;
  final String? githubLink;
  final String? demoLink;
  final List<String> tools;
  final String imageAsset;

  const Project({
    required this.title,
    required this.description,
    this.githubLink,
    this.demoLink,
    this.tools = const [],
    this.imageAsset = '',
  });
}
