import 'package:flutter/material.dart';
import 'package:ondas_ad/screens/pdf_viewer_screen.dart';
import '../components/constants.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = 2068.0 / 1748.0;
    double proportionalImageHeight = screenWidth * aspectRatio;

    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Column(
              children: [
                Stack(children: [
                  Image.asset(
                    'assets/images/teacher_screen.png',
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.height * 0.035,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: proportionalImageHeight * 0.7,
                      ),
                      Container(
                        height: proportionalImageHeight * 0.6,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.white,
                              Colors.white,
                              Color.fromARGB(0, 255, 255, 255),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: proportionalImageHeight * 0.90,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: myMargem,
                          ),
                          Text(
                            "Material de apoio - 1.0",
                            style: TextStyle(
                                fontSize: screenHeight * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: proportionalImageHeight * 0.35,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: myMargem2,
                                  bottom: myMargem2,
                                  left: myMargem),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDFViewerScreen(
                                                url: ondas1Apoio1e2,
                                                name:
                                                    "Ondas 1.0 - 1º e 2º anos",
                                                swipe: true,
                                              )));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.02),
                                  child: Image.asset(
                                    'assets/images/ondas_1_apoio_1_e_2.png',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: myMargem2,
                                  bottom: myMargem2,
                                  left: myMargem),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDFViewerScreen(
                                                url: ondas1Apoio3,
                                                name: "Ondas 1.0 - 3º ano",
                                                swipe: true,
                                              )));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.02),
                                  child: Image.asset(
                                    'assets/images/ondas_1_apoio_3.png',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: myMargem2,
                                  bottom: myMargem2,
                                  left: myMargem),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDFViewerScreen(
                                                url: ondas1Apoio4e5,
                                                name:
                                                    "Ondas 1.0 - 4º e 5º anos",
                                                swipe: true,
                                              )));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.02),
                                  child: Image.asset(
                                    'assets/images/ondas_1_apoio_4_e_5.png',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: myMargem,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: myMargem,
                          ),
                          Text(
                            "Material de apoio - 2.0",
                            style: TextStyle(
                                fontSize: screenHeight * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: proportionalImageHeight * 0.35,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: myMargem2,
                                  bottom: myMargem2,
                                  left: myMargem),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDFViewerScreen(
                                                url: ondas2Apoio1e2,
                                                name:
                                                    "Ondas 2.0 - 1º e 2º anos",
                                                swipe: true,
                                              )));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.02),
                                  child: Image.asset(
                                    'assets/images/ondas_2_apoio_1_e_2.png',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: myMargem2,
                                  bottom: myMargem2,
                                  left: myMargem),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDFViewerScreen(
                                                url: ondas2Apoio3,
                                                name: "Ondas 2.0 - 3º ano",
                                                swipe: true,
                                              )));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.02),
                                  child: Image.asset(
                                    'assets/images/ondas_2_apoio_3.png',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: myMargem2,
                                  bottom: myMargem2,
                                  left: myMargem),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDFViewerScreen(
                                                url: ondas2Apoio4e5,
                                                name:
                                                    "Ondas 2.0 - 4º e 5º anos",
                                                swipe: true,
                                              )));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.02),
                                  child: Image.asset(
                                    'assets/images/ondas_2_apoio_4_e_5.png',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: myMargem,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ],
            )
          ],
        ));
  }
}
