import 'package:flutter/material.dart';
//Eventos participados pelo usuário
class EventosParticipados extends StatefulWidget {
  const EventosParticipados(
      {Key? key,
        required this.imagem,
        required this.nomeEvento,
        required this.descricao})
      : super(key: key);

  //perguntar para o Menoi a respeito do tipo que devo passar para a imagem do usuário
  final String imagem, nomeEvento, descricao;

  @override
  State<EventosParticipados> createState() => _EventosParticipadosState();
}

class _EventosParticipadosState extends State<EventosParticipados> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 6.5,
      child: ListTile(
        leading: Image.asset(widget.imagem),
        title: Text(widget.nomeEvento),
        subtitle: Text(widget.descricao),
      ),
    );
  }
}