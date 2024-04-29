import 'package:flutter/material.dart';
import 'package:ondas_ad/screens/ondas_podcast_screen.dart';
import 'package:ondas_ad/screens/pdf_viewer_screen.dart';
import '../components/constants.dart';
import 'ondas_hist_screen.dart';
import 'ondas_video_screen.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

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
                    'assets/images/student_screen.png',
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
                            "Ondas 1.0",
                            style: TextStyle(
                                fontSize: screenHeight * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: proportionalImageHeight * 0.4,
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
                                        builder: (context) =>
                                            const OndasPodcastScreen(
                                          imgTopo:
                                              'assets/images/topo_ondas_1.png',
                                          miniatura:
                                              'assets/images/capa_podcast.png',
                                          versao: '1.0',
                                        ),
                                      ));
                                },
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                    child: Image.asset(
                                      'assets/images/ondas_1.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.26,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Podcasts',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: myMargem2,
                                  bottom: myMargem,
                                  left: myMargem),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDFViewerScreen(
                                              url: ondas1Caderno1e2,
                                              name:
                                              "Ondas 1.0 - 1º e 2º ano", swipe: true,)));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.02),
                                  child: Image.asset(
                                    'assets/images/ondas_1_caderno_1_e_2.png',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: myMargem2,
                                  bottom: myMargem,
                                  left: myMargem),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDFViewerScreen(
                                              url: ondas1Caderno3,
                                              name: "Ondas 1.0 - 3º ano", swipe: true,)));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.02),
                                  child: Image.asset(
                                    'assets/images/ondas_1_caderno_3.png',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: myMargem2,
                                  bottom: myMargem,
                                  left: myMargem),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDFViewerScreen(
                                              url: ondas1Caderno4e5,
                                              name: "Ondas 1.0 - 3º ano", swipe: true,)));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.02),
                                  child: Image.asset(
                                    'assets/images/ondas_1_caderno_4_e_5.png',
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
                            "Ondas 2.0",
                            style: TextStyle(
                                fontSize: screenHeight * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: proportionalImageHeight * 0.4,
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
                                          builder: (context) =>
                                              const OndasVideoScreen()));
                                },
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                    child: Image.asset(
                                      'assets/images/ondas_2.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.26,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Desenhos\nAnimados',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.040,
                                                color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ]),
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
                                        builder: (context) =>
                                            const OndasHistScreen(
                                          imgTopo:
                                              'assets/images/topo_historias.png',
                                          miniatura:
                                              'assets/images/capa_historias.png',
                                          ano: 'hist',
                                          versao: '2.0',
                                        ),
                                      ));
                                },
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                    child: Image.asset(
                                      'assets/images/ondas_2_historias.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.26,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Contação\n de Histórias',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  proportionalImageHeight *
                                                      0.04,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: myMargem2,
                                  bottom: myMargem,
                                  left: myMargem),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDFViewerScreen(
                                              url: ondas2Caderno1e2,
                                              name:
                                              "Ondas 2.0 - 1º e 2º ano", swipe: true,)));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.02),
                                  child: Image.asset(
                                    'assets/images/ondas_2_caderno_1_e_2.png',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: myMargem2,
                                  bottom: myMargem,
                                  left: myMargem),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDFViewerScreen(
                                              url: ondas2Caderno3,
                                              name: "Ondas 2.0 - 3º ano", swipe: true,)));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.02),
                                  child: Image.asset(
                                    'assets/images/ondas_2_caderno_3.png',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: myMargem2,
                                  bottom: myMargem,
                                  left: myMargem),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PDFViewerScreen(
                                              url: ondas2Caderno4e5,
                                              name: "Ondas 2.0 - 3º ano", swipe: true,)));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.02),
                                  child: Image.asset(
                                    'assets/images/ondas_2_caderno_4_e_5.png',
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
                      SizedBox(height: myMargem,)
                    ],
                  ),
                ]),
              ],
            )
          ],
        ));
  }
}
