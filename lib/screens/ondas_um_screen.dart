import 'package:flutter/material.dart';
import 'package:ondas_ad/components/podcast.dart';
import 'package:ondas_ad/data/ondas_dao.dart';
import '../components/constants.dart';

class OndasUmScreen extends StatefulWidget {
  final String imgTopo;
  final String modulo;
  final String miniatura;

  const OndasUmScreen({super.key, required this.imgTopo, required this.modulo, required this.miniatura});

  @override
  State<OndasUmScreen> createState() => _OndasUmScreenState();
}

class _OndasUmScreenState extends State<OndasUmScreen> {

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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.38,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: myMargem,
                          ),
                          Text(
                            "Ondas 1.0 - ${widget.modulo}",
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      FutureBuilder<List<Podcast>>(
                        future: OndasDao().getPodcast('1.0', widget.modulo, widget.miniatura),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          List<Podcast>? items = snapshot.data;
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return const Center(
                                  child: Column(
                                    children: [SizedBox(height: 40,), CircularProgressIndicator(), Padding(
                                      padding: EdgeInsets.all(25.0),
                                      child: Text('Carregando',
                                          style: TextStyle(fontSize: 20)),
                                    )],
                                  ));
                            case ConnectionState.waiting:
                              return const Center(
                                  child: Column(
                                    children: [SizedBox(height: 40,), CircularProgressIndicator(), Padding(
                                      padding: EdgeInsets.all(25.0),
                                      child: Text('Carregando',
                                          style: TextStyle(fontSize: 20)),
                                    )],
                                  ));
                            case ConnectionState.active:
                              return const Center(
                                  child: Column(
                                    children: [SizedBox(height: 40,), CircularProgressIndicator(), Padding(
                                      padding: EdgeInsets.all(25.0),
                                      child: Text('Carregando',
                                          style: TextStyle(fontSize: 20)),
                                    )],
                                  ));
                            case ConnectionState.done:
                              if (snapshot.hasData && items != null) {
                                if (items.isNotEmpty) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.53,
                                    child: ListView.builder(
                                        itemCount: items.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          final Podcast resultado = items[index];
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
