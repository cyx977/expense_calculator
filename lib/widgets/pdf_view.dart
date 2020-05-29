import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class PDFViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      path: "asssets/hello.pdf",
    );
  }
}
