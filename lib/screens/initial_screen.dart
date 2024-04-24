import 'package:flutter/material.dart';
import 'package:ondas_ad/screens/ondas_podcast_screen.dart';
import '../components/constants.dart';
import 'ondas_hist_screen.dart';
import 'ondas_video_screen..dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: myMargem,
                          ),
                          Text(
                            "Ondas 1.0",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 185,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: myMargem,
                                  bottom: myMargem,
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
                                child: Image.asset(
                                  'assets/images/ondas_1_modulo_1.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: myMargem,
                                  bottom: myMargem,
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
                                child: Image.asset(
                                  'assets/images/ondas_1_modulo_2.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: myMargem,
                                  bottom: myMargem,
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
                                child: Image.asset(
                                  'assets/images/ondas_1_modulo_3.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: myMargem,
                                  bottom: myMargem,
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
                                child: Image.asset(
                                  'assets/images/ondas_1_modulo_4.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, bottom: 12, left: 12),
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
                                child: Image.asset(
                                  'assets/images/ondas_1_modulo_5.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: myMargem,
                                  bottom: myMargem,
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
                                child: Image.asset(
                                  'assets/images/ondas_1_modulo_6.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: myMargem,
                                  bottom: myMargem,
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
                                child: Image.asset(
                                  'assets/images/ondas_1_modulo_7.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: myMargem,
                                  bottom: myMargem,
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
                                child: Image.asset(
                                  'assets/images/ondas_1_modulo_8.png',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: myMargem,
                            ),
                          ],
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: myMargem,
                          ),
                          Text(
                            "Ondas 2.0",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 185,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: myMargem,
                                  bottom: myMargem,
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
                                child: Image.asset(
                                  'assets/images/ondas_2_1_e_2_ano.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: myMargem,
                                  bottom: myMargem,
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
                                child: Image.asset(
                                  'assets/images/ondas_2_3_ano.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: myMargem,
                                  bottom: myMargem,
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
                                child: Image.asset(
                                  'assets/images/ondas_2_4_e_5_ano.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: myMargem,
                                  bottom: myMargem,
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
                                child: Image.asset(
                                  'assets/images/ondas_2_historias.png',
                                ),
                              ),
                            ),
                            const SizedBox(
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
