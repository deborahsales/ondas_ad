import 'package:flutter/material.dart';
import 'package:ondas_ad/components/podcast.dart';
import 'package:ondas_ad/data/ondas_dao.dart';
import '../components/constants.dart';

class OndasPodcastScreen extends StatefulWidget {
  final String imgTopo;
  final String modulo;
  final String miniatura;
  final String versao;

  const OndasPodcastScreen({super.key, required this.imgTopo, required this.modulo, required this.miniatura, required this.versao});

  @override
  State<OndasPodcastScreen> createState() => _OndasPodcastScreenState();
}

class _OndasPodcastScreenState extends State<OndasPodcastScreen> {

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
                            "Ondas ${widget.versao} - ${widget.modulo}",
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      FutureBuilder<List<Podcast>>(
                        future: OndasDao().getPodcast(widget.versao, '', widget.modulo, widget.miniatura),
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
