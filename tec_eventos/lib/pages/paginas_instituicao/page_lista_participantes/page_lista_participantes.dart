import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/models/inscritos_evento_model.dart';
import 'package:tec_eventos/repositories/inscritos_repository.dart';
import 'package:tec_eventos/repositories/presentes_repository.dart';

class PageListaParticipantes extends StatefulWidget {
  const PageListaParticipantes({super.key});

  @override
  State<PageListaParticipantes> createState() => _PageListaParticipantesState();
}

class _PageListaParticipantesState extends State<PageListaParticipantes> {
  List<InscritosEventosModel> selecionadas = [];
  final listPresenca = InscritosRepository.listPresenca;
  late PresentesRepository presentes;

  @override
  Widget build(BuildContext context) {
    presentes = Provider.of<PresentesRepository>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cores.branco,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            size: 20,
            color: Cores.preto,
          ),
        ),
        title: Text(
          "LISTA",
          style: TextStyle(
            fontFamily: Fontes.raleway,
            fontWeight: FontWeight.w600,
            color: Cores.preto,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.qr_code_2_outlined,
              color: Cores.preto,
            ),
          )
        ],
        bottom: PreferredSize(
            preferredSize: const Size(0, 50),
            child: Center(
                child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Cores.azul1565C0,
                  ),
                ),
              ),
              child: Text(
                "Participantes",
                style: TextStyle(
                  fontFamily: Fontes.ralewayBold,
                  color: Cores.preto,
                  fontSize: 20,
                ),
              ),
            ))),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: ListView.separated(
                itemBuilder: (BuildContext context, int inscritos) {
                  return ListTile(
                    selected: selecionadas.contains(listPresenca[inscritos]),
                    selectedTileColor: Colors.indigo[50],
                    onTap: () {
                      setState(() {
                        (selecionadas.contains(listPresenca[inscritos]))
                            ? selecionadas.remove(listPresenca[inscritos])
                            : selecionadas.add(listPresenca[inscritos]);
                      });

                      print(selecionadas);
                    },
                    autofocus: true,
                    dense: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                          color: Cores.preto,
                        )),
                    visualDensity: VisualDensity.comfortable,
                    titleAlignment: ListTileTitleAlignment.center,
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage("assets/imgPerfil.png"),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          listPresenca[inscritos].nomeAluno,
                          style: TextStyle(
                            color: Cores.preto,
                            fontFamily: Fontes.raleway,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          " - ${listPresenca[inscritos].rmAluno}",
                          style: TextStyle(
                            color: Cores.preto,
                            fontFamily: Fontes.inter,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        if (presentes.lista
                            .contains(listPresenca[inscritos])) ...[
                          Icon(
                            Icons.circle,
                            color: Cores.azul42A5F5,
                            size: 8,
                          )
                        ]
                      ],
                    ),
                    subtitle: Text(
                      "Aluno",
                      style: TextStyle(
                        color: Cores.preto,
                        fontFamily: Fontes.raleway,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    trailing: selecionadas.contains(listPresenca[inscritos])
                        ? CircleAvatar(
                            backgroundColor: Cores.verde,
                            child: Icon(Icons.check, color: Cores.branco),
                          )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 100))
                        : null,
                  );
                },
                padding: const EdgeInsets.all(16),
                separatorBuilder: (_, __) => Divider(),
                itemCount: listPresenca.length),
          ),
          OutlinedButton(
              onPressed: () {
                presentes.saveAll(selecionadas);
                // setState(() {
                //   selecionadas = [];
                // });
              },
              child: Text("Iniciar evento")),
          Text("Presenças confirmadas"),
          Consumer<PresentesRepository>(builder: (context, presentes, child) {
            return presentes.lista.isEmpty
                ? const ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Evento não iniciado"),
                  )
                : Container(
                    height: 300,
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return CardPresencaConfirmada(
                              inscritos: presentes.lista[index]);
                        },
                        separatorBuilder: (_, __) => Divider(),
                        itemCount: presentes.lista.length),
                  );

            // : Column(
            //     children: [
            //       Expanded(
            //         child: ListView.builder(
            //             itemCount: presentes.lista.length,
            //             itemBuilder: (_, index) {
            //               return Text('oi');
            //             }),
            //       ),
            //     ],
            //   );
          }),
        ],
      ),
    );
  }
}

class CardPresencaConfirmada extends StatefulWidget {
  InscritosEventosModel inscritos;

  CardPresencaConfirmada({super.key, required this.inscritos});

  @override
  State<CardPresencaConfirmada> createState() => _CardPresencaConfirmadaState();
}

class _CardPresencaConfirmadaState extends State<CardPresencaConfirmada> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1,
      child: ListTile(
        autofocus: true,
        dense: true,
        visualDensity: VisualDensity.comfortable,
        titleAlignment: ListTileTitleAlignment.center,
        leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/imgPerfil.png"),
        ),
        title: Row(
          children: [
            Text(
              widget.inscritos.nomeAluno,
              style: TextStyle(
                color: Cores.preto,
                fontFamily: Fontes.raleway,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            Text(
              " - ${widget.inscritos.rmAluno}",
              style: TextStyle(
                color: Cores.preto,
                fontFamily: Fontes.raleway,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
        subtitle: Text(
          "Aluno",
          style: TextStyle(
            color: Cores.preto,
            fontFamily: Fontes.raleway,
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
        trailing: Icon(
          Icons.check_rounded,
          size: 30,
          color: Cores.verde,
        ),
      ),
    );
  }
}
