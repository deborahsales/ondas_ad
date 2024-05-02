import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/resultado.dart';
import '../data/database.dart';
import '../data/ondas_dao.dart';

class HabilidadeScreen extends StatefulWidget {
  const HabilidadeScreen({super.key});

  @override
  State<HabilidadeScreen> createState() => _HabilidadeScreenState();
}

class _HabilidadeScreenState extends State<HabilidadeScreen> {
  String? dropdownHabilidadeValue;
  String? descricao;
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
        title: const Text('Habilidade | BNCC'),
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
              'Habilidade BNCC:',
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
                    value: dropdownHabilidadeValue,
                    hint: const Text('Habilidade...'),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    isExpanded: true,
                    underline: Container(),
                    style: TextStyle(
                        fontSize: screenHeight * 0.023,
                        color: myBlack),
                    items: OndasDao.habilidadeList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? selectedValue) {
                      setState(
                        () {
                          dropdownHabilidadeValue = selectedValue;
                          _atualizarBusca();
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: myMargem),
              child: Container(
                decoration: BoxDecoration(
                  color: myWhite,
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                width: screenWidth * 0.95,
                child: _buscar
                    ? FutureBuilder<String>(
                        future:
                            OndasDao().getDescricao(dropdownHabilidadeValue!),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          String? items = snapshot.data;
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return const SizedBox();
                            case ConnectionState.waiting:
                              return const SizedBox();
                            case ConnectionState.active:
                              return const SizedBox();
                            case ConnectionState.done:
                              if (snapshot.hasData && items != null) {
                                if (items.isNotEmpty) {
                                  return Padding(
                                    padding: EdgeInsets.all(myMargem),
                                    child: Text(
                                      snapshot.data!,
                                      style: TextStyle(
                                        fontSize:
                                            screenHeight *
                                                0.025,
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox();
                              }
                              return const SizedBox();
                          }
                        },
                      )
                    : const SizedBox(),
              ),
            ),
          ),
          Expanded(
              child: _buscar
                  ? FutureBuilder<List<Resultado>>(
                      future:
                          OndasDao().getHabilidade(dropdownHabilidadeValue!),
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
