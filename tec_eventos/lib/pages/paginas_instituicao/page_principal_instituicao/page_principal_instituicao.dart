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
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
        scrollDirection: Axis.vertical,
        children: [
        Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Container(
                height: 119,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Cores.azulEscuroPerfilOption.withOpacity(0.38), Cores.azulAFDAFA.withOpacity(0.5), Cores.azulC8E6FC.withOpacity(0.4)],


              )
            ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Unicamp", style: TextStyle(fontSize: 25, fontFamily: Fontes.ralewayBold),),
                            Text(
                              "LoremIpsumLoremIpsumLoremIpsumLoremIpsumLorem",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: Fontes.raleway,
                                fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),
                      ),
                      Image.asset("assets/unimarImagem.png", fit: BoxFit.cover, height: 100, width: 100,)
                    ],
                  ),
                ),
              ),
            ),
          
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
                    width: MediaQuery.of(context).size.width,
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
                        const Spacer(),
                        Text(
                          "Adicionar evento",
                          style: TextStyle(
                              fontFamily: Fontes.ralewayBold,
                              color: Cores.azul42A5F5,
                              fontSize: 27),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
