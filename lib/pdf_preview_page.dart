import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer_null_safe/full_pdf_viewer_scaffold.dart';

class PdfPreviewPage extends StatelessWidget {
  final String path;
  PdfPreviewPage(
    this.path, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(path: path);
  }
}
