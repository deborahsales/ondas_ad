import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/resultado.dart';
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
        backgroundColor: Colors.white,
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
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  color: Colors.white),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: myMargem2,
                bottom: myMargem,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
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
                        fontSize: MediaQuery.of(context).size.height * 0.023,
                        color: Colors.black),
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
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  color: Colors.white),
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
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
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
                            fontSize:
                                MediaQuery.of(context).size.height * 0.023,
                            color: Colors.black),
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
                  padding: EdgeInsets.only(
                      left: myMargem, bottom: myMargem2),
                  child: Center(
                    child: IconButton(
                        icon: Icon(Icons.search, size: MediaQuery.of(context).size.width * 0.1,),
                        onPressed: () { setState(() {
                          if (dropdownAnoValue != null && dropdownComponenteValue != null) {
                            _atualizarBusca();
                          }
                        });},
                        color: Colors.white,),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: _buscar
                  ? FutureBuilder<List<Resultado>>(
                      future: OndasDao().getPlanilha(
                          dropdownComponenteValue!, dropdownAnoValue!),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        List<Resultado>? items = snapshot.data;
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
                                      style: TextStyle(fontSize: 18)),
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
                                      style: TextStyle(fontSize: 18)),
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
                                      style: TextStyle(fontSize: 18)),
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
                              return const Center(
                                child: Column(
                                  children: [
                                    Icon(Icons.error_outline, size: 110),
                                    Text('Não há nenhum resultado',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 18))
                                  ],
                                ),
                              );
                            }
                            return const Center(
                              child: Column(
                                children: [
                                  Icon(Icons.report_gmailerrorred, size: 110),
                                  Text('Erro ao carregar resultados',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18)),
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
