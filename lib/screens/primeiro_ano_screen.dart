import 'package:flutter/material.dart';
import 'package:ondas_ad/data/ondas_dao.dart';

import '../components/constants.dart';
import '../components/video_aula.dart';

class PrimeiroAnoScreen extends StatefulWidget {
  const PrimeiroAnoScreen({super.key});

  @override
  State<PrimeiroAnoScreen> createState() => _PrimeiroAnoScreenState();
}

class _PrimeiroAnoScreenState extends State<PrimeiroAnoScreen> {
  String? dropdownValue = OndasDao.moduloList.first;
  bool _buscar = false;

  void _atualizarBusca() {
    setState(() {
      _buscar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/topo_ondas_2.png',
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.38,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: myMargem,
                          ),
                          Text(
                            "Ondas 1.0 - 1º ano",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(myMargem),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                            color: myGray,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 8, bottom: 8, right: 8),
                            child: DropdownButton(
                              value: dropdownValue,
                              icon:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                              isExpanded: true,
                              underline: Container(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                              items: OndasDao.moduloList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? selectedValue) {
                                setState(
                                  () {
                                    dropdownValue = selectedValue;
                                    _atualizarBusca();
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const VideoAula(
                        image: 'assets/images/miniatura_1_ano.png',
                        titulo: 'Aula 1 - CIE\nAlimentação saudável',
                        videoId: 'b7Qepod1uQM',
                      ),
                      const VideoAula(
                        image: 'assets/images/miniatura_1_ano.png',
                        titulo: 'Aula 1 - CIE\nAlimentação saudável',
                        videoId: 'b7Qepod1uQM',
                      ),
                      const VideoAula(
                        image: 'assets/images/miniatura_1_ano.png',
                        titulo: 'Aula 1 - CIE\nAlimentação saudável',
                        videoId: 'b7Qepod1uQM',
                      ),
                      const VideoAula(
                        image: 'assets/images/miniatura_1_ano.png',
                        titulo: 'Aula 1 - CIE\nAlimentação saudável',
                        videoId: 'b7Qepod1uQM',
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
