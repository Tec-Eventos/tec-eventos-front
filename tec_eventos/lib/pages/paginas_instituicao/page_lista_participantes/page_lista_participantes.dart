import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/data/models/inscritos_evento_model.dart';
import 'package:tec_eventos/data/repositories/inscritos_repository.dart';
import 'package:tec_eventos/data/repositories/presentes_repository.dart';

/// Tela da instituição para visualizar a lista de participantes inscritos em um evento
/// e controlar o lançamento de presenças em tempo real.
class PageListaParticipantes extends StatefulWidget {
  /// Construtor padrão da tela.
  const PageListaParticipantes({super.key});

  @override
  State<PageListaParticipantes> createState() => _PageListaParticipantesState();
}

class _PageListaParticipantesState extends State<PageListaParticipantes> {
  final List<InscritosEventosModel> selecionadas = [];
  late List<InscritosEventosModel> listPresenca;

  late PresentesRepository presentes;
  late InscritosRepository inscritosRepository;

  @override
  Widget build(BuildContext context) {
    presentes = Provider.of<PresentesRepository>(context);
    inscritosRepository = Provider.of<InscritosRepository>(context);
    listPresenca = inscritosRepository.listPresenca;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cores.branco,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            size: 20,
            color: Cores.preto,
          ),
        ),
        title: const Text(
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
            icon: const Icon(
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
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Cores.azul1565C0,
                  ),
                ),
              ),
              child: const Text(
                "Participantes",
                style: TextStyle(
                  fontFamily: Fontes.ralewayBold,
                  color: Cores.preto,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 200,
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final item = listPresenca[index];
                final isSelected = selecionadas.contains(item);

                return ListTile(
                  selected: isSelected,
                  selectedTileColor: Colors.indigo[50],
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selecionadas.remove(item);
                      } else {
                        selecionadas.add(item);
                      }
                    });
                  },
                  autofocus: true,
                  dense: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Cores.preto,
                    ),
                  ),
                  visualDensity: VisualDensity.comfortable,
                  titleAlignment: ListTileTitleAlignment.center,
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/imgPerfil.png"),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        item.nomeAluno,
                        style: const TextStyle(
                          color: Cores.preto,
                          fontFamily: Fontes.raleway,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        " - ${item.rmAluno}",
                        style: const TextStyle(
                          color: Cores.preto,
                          fontFamily: Fontes.inter,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      if (presentes.lista.contains(item)) ...[
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.circle,
                          color: Cores.azul42A5F5,
                          size: 8,
                        )
                      ]
                    ],
                  ),
                  subtitle: const Text(
                    "Aluno",
                    style: TextStyle(
                      color: Cores.preto,
                      fontFamily: Fontes.raleway,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  trailing: isSelected
                      ? CircleAvatar(
                          backgroundColor: Cores.verde,
                          child: const Icon(Icons.check, color: Cores.branco),
                        ).animate().fade(duration: const Duration(milliseconds: 100))
                      : null,
                );
              },
              padding: const EdgeInsets.only(top: 10),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: listPresenca.length,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              presentes.saveAll(selecionadas);
            },
            child: const Text("Iniciar evento"),
          ),
          const SizedBox(height: 30),
          const Text(
            "Presenças confirmadas",
            style: TextStyle(
              fontFamily: Fontes.ralewayBold,
              fontSize: 16,
              color: Cores.preto,
            ),
          ),
          const SizedBox(height: 10),
          Consumer<PresentesRepository>(
            builder: (context, repo, child) {
              return repo.lista.isEmpty
                  ? const ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Evento não iniciado"),
                    )
                  : SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return CardPresencaConfirmada(
                            inscritos: repo.lista[index],
                          );
                        },
                        itemCount: repo.lista.length,
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}

/// Card de exibição para alunos que tiveram sua presença confirmada no evento.
class CardPresencaConfirmada extends StatelessWidget {
  /// O participante inscrito associado ao card.
  final InscritosEventosModel inscritos;

  /// Construtor padrão do card de presença confirmada.
  const CardPresencaConfirmada({
    super.key,
    required this.inscritos,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListTile(
          autofocus: true,
          dense: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              color: Cores.preto,
            ),
          ),
          visualDensity: VisualDensity.comfortable,
          titleAlignment: ListTileTitleAlignment.center,
          leading: const CircleAvatar(
            backgroundImage: AssetImage("assets/imgPerfil.png"),
          ),
          title: Row(
            children: [
              Text(
                inscritos.nomeAluno,
                style: const TextStyle(
                  color: Cores.preto,
                  fontFamily: Fontes.raleway,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                " - ${inscritos.rmAluno}",
                style: const TextStyle(
                  color: Cores.preto,
                  fontFamily: Fontes.raleway,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          subtitle: const Text(
            "Aluno",
            style: TextStyle(
              color: Cores.preto,
              fontFamily: Fontes.raleway,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          trailing: const Icon(
            Icons.check_rounded,
            size: 30,
            color: Cores.verdeClaro,
          ),
        ),
      ),
    );
  }
}
