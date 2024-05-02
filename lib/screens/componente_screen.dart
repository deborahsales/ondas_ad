import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/resultado.dart';
import '../data/database.dart';
import '../data/ondas_dao.dart';

class ComponenteScreen extends StatefulWidget {
  const ComponenteScreen({super.key});

  @override
  State<ComponenteScreen> createState() => _ComponenteScreenState();
}

class _ComponenteScreenState extends State<ComponenteScreen> {
  String? dropdownComponenteValue;
  String? dropdownAnoValue;
  bool _buscar = false;

  void _atualizarBusca() {
    setState(() {
      _buscar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPurple,
      appBar: AppBar(
        title: const Text('Componente | Ano'),
        backgroundColor: myWhite,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: myMargem,
          ),
          Padding(
            padding: EdgeInsets.only(left: myMargem, bottom: myMargem2),
            child: Text(
              'Componente curricular:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * 0.025,
                  color: myWhite),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: myMargem2,
                bottom: myMargem,
              ),
              child: Container(
                width: screenWidth * 0.95,
                height: screenWidth * 0.1,
                decoration: BoxDecoration(
                  color: myWhite,
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: myMargem,
                      top: myMargem2,
                      bottom: myMargem2,
                      right: myMargem2),
                  child: DropdownButton(
                    hint: const Text('Componente curricular...'),
                    value: dropdownComponenteValue,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    isExpanded: true,
                    underline: Container(),
                    style: TextStyle(
                        fontSize: screenHeight * 0.023, color: myBlack),
                    items: OndasDao.componenteList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? selectedValue) {
                      setState(
                        () {
                          dropdownComponenteValue = selectedValue;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: myMargem),
            child: Text(
              'Ano:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * 0.025,
                  color: myWhite),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: myMargem),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: myMargem2,
                  ),
                  child: Container(
                    width: screenWidth * 0.4,
                    height: screenWidth * 0.1,
                    decoration: BoxDecoration(
                      color: myWhite,
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: myMargem,
                          top: myMargem2,
                          bottom: myMargem2,
                          right: myMargem2),
                      child: DropdownButton(
                        hint: const Text('Ano...'),
                        value: dropdownAnoValue,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        isExpanded: true,
                        underline: Container(),
                        style: TextStyle(
                            fontSize: screenHeight * 0.023, color: myBlack),
                        items: OndasDao.anoPlanilhaList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? selectedValue) {
                          setState(
                            () {
                              dropdownAnoValue = selectedValue;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: myMargem, bottom: myMargem2),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: screenWidth * 0.1,
                      ),
                      onPressed: () {
                        setState(() {
                          if (dropdownAnoValue != null &&
                              dropdownComponenteValue != null) {
                            _atualizarBusca();
                          }
                        });
                      },
                      color: myWhite,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: _buscar
                  ? FutureBuilder<List<Resultado>>(
                      future: OndasDao().getComponenteAno(
                          dropdownComponenteValue!, dropdownAnoValue!),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        List<Resultado>? items = snapshot.data;
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
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.02)),
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
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.02)),
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
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.02)),
                                )
                              ],
                            ));
                          case ConnectionState.done:
                            if (snapshot.hasData && items != null) {
                              if (items.isNotEmpty) {
                                return ListView.builder(
                                    itemCount: items.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final Resultado resultado = items[index];
                                      return resultado;
                                    });
                              }
                              return Center(
                                child: Column(
                                  children: [
                                    Icon(Icons.error_outline,
                                        size: screenHeight * 0.13),
                                    Text('Não há nenhum resultado',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.02))
                                  ],
                                ),
                              );
                            }
                            deleteDatabase();
                            OndasDao().insertDataFromCSV();
                            return Center(
                              child: Column(
                                children: [
                                  Icon(Icons.report_gmailerrorred,
                                      size: screenHeight * 0.13),
                                  Text('Erro ao carregar resultados',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.02)),
                                ],
                              ),
                            );
                        }
                      },
                    )
                  : const SizedBox()),
          SizedBox(
            height: myMargem,
          )
        ],
      ),
    );
  }
}
