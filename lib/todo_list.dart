import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_app/main.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:river_pod_app/pdf_preview_page.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String name = ref.watch(nameProvider);
    final String age = ref.watch(ageProvider);
    final String task = ref.watch(taskProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          taskWidget(name, age, task),
          ElevatedButton(
              onPressed: () async {
                writeOnPdf();
                await savePdf();

                Directory documentDirectory =
                    await getApplicationDocumentsDirectory();

                String documentPath = documentDirectory.path;

                String fullPath = "$documentPath/example.pdf";
                print(fullPath);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PdfPreviewPage(
                              fullPath,
                            )));
              },
              child: Text('Generate pdf'))
        ],
      ),
    );
  }

  Widget taskWidget(String name, String age, String task) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(name),
          SizedBox(
            height: 10,
          ),
          Text(age.toString()),
          SizedBox(
            height: 10,
          ),
          Text(task),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 204, 165, 151),
      ),
    );
  }
}

final pdf = pw.Document();
writeOnPdf() {
  pdf.addPage(pw.MultiPage(
    pageFormat: PdfPageFormat.a4,
    margin: pw.EdgeInsets.all(32),
    build: (pw.Context context) {
      return <pw.Widget>[
        pw.Header(
            level: 0,
            child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: <pw.Widget>[
                  pw.Text('Geeksforgeeks', textScaleFactor: 2),
                ])),
        pw.Header(level: 1, text: 'What is Lorem Ipsum?'),

        // Write All the paragraph in one line.
        // For clear understanding
        // here there are line breaks.
        pw.Paragraph(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus '),
        pw.Paragraph(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibusvitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero'),
        pw.Header(level: 1, text: 'This is Header'),
        pw.Paragraph(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod'),
        pw.Paragraph(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmo'),
        pw.Padding(padding: const pw.EdgeInsets.all(10)),
        pw.Table.fromTextArray(context: context, data: const <List<String>>[
          <String>['Year', 'Sample'],
          <String>['SN0', 'GFG1'],
          <String>['SN1', 'GFG2'],
          <String>['SN2', 'GFG3'],
          <String>['SN3', 'GFG4'],
        ]),
      ];
    },
  ));
}

Future savePdf() async {
  Directory documentDirectory = await getApplicationDocumentsDirectory();
  String documentPath = documentDirectory.path;
  File file = File("$documentPath/example.pdf");
  file.writeAsBytesSync(await pdf.save());
}
