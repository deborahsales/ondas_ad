import 'package:flutter/material.dart';
import 'package:ondas_ad/components/podcast.dart';
import 'package:ondas_ad/data/database.dart';
import 'package:ondas_ad/data/ondas_dao.dart';
import '../components/constants.dart';

class OndasPodcastScreen extends StatefulWidget {
  final String imgTopo;
  final String miniatura;
  final String versao;

  const OndasPodcastScreen(
      {super.key,
      required this.imgTopo,
      required this.miniatura,
      required this.versao});

  @override
  State<OndasPodcastScreen> createState() => _OndasPodcastScreenState();
}

class _OndasPodcastScreenState extends State<OndasPodcastScreen> {
  String? dropdownValue = OndasDao.moduloList.first;
  bool _buscar = false;

  void _atualizarBusca() {
    setState(() {
      _buscar = true;
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
                  Image.asset(
                    widget.imgTopo,
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
                            "Ondas ${widget.versao} - Podcasts",
                            style: TextStyle(
                              fontSize: screenHeight * 0.03,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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
                              value: dropdownValue,
                              icon:
                              const Icon(Icons.keyboard_arrow_down_rounded),
                              isExpanded: true,
                              underline: Container(),
                              style: TextStyle(
                                  fontSize: screenHeight * 0.023,
                                  color: Colors.black),
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
                      FutureBuilder<List<Podcast>>(
                        future: OndasDao().getPodcast(
                            widget.versao, '', dropdownValue!, widget.miniatura),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          List<Podcast>? items = snapshot.data;
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
                                          final Podcast resultado =
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
