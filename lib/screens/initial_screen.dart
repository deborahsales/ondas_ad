import 'package:flutter/material.dart';
import 'package:ondas_ad/screens/ondas_podcast_screen.dart';
import 'package:ondas_ad/screens/pdf_viewer_screen.dart';
import '../components/constants.dart';
import 'ondas_hist_screen.dart';
import 'ondas_video_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

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
                    'assets/images/initial_screen.png',
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
                                              'assets/images/topo_modulos_1_4_7.png',
                                          modulo: 'Módulo 01',
                                          miniatura:
                                              'assets/images/capa_podcast_1_4_7.png',
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
                                      'assets/images/ondas_1_modulos_1_4_7.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.27,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Módulo 01',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: Colors.white),
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
                                            const OndasPodcastScreen(
                                          imgTopo:
                                              'assets/images/topo_modulos_2_5_8.png',
                                          modulo: 'Módulo 02',
                                          miniatura:
                                              'assets/images/capa_podcast_2_5_8.png',
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
                                      'assets/images/ondas_1_modulos_2_5_8.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.27,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Módulo 02',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: Colors.white),
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
                                            const OndasPodcastScreen(
                                          imgTopo:
                                              'assets/images/topo_modulos_3_6.png',
                                          modulo: 'Módulo 03',
                                          miniatura:
                                              'assets/images/capa_podcast_3_6.png',
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
                                      'assets/images/ondas_1_modulos_3_6.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.27,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Módulo 03',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: Colors.white),
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
                                            const OndasPodcastScreen(
                                          imgTopo:
                                              'assets/images/topo_modulos_1_4_7.png',
                                          modulo: 'Módulo 04',
                                          miniatura:
                                              'assets/images/capa_podcast_1_4_7.png',
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
                                      'assets/images/ondas_1_modulos_1_4_7.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.27,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Módulo 04',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: Colors.white),
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
                                            const OndasPodcastScreen(
                                          imgTopo:
                                              'assets/images/topo_modulos_2_5_8.png',
                                          modulo: 'Módulo 05',
                                          miniatura:
                                              'assets/images/capa_podcast_2_5_8.png',
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
                                      'assets/images/ondas_1_modulos_2_5_8.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.27,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Módulo 05',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: Colors.white),
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
                                            const OndasPodcastScreen(
                                          imgTopo:
                                              'assets/images/topo_modulos_3_6.png',
                                          modulo: 'Módulo 06',
                                          miniatura:
                                              'assets/images/capa_podcast_3_6.png',
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
                                      'assets/images/ondas_1_modulos_3_6.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.27,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Módulo 06',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: Colors.white),
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
                                            const OndasPodcastScreen(
                                          imgTopo:
                                              'assets/images/topo_modulos_1_4_7.png',
                                          modulo: 'Módulo 07',
                                          miniatura:
                                              'assets/images/capa_podcast_1_4_7.png',
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
                                      'assets/images/ondas_1_modulos_1_4_7.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.27,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Módulo 07',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: Colors.white),
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
                                            const OndasPodcastScreen(
                                          imgTopo:
                                              'assets/images/topo_modulos_2_5_8.png',
                                          modulo: 'Módulo 08',
                                          miniatura:
                                              'assets/images/capa_podcast_2_5_8.png',
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
                                      'assets/images/ondas_1_modulos_2_5_8.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.27,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Módulo 08',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ]),
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
                                              const OndasVideoScreen(
                                                imgTopo:
                                                    'assets/images/topo_ondas_1_e_2.png',
                                                ano: '1 e 2',
                                                miniatura:
                                                    'assets/images/miniatura_1_e_2_ano.png',
                                              )));
                                },
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                    child: Image.asset(
                                      'assets/images/ondas_2_1_e_2_ano.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.27,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            '1º e 2º ano',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: Colors.white),
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
                                              const OndasVideoScreen(
                                                imgTopo:
                                                    'assets/images/topo_ondas_3.png',
                                                ano: '3',
                                                miniatura:
                                                    'assets/images/miniatura_3_ano.png',
                                              )));
                                },
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                    child: Image.asset(
                                      'assets/images/ondas_2_3_ano.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.27,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            '3º ano',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: Colors.white),
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
                                              const OndasVideoScreen(
                                                imgTopo:
                                                    'assets/images/topo_ondas_4_e_5.png',
                                                ano: '4 e 5',
                                                miniatura:
                                                    'assets/images/miniatura_4_e_5_ano.png',
                                              )));
                                },
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                    child: Image.asset(
                                      'assets/images/ondas_2_4_e_5_ano.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.27,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            '4º e 5º ano',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: Colors.white),
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
                                        height: proportionalImageHeight * 0.27,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.225) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Histórias',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  proportionalImageHeight *
                                                      0.045,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ]),
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
                            "Cadernos de Aprendizagem",
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
                                                  "Ondas 1.0 - 1º e 2º ano")));
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
                                              name: "Ondas 1.0 - 3º ano")));
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
                                              name: "Ondas 1.0 - 3º ano")));
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
                                                  "Ondas 2.0 - 1º e 2º ano")));
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
                                              name: "Ondas 2.0 - 3º ano")));
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
                                              name: "Ondas 2.0 - 3º ano")));
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
                    ],
                  ),
                ]),
              ],
            )
          ],
        ));
  }
}
