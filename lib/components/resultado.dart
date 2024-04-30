import 'package:flutter/material.dart';

import 'constants.dart';

class Resultado extends StatefulWidget {
  final String tituloUm;
  final String tituloDois;
  final String dadosUm;
  final String dadosDois;
  final String dadosExpandidos;

  const Resultado(
      {super.key, required this.dadosDois, required this.tituloUm, required this.tituloDois, required this.dadosUm, required this.dadosExpandidos});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  bool expandedValidator = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: myMargem,
        left: myMargem,
        right: myMargem,
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.065,
            decoration: BoxDecoration(
                color: myBlue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        MediaQuery.of(context).size.width * 0.02),
                    topRight: Radius.circular(
                        MediaQuery.of(context).size.width * 0.02))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.tituloUm,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height * 0.025,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.tituloDois,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height * 0.025,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(myMargem),
              child: Text(
                widget.dadosUm,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(myMargem),
              child: Text(
                widget.dadosDois,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        MediaQuery.of(context).size.width * 0.02),
                    bottomRight: Radius.circular(
                        MediaQuery.of(context).size.width * 0.02))),
            child: ExpansionTile(
              onExpansionChanged: (expanded) {
                setState(() {
                  expandedValidator = expanded;
                });
              },
              title: const Text('Mais informações...'),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(myMargem),
                  child: Text(widget.dadosExpandidos,
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.height * 0.02)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
