import 'dart:io';

import 'package:maxWorkshop/widgets/pdf_view.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart' as pw;

import 'package:flutter/material.dart';
import '../const/const.dart';

final doc = pw.Document();

const route = "pdf";

class PdfData extends StatefulWidget {
  @override
  _PdfDataState createState() => _PdfDataState();
}

class _PdfDataState extends State<PdfData> {
  var x = "asdasdchanged";
  writePdf() {
    doc.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Header(
            level: 0,
            child: pw.Text("Hello Mars"),
          ),
          pw.Paragraph(
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          ),
          pw.Paragraph(
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          ),
          pw.Header(
            level: 1,
            child: pw.Text("hello Earth"),
          )
        ];
      },
    ));
  }

  Future savePdf() async {
    final documentDirPath =
        await path_provider.getApplicationDocumentsDirectory();
    var path = documentDirPath.path;
    final file = File("$path/example.pdf");
    file.writeAsBytesSync(doc.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // writePdf();
          // await savePdf();
          // final documentDirPath =
          //     await path_provider.getApplicationDocumentsDirectory();
          // var path = documentDirPath.path;
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return PDFViewer();
          }));
        },
        child: Icon(Icons.save),
      ),
      appBar: appBar,
      body: Text("PDF not found"),
    );
  }
}
