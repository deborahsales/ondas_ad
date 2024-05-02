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
                  Image.asset(
                    widget.imgTopo,
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
                              value: dropdownValue,
                              icon:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                              isExpanded: true,
                              underline: Container(),
                              style: TextStyle(
                                  fontSize: screenHeight * 0.023,
                                  color: myBlack),
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
                        future: OndasDao().getPodcast(widget.versao, '',
                            dropdownValue!, widget.miniatura),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          List<Podcast>? items = snapshot.data;
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
                                        style: TextStyle(fontSize: screenHeight * 0.02)),
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
                                        style: TextStyle(fontSize: screenHeight * 0.02)),
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
                                        style: TextStyle(fontSize: screenHeight * 0.02)),
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
                                return Center(
                                  child: Column(
                                    children: [
                                      Icon(Icons.error_outline, size: screenHeight * 0.13),
                                      Text('Não há nenhum resultado',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: screenHeight * 0.02))
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
                                        style: TextStyle(fontSize: screenHeight * 0.02)),
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
