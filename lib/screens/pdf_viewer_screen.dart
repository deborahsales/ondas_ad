import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:lottie/lottie.dart';

import '../components/constants.dart';
import '../components/pdf_api.dart';

class PDFViewerScreen extends StatefulWidget {
  final String url;
  final String name;
  final bool swipe;

  const PDFViewerScreen(
      {super.key, required this.url, required this.name, required this.swipe});

  @override
  State<PDFViewerScreen> createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  PDFViewController? controller;
  int pages = 0;
  int indexPage = 0;
  File? file;
  String? filePath;

  @override
  void initState() {
    super.initState();
    _fetchPDF();
  }

  Future<void> _fetchPDF() async {
    final fileUrl = await PDFApi.loadNetwork(widget.url);
    if (mounted) {
      setState(() {
        file = fileUrl;
        filePath = file?.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = '${indexPage + 1} de $pages';

    return Scaffold(
        bottomNavigationBar: filePath == null
            ? null
            : pages >= 2
                ? BottomAppBar(
                    color: Colors.white,
                    padding: EdgeInsets.zero,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            controller?.setPage(0);
                          },
                          icon: Icon(
                            Icons.home,
                            size: MediaQuery.of(context).size.width * 0.08,
                          ),
                        ),
                        Center(
                          child: Text(text),
                        ),
                        IconButton(
                          onPressed: () {
                            final page = indexPage - 1;
                            controller?.setPage(page);
                          },
                          icon: Icon(
                            Icons.chevron_left,
                            size: MediaQuery.of(context).size.width * 0.08,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            final page =
                                indexPage == pages - 1 ? 0 : indexPage + 1;
                            controller?.setPage(page);
                          },
                          icon: Icon(
                            Icons.chevron_right,
                            size: MediaQuery.of(context).size.width * 0.08,
                          ),
                        ),
                      ],
                    ))
                : null,
        appBar: filePath == null
            ? null
            : AppBar(
                title: Text(
                  widget.name,
                ),
              ),
        backgroundColor: Colors.white,
        body: filePath == null
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(myMargem * 3),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: myMargem * 6, right: myMargem * 6),
                      child: Lottie.asset('assets/images/abel_dormindo.json'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: myMargem * 3, right: myMargem * 3),
                    child: const LinearProgressIndicator(color: myPurple),
                  ),
                  Padding(
                    padding: EdgeInsets.all(myMargem * 3),
                    child: Text(
                      'Download em andamento...',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                  ),
                ],
              ))
            : PDFView(
                filePath: filePath,
                swipeHorizontal: true,
                onRender: (pages) => setState(() => this.pages = pages!),
                onViewCreated: (controller) =>
                    setState(() => this.controller = controller),
                onPageChanged: (indexPage, _) =>
                    setState(() => this.indexPage = indexPage!),
              ));
  }
}
