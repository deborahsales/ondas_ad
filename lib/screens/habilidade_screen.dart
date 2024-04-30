import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/resultado.dart';
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
              'Habilidade BNCC:',
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
                    value: dropdownHabilidadeValue,
                    hint: const Text('Habilidade...'),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    isExpanded: true,
                    underline: Container(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.023,
                        color: Colors.black),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: MediaQuery.of(context).size.width * 0.95,
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
                                            MediaQuery.of(context).size.height *
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
