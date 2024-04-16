import 'package:flutter/material.dart';
import 'package:ondas_ad/screens/primeiro_ano_screen.dart';

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
                            onTap: () {},
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
                                          const PrimeiroAnoScreen()));
                            },
                            child: Image.asset(
                              'assets/images/ondas_2_1_ano.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: myMargem, bottom: myMargem, left: myMargem),
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/ondas_2_2_ano.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: myMargem, bottom: myMargem, left: myMargem),
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/ondas_2_3_ano.png',
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
