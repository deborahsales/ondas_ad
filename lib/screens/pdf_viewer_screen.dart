import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  void _handlePopInvoked(bool value) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    _fetchPDF();
  }

  Future<void> _fetchPDF() async {
    final fileUrl = await PDFApi.loadNetwork(widget.url);
    if (mounted) {
      setState(() {
        file = fileUrl;
        filePath = file?.path;
        widget.swipe
            ? SystemChrome.setPreferredOrientations(
                [DeviceOrientation.landscapeLeft])
            : SystemChrome.setPreferredOrientations(
                [DeviceOrientation.portraitUp]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = '${indexPage + 1} de $pages';
    Orientation orientation = MediaQuery.of(context).orientation;

    return PopScope(
      onPopInvoked: _handlePopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: filePath == null
            ? null
            : pages >= 2
                ? orientation == Orientation.portrait
                    ? BottomAppBar(
                        color: myWhite,
                        padding: EdgeInsets.zero,
                        height: screenHeight * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                controller?.setPage(0);
                              },
                              icon: Icon(
                                Icons.home,
                                size: screenWidth * 0.08,
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
                                size: screenWidth * 0.08,
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
                                size: screenWidth * 0.08,
                              ),
                            ),
                          ],
                        ))
                    : null
                : null,
        appBar: filePath == null
            ? null
            : orientation == Orientation.portrait
                ? AppBar(
                    title: Text(
                      widget.name,
                    ),
                    backgroundColor: myWhite,
                  )
                : AppBar(
                    title: Text(
                      widget.name,
                    ),
                    backgroundColor: myWhite,
                    actions: [
                      IconButton(
                        onPressed: () {
                          controller?.setPage(0);
                        },
                        icon: Icon(
                          Icons.home,
                          size: screenHeight * 0.08,
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
                          size: screenHeight * 0.08,
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
                          size: screenHeight * 0.08,
                        ),
                      ),
                      SizedBox(
                        width: screenHeight * 0.08,
                      )
                    ],
                  ),
        backgroundColor: myWhite,
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
                      style: TextStyle(fontSize: screenHeight * 0.025),
                    ),
                  ),
                ],
              ))
            : PDFView(
                defaultPage: 1,
                filePath: filePath,
                enableSwipe: false,
                swipeHorizontal: !widget.swipe,
                fitPolicy: FitPolicy.BOTH,
                onRender: (pages) => setState(() => this.pages = pages!),
                onViewCreated: (controller) =>
                    setState(() => this.controller = controller),
                onPageChanged: (indexPage, _) =>
                    setState(() => this.indexPage = indexPage!),
              ),
      ),
    );
  }
}
