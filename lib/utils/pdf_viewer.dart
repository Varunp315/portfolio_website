import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerScreen extends StatelessWidget {
  final String path;

  const PDFViewerScreen({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Resume')),
      body: SfPdfViewer.asset(path),
    );
  }
}

void openPDF(BuildContext context, String path) {
  Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (_) => PDFViewerScreen(path: path)));
}
