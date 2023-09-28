import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/widgets/Cards/cards_adicionados_recentemente_instituicao/cards_add_recentemente_instituicao.dart';
import 'package:tec_eventos/widgets/Cards/cards_eventos_da_instituicao/cards_eventos_da_instituicao.dart';

class PrincipalPageInstituicao extends StatefulWidget {
  const PrincipalPageInstituicao({Key? key}) : super(key: key);

  @override
  _PrincipalPageInstituicaoState createState() =>
      _PrincipalPageInstituicaoState();
}

class _PrincipalPageInstituicaoState extends State<PrincipalPageInstituicao> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
      scrollDirection: Axis.vertical,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Eventos que você está inscrito",
              style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    CardsEventosInstituicao(),
                    CardsEventosInstituicao(),
                    CardsEventosInstituicao(),
                  ],
                ),
              ),
            ),
            Text(
              "Adicionados recentemente",
              style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [CardsRecentesInstituicao()],
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 310,
                  height: 61,
                  decoration: BoxDecoration(
                    border: Border.all(color: Cores.azul42A5F5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 59,
                        height: 61,
                        decoration: BoxDecoration(
                            color: Cores.azul42A5F5,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5))),
                        child: Icon(
                          Icons.add,
                          color: Cores.branco,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Adicionar evento",
                        style: TextStyle(
                            fontFamily: Fontes.ralewayBold,
                            color: Cores.azul42A5F5,
                            fontSize: 27),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
