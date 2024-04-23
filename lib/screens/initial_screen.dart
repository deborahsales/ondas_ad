import 'package:flutter/material.dart';
import 'package:ondas_ad/screens/ondas_dois_screen.dart';
import 'package:ondas_ad/screens/podcast_screen.dart';
import '../components/constants.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: MediaQuery.of(context).size.height * 0.58,
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
                              top: myMargem, bottom: myMargem, left: myMargem),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PodcastScreen(image: 'assets/images/capa_podcast_1.png', titulo: 'Aula 1 - CIE - Higienização dos alimentos', podcastLink: 'https://drive.usercontent.google.com/u/0/uc?id=1qvGSbtEZhEwloawXf3YAAUoZgOaw5vH4&export=download',),));
                            },
                            child: Image.asset(
                              'assets/images/ondas_1_modulo_1.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: myMargem, bottom: myMargem, left: myMargem),
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/ondas_1_modulo_2.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: myMargem, bottom: myMargem, left: myMargem),
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/ondas_1_modulo_3.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: myMargem, bottom: myMargem, left: myMargem),
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/ondas_1_modulo_4.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 12, left: 12),
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/ondas_1_modulo_5.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: myMargem, bottom: myMargem, left: myMargem),
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/ondas_1_modulo_6.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: myMargem, bottom: myMargem, left: myMargem),
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/ondas_1_modulo_7.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: myMargem, bottom: myMargem, left: myMargem),
                          child: InkWell(
                            onTap: () {},
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
                              top: myMargem, bottom: myMargem, left: myMargem),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OndasDoisScreen(
                                            imgTopo:
                                                'assets/images/topo_ondas_1_e_2.png',
                                            ano: '1 e 2', miniatura: 'assets/images/miniatura_1_e_2_ano.png',
                                          )));
                            },
                            child: Image.asset(
                              'assets/images/ondas_2_1_e_2_ano.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: myMargem, bottom: myMargem, left: myMargem),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const OndasDoisScreen(
                                        imgTopo:
                                        'assets/images/topo_ondas_3.png',
                                        ano: '3', miniatura: 'assets/images/miniatura_3_ano.png',
                                      )));
                            },
                            child: Image.asset(
                              'assets/images/ondas_2_3_ano.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: myMargem, bottom: myMargem, left: myMargem),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const OndasDoisScreen(
                                        imgTopo:
                                        'assets/images/topo_ondas_4_e_5.png',
                                        ano: '4 e 5', miniatura: 'assets/images/miniatura_4_e_5_ano.png',
                                      )));
                            },
                            child: Image.asset(
                              'assets/images/ondas_2_4_e_5_ano.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: myMargem, bottom: myMargem, left: myMargem),
                          child: InkWell(
                            onTap: () {},
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
