import 'package:flutter/material.dart';
import 'package:ondas_ad/data/ondas_dao.dart';
import '../components/constants.dart';
import '../components/video_aula.dart';
import '../data/database.dart';

class OndasVideoScreen extends StatefulWidget {
  const OndasVideoScreen({super.key});

  @override
  State<OndasVideoScreen> createState() => _OndasVideoScreenState();
}

class _OndasVideoScreenState extends State<OndasVideoScreen> {
  String? dropdownModuloValue = OndasDao.moduloList.first;
  String? dropdownAnoValue = OndasDao.anoList.first;
  String anoFormatado = "";
  String imgTopo = 'assets/images/topo_ondas_2_1_e_2.png';
  String imgMiniatura = 'assets/images/miniatura_1_e_2_ano.png';

  void _atualizarBusca() {
    setState(() {
      imgTopo = dropdownAnoValue == '1º e 2º anos'
          ? 'assets/images/topo_ondas_2_1_e_2.png'
          : dropdownAnoValue == '3º ano'
              ? 'assets/images/topo_ondas_2_3.png'
              : 'assets/images/topo_ondas_2_4_e_5.png';
      imgMiniatura = dropdownAnoValue == '1º e 2º anos'
          ? 'assets/images/miniatura_1_e_2_ano.png'
          : dropdownAnoValue == '3º ano'
              ? 'assets/images/miniatura_3_ano.png'
              : 'assets/images/miniatura_4_e_5_ano.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 1953.0 / 2418.0;
    double proportionalImageHeight = screenWidth * aspectRatio;

    return Scaffold(
      backgroundColor: myWhite,
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
                              width: screenWidth * 0.45,
                              height: screenWidth * 0.1,
                              decoration: BoxDecoration(
                                color: myGray,
                                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: myMargem,
                                    top: myMargem2,
                                    bottom: myMargem2,
                                    right: myMargem2),
                                child: DropdownButton(
                                  value: dropdownAnoValue,
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded),
                                  isExpanded: true,
                                  underline: Container(),
                                  style: TextStyle(
                                      fontSize: screenHeight * 0.023,
                                      color: myBlack),
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
                              width: screenWidth * 0.45,
                              height: screenWidth * 0.1,
                              decoration: BoxDecoration(
                                color: myGray,
                                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: myMargem,
                                    top: myMargem2,
                                    bottom: myMargem2,
                                    right: myMargem2),
                                child: DropdownButton(
                                  value: dropdownModuloValue,
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded),
                                  isExpanded: true,
                                  underline: Container(),
                                  style: TextStyle(
                                      fontSize: screenHeight * 0.023,
                                      color: myBlack),
                                  items:
                                      OndasDao.moduloList.map((String value) {
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
                        future: OndasDao().getModuloAno(dropdownModuloValue!,
                            dropdownAnoValue!, imgMiniatura),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          List<VideoAula>? items = snapshot.data;
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.055,
                                  ),
                                  const CircularProgressIndicator(),
                                  Padding(
                                    padding: EdgeInsets.all(myMargem),
                                    child: Text('Carregando',
                                        style: TextStyle(fontSize: screenWidth * 0.02)),
                                  )
                                ],
                              ));
                            case ConnectionState.waiting:
                              return Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.055,
                                  ),
                                  const CircularProgressIndicator(),
                                  Padding(
                                    padding: EdgeInsets.all(myMargem),
                                    child: Text('Carregando',
                                        style: TextStyle(fontSize: screenWidth * 0.02)),
                                  )
                                ],
                              ));
                            case ConnectionState.active:
                              return Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.055,
                                  ),
                                  const CircularProgressIndicator(),
                                  Padding(
                                    padding: EdgeInsets.all(myMargem),
                                    child: Text('Carregando',
                                        style: TextStyle(fontSize: screenWidth * 0.02)),
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
                                return Center(
                                  child: Column(
                                    children: [
                                      Icon(Icons.error_outline, size: screenHeight * 0.13),
                                      Text('Não há nenhum resultado',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: screenWidth * 0.02))
                                    ],
                                  ),
                                );
                              }
                              deleteDatabase();
                              OndasDao().insertDataFromCSV();
                              return Center(
                                child: Column(
                                  children: [
                                    Icon(Icons.report_gmailerrorred, size: screenHeight * 0.13),
                                    Text('Erro ao carregar resultados',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: screenWidth * 0.02)),
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
