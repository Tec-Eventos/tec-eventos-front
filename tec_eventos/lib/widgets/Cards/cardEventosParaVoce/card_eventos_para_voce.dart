import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/data/http/http_client.dart';
import 'package:tec_eventos/data/repositories/events_repository.dart';
import 'package:tec_eventos/data/repositories/inst_events_repository.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/utils/stores/events_store.dart';
import 'package:tec_eventos/utils/stores/inst_event_store.dart';
import 'package:tec_eventos/widgets/Cards/cardLoading/card_loading.dart';

class RowCardEventosParaVoce extends StatefulWidget {
  const RowCardEventosParaVoce({super.key});

  @override
  State<RowCardEventosParaVoce> createState() => _RowCardEventosParaVoceState();
}

class _RowCardEventosParaVoceState extends State<RowCardEventosParaVoce> {
  final InstEventsStore store = InstEventsStore(
    repository: InstEventsRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    store.getEventsInst();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AnimatedBuilder(
          animation:
              Listenable.merge([store.isLoading, store.erro, store.state]),
          builder: (context, child) {
            if (store.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
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
                height: 330,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  // padding: const EdgeInsets.all(16),
                  scrollDirection: Axis.horizontal,
                  itemCount: store.state.value.length,
                  itemBuilder: (_, index) {
                    final item = store.state.value[index];

                    if (item != null) {
                      return CardEventosParaVoce(
                        imagemEvento: item.imagemEvento,
                        nomeEvento: item.nomeEvento,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              );
            }
          }),
    );
  }
}

class CardEventosParaVoce extends StatefulWidget {
  const CardEventosParaVoce(
      {super.key, required this.imagemEvento, required this.nomeEvento});

  final String imagemEvento, nomeEvento;

  @override
  State<CardEventosParaVoce> createState() => _CardEventosParaVoceState();
}

class _CardEventosParaVoceState extends State<CardEventosParaVoce> {
  @override
  Widget build(BuildContext context) {
    const urlImage = 'https://api-tec-eventos-i6hr.onrender.com/imagem';
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 219,
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
                    width: MediaQuery.of(context).size.width / 1,
                    height: 126,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //NOME DA INSTITUIÇÃO
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              widget.nomeEvento,
                              style: TextStyle(
                                  fontFamily: Fontes.raleway,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Cores.preto),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      //DIA QUE VAI ROLAR O EVENTO

                      Row(
                        children: [
                          Text(
                            "Local:",
                            style: TextStyle(
                                fontFamily: Fontes.inter,
                                fontSize: 12,
                                color: Cores.preto),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Marília, SP",
                            style: TextStyle(
                                fontFamily: Fontes.inter,
                                fontSize: 12,
                                color: Cores.azul42A5F5),
                          ),
                        ],
                      ),

                      const SizedBox(height: 5),

                      //DIA EM ESPECÍFICO, COM DATA E HORÁRIO

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pessoas que se \ninscreveram:",
                            style: TextStyle(
                                fontFamily: Fontes.inter,
                                fontSize: 12,
                                color: Cores.preto),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: CircleAvatar(
                                  child: Image.asset("assets/imgPerfil.png"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: CircleAvatar(
                                  child: Image.asset("assets/imgPerfil.png"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: CircleAvatar(
                                  child: Image.asset("assets/imgPerfil.png"),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //     left: 7,
                              //   ),
                              //   child: Text(
                              //     "+5",
                              //     textAlign: TextAlign.center,
                              //     style: TextStyle(
                              //         fontFamily: Fontes.inter,
                              //         fontSize: 20,
                              //         color: Cores.preto),
                              //   ),
                            ],
                          )
                        ],
                      ),

                      //BOTÃO PARA VER MAIS SOBRE O EVENTO
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Saiba mais",
                            style: TextStyle(
                                fontSize: 15, color: Cores.azul42A5F5),
                          ))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
