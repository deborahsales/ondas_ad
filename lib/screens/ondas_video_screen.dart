import 'package:flutter/material.dart';
import 'package:ondas_ad/data/ondas_dao.dart';
import '../components/constants.dart';
import '../components/video_aula.dart';
import '../data/database.dart';

class OndasVideoScreen extends StatefulWidget {

  const OndasVideoScreen(
      {super.key});

  @override
  State<OndasVideoScreen> createState() => _OndasVideoScreenState();
}

class _OndasVideoScreenState extends State<OndasVideoScreen> {
  String? dropdownModuloValue = OndasDao.moduloList.first;
  String? dropdownAnoValue = OndasDao.anoList.first;
  bool _buscar = false;
  String anoFormatado = "";
  String imgTopo = 'assets/images/topo_ondas_2_1_e_2.png';
  String imgMiniatura = 'assets/images/miniatura_1_e_2_ano.png';

  void _atualizarBusca() {
    setState(() {
      _buscar = true;
      imgTopo = dropdownAnoValue == '1º e 2º anos' ? 'assets/images/topo_ondas_2_1_e_2.png' : dropdownAnoValue == '3º ano' ? 'assets/images/topo_ondas_2_3.png' : 'assets/images/topo_ondas_2_4_e_5.png';
      imgMiniatura = dropdownAnoValue == '1º e 2º anos' ? 'assets/images/miniatura_1_e_2_ano.png' : dropdownAnoValue == '3º ano' ? 'assets/images/miniatura_3_ano.png' : 'assets/images/miniatura_4_e_5_ano.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = 1953.0 / 2418.0;
    double proportionalImageHeight = screenWidth * aspectRatio;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.asset(imgTopo),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Ondas 2.0 - Desenhos animados",
                            style: TextStyle(
                              fontSize: screenHeight * 0.029,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: myMargem,
                              top: myMargem2,
                              bottom: myMargem,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                color: myGray,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: myMargem,
                                    top: myMargem2,
                                    bottom: myMargem2,
                                    right: myMargem2),
                                child: DropdownButton(
                                  value: dropdownAnoValue,
                                  icon:
                                      const Icon(Icons.keyboard_arrow_down_rounded),
                                  isExpanded: true,
                                  underline: Container(),
                                  style: TextStyle(
                                      fontSize: screenHeight * 0.023, color: Colors.black),
                                  items: OndasDao.anoList.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? selectedValue) {
                                    setState(
                                      () {
                                        dropdownAnoValue = selectedValue;
                                        _atualizarBusca();
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: myMargem,
                              top: myMargem2,
                              bottom: myMargem,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                color: myGray,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: myMargem,
                                    top: myMargem2,
                                    bottom: myMargem2,
                                    right: myMargem2),
                                child: DropdownButton(
                                  value: dropdownModuloValue,
                                  icon:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                                  isExpanded: true,
                                  underline: Container(),
                                  style: TextStyle(
                                      fontSize: screenHeight * 0.023, color: Colors.black),
                                  items: OndasDao.moduloList.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? selectedValue) {
                                    setState(
                                          () {
                                        dropdownModuloValue = selectedValue;
                                        _atualizarBusca();
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      FutureBuilder<List<VideoAula>>(
                        future: OndasDao().getModuloAno(
                            dropdownModuloValue!, dropdownAnoValue!, imgMiniatura),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          List<VideoAula>? items = snapshot.data;
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return const Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  CircularProgressIndicator(),
                                  Padding(
                                    padding: EdgeInsets.all(25.0),
                                    child: Text('Carregando',
                                        style: TextStyle(fontSize: 20)),
                                  )
                                ],
                              ));
                            case ConnectionState.waiting:
                              return const Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  CircularProgressIndicator(),
                                  Padding(
                                    padding: EdgeInsets.all(25.0),
                                    child: Text('Carregando',
                                        style: TextStyle(fontSize: 20)),
                                  )
                                ],
                              ));
                            case ConnectionState.active:
                              return const Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  CircularProgressIndicator(),
                                  Padding(
                                    padding: EdgeInsets.all(25.0),
                                    child: Text('Carregando',
                                        style: TextStyle(fontSize: 20)),
                                  )
                                ],
                              ));
                            case ConnectionState.done:
                              if (snapshot.hasData && items != null) {
                                if (items.isNotEmpty) {
                                  return SizedBox(
                                    height: screenHeight -
                                        proportionalImageHeight -
                                        (screenHeight * 0.12),
                                    child: ListView.builder(
                                        itemCount: items.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final VideoAula resultado =
                                              items[index];
                                          return resultado;
                                        }),
                                  );
                                }
                                return const Center(
                                  child: Column(
                                    children: [
                                      Icon(Icons.error_outline, size: 110),
                                      Text('Não há nenhum resultado',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 28))
                                    ],
                                  ),
                                );
                              }
                              deleteDatabase();
                              OndasDao().insertDataFromCSV();
                              return const Center(
                                child: Column(
                                  children: [
                                    Icon(Icons.report_gmailerrorred, size: 110),
                                    Text('Erro ao carregar resultados',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 28)),
                                  ],
                                ),
                              );
                          }
                        },
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
