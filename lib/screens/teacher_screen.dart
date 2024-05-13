import 'package:flutter/material.dart';
import 'package:ondas_ad/screens/habilidade_screen.dart';
import 'package:ondas_ad/screens/pdf_viewer_screen.dart';
import 'package:ondas_ad/screens/componente_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/constants.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 2068.0 / 1748.0;
    double proportionalImageHeight = screenWidth * aspectRatio;
    final librasUri =
        Uri.parse('https://www.youtube.com/@ee11deagostoaju-se20');
    final ondasUri = Uri.parse('https://www.ondasdoauladigital.org/');

    return Scaffold(
        backgroundColor: myWhite,
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
                      color: myWhite,
                      size: screenHeight * 0.035,
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
                              myWhite,
                              myWhite,
                              myTransparent,
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
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 0.02),
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
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 0.02),
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
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 0.02),
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
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 0.02),
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
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 0.02),
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
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 0.02),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: myMargem,
                          ),
                          Text(
                            "Recursos Avançados",
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
                                          builder: (context) =>
                                              const ComponenteScreen()));
                                },
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        screenWidth * 0.02),
                                    child: Image.asset(
                                      'assets/images/busca_componente.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.23,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.39) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Componente | Ano',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: myWhite),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
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
                                              const HabilidadeScreen()));
                                },
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        screenWidth * 0.02),
                                    child: Image.asset(
                                      'assets/images/busca_bncc.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.23,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.39) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Habilidade | BNCC',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: myWhite),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: myMargem2,
                                  bottom: myMargem2,
                                  left: myMargem),
                              child: InkWell(
                                onTap: () async {
                                  if (await canLaunchUrl(librasUri)) {
                                    await launchUrl(librasUri,
                                        mode: LaunchMode.externalApplication);
                                  }
                                },
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        screenWidth * 0.02),
                                    child: Image.asset(
                                      'assets/images/libras.png',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: proportionalImageHeight * 0.23,
                                      ),
                                      SizedBox(
                                        width:
                                            (proportionalImageHeight * 0.39) *
                                                aspectRatio,
                                        child: Center(
                                          child: Text(
                                            'Libras',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    proportionalImageHeight *
                                                        0.045,
                                                color: myWhite),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: myMargem,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: myMargem2),
                        child: TextButton(
                            onPressed: () async {
                              if (await canLaunchUrl(ondasUri)) {
                                await launchUrl(ondasUri,
                                    mode: LaunchMode.externalApplication);
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  'Para mais recursos, acesse o nosso site',
                                  style: TextStyle(
                                      fontSize: screenHeight * 0.021,
                                      color: myBlack),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(myMargem2),
                                  child: const Icon(Icons.open_in_new, color: myBlack,),
                                ),
                              ],
                            )),
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
