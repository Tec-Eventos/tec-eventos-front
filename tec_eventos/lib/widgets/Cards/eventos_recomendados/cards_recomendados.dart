import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/data/http/http_client.dart';
import 'package:tec_eventos/data/repositories/events_repository.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_inscricao_evento/info_evento/info_evento.dart';
import 'package:tec_eventos/utils/stores/events_store.dart';
import 'package:tec_eventos/widgets/Cards/cardLoading/card_loading.dart';

class RowEventosRecomendados extends StatefulWidget {
  const RowEventosRecomendados({super.key});

  @override
  State<RowEventosRecomendados> createState() => _RowEventosRecomendadosState();
}

class _RowEventosRecomendadosState extends State<RowEventosRecomendados> {
  final EventsStore store = EventsStore(
    repository: EventsRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    store.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 340,
      child: AnimatedBuilder(
          animation:
              Listenable.merge([store.isLoading, store.erro, store.state]),
          builder: (context, child) {
            if (store.isLoading.value) {
              return ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CardLoading(),
                    CardLoading(),
                  ]);
            }

            if (store.erro.value.isNotEmpty) {
              return Center(
                child: Text(
                  store.erro.value,
                  style: TextStyle(
                    color: Cores.preto,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: Fontes.raleway,
                  ),
                ),
              );
            }

            if (store.state.value.isEmpty) {
              return Center(
                child: Text(
                  'Nenhum evento inscrito',
                  style: TextStyle(
                      color: Cores.preto,
                      fontWeight: FontWeight.w600,
                      fontFamily: Fontes.raleway,
                      fontSize: 20),
                ),
              );
            } else {
              return SizedBox(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  scrollDirection: Axis.horizontal,
                  itemCount: store.state.value.length,
                  itemBuilder: (_, index) {
                    final item = store.state.value[index];

                    return Recomendados(
                      nomeEvento: item.nomeEvento,
                      imagemEvento: item.imagemEvento,
                      imagemOrganizacao: item.logoEvento,
                      descricao: item.descricao,
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}

class Recomendados extends StatefulWidget {
  const Recomendados(
      {Key? key,
      required this.nomeEvento,
      required this.imagemEvento,
      required this.imagemOrganizacao,
      required this.descricao})
      : super(key: key);

  final String nomeEvento, imagemEvento, imagemOrganizacao, descricao;

  @override
  State<Recomendados> createState() => _RecomendadosState();
}

class _RecomendadosState extends State<Recomendados> {
  @override
  Widget build(BuildContext context) {
    final InfoEvento navegacao = InfoEvento(
        imagemEvento: widget.imagemEvento,
        imagemOrganizacao: widget.imagemOrganizacao,
        diaRealizacao: "10/06",
        nomeEvento: widget.nomeEvento,
        horarioRealizacao: "10:00");

    final urlImage = 'http://192.168.1.112:8080/imagem/';
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
      child: SizedBox(
        width: 300,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: navegacao, type: PageTransitionType.bottomToTop));
          },
          child: Card(
            margin: const EdgeInsets.only(top: 20),
            shadowColor: Cores.preto,
            borderOnForeground: false,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.white,
            elevation: 6,
            child:
                // COMPONENTES QUE VÃO ESTAR DENTRO DO CARD
                Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.network(
                      urlImage + widget.imagemEvento,
                      height: 180,
                      width: 305,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ListTile(
                      leading: Image.network(
                        urlImage + widget.imagemOrganizacao,
                        width: 50,
                        height: 50,
                      ),

                      //nome do Evento
                      title: Text(
                        widget.nomeEvento,
                        style: TextStyle(
                            fontFamily: Fontes.ralewayBold,
                            fontSize: 12,
                            color: Cores.preto),
                      ),

                      //descrição dele
                      subtitle: Text(
                        widget.descricao,
                        style: TextStyle(
                          fontFamily: Fontes.raleway,
                          fontSize: 10,
                          color: Cores.preto,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2,
                              minimumSize: const Size(14, 18),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: navegacao,
                                    type: PageTransitionType.bottomToTop));
                          },
                          child: Text(
                            "Info",
                            style: TextStyle(
                                fontFamily: Fontes.raleway,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Cores.branco),
                          )),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
