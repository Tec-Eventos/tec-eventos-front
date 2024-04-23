import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class Ranking extends StatefulWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  @override
  Widget build(BuildContext context) {
    // final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(4.0)),
    //   ),
    // );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView(

        scrollDirection: Axis.vertical,
        children: [

            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.workspace_premium_outlined, size: 30),
                    const SizedBox(width: 5),
                    Text("RANKING", style: TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),

                const SizedBox(height: 5),

                Container(
                  width: 163,
                  height: 2,
                  color: Cores.azulClaro,
                )
              ],
            ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child:

                //card que expande e mostra as medalhas de um usuário
                ExpansionTileCard(
              baseColor: Cores.branco,
              key: GlobalKey(),
              leading: CircleAvatar(child: Image.asset("assets/imgPerfil.png")),

              //nome do usuário
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'GABRIEL MORAIS FELIX',
                    style: TextStyle(
                      fontFamily: Fontes.raleway,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Cores.preto,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 25,
                  ),
                  VerticalDivider(
                    color: Cores.amarelo,
                    width: 5,
                    indent: 10,
                    thickness: 2.0,
                  )
                ],
              ),

              //sua profissão
              subtitle: Text('Desempregado',
                  style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    color: Cores.preto,
                  )),

              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.workspace_premium_outlined, color: Cores.preto),
                  Text(
                    "50",
                    style: TextStyle(
                        fontFamily: Fontes.inter,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Cores.preto),
                  )
                ],
              ),

              //parte interna do componente, que só aparece ao clicar
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 8.0,
                      ),
                      child:
                          //as medalhas internas do usuário
                          Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //medalhas de primeiro lugar
                          Icon(Icons.workspace_premium_outlined,
                              color: Cores.amarelo),
                          Text('10',
                              style: TextStyle(
                                  fontFamily: Fontes.inter,
                                  fontWeight: FontWeight.bold, fontSize: 15)),

                          //medalhas de segundo lugar
                          Icon(Icons.workspace_premium_outlined,
                              color: Cores.cinza),
                          Text('10',
                              style: TextStyle(
                                  fontFamily: Fontes.inter,
                                  fontWeight: FontWeight.bold, fontSize: 15)),

                          //medalhas de terceiro lugar
                          Icon(Icons.workspace_premium_outlined,
                              color: Cores.bronze),
                          Text('10',
                              style: TextStyle(
                                  fontFamily: Fontes.inter,
                                  fontWeight: FontWeight.bold, fontSize: 15)),

                          //medalhas sem serem as do pódio
                          Icon(Icons.workspace_premium_outlined,
                              color: Cores.azul45B0F0),
                          Text('20',
                              style: TextStyle(
                                  fontFamily: Fontes.inter,
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      )),
                ),

                //Medalhas de ouro, prata e bronze
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 50.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    Text(
                      'Posição:',
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "1° Lugar",
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child:

                //card que expande e mostra as medalhas de um usuário
                ExpansionTileCard(
              baseColor: Cores.branco,
              key: GlobalKey(),
              leading: CircleAvatar(child: Image.asset("assets/imgPerfil.png")),

              //nome do usuário
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'GABRIEL MORAIS FELIX',
                    style: TextStyle(
                      fontFamily: Fontes.raleway,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Cores.preto,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 25,
                  ),
                  VerticalDivider(
                    color: Cores.amarelo,
                    width: 5,
                    indent: 10,
                    thickness: 2.0,
                  )
                ],
              ),

              //sua profissão
              subtitle: Text('Desempregado',
                  style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    color: Cores.preto,
                  )),

              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.workspace_premium_outlined, color: Cores.preto),
                  Text(
                    "50",
                    style: TextStyle(
                        fontFamily: Fontes.inter,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Cores.preto),
                  )
                ],
              ),

              //parte interna do componente, que só aparece ao clicar
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 8.0,
                      ),
                      child:
                          //as medalhas internas do usuário
                          Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //medalhas de primeiro lugar
                          Icon(Icons.workspace_premium_outlined,
                              color: Cores.amarelo),
                          Text('10',
                              style: TextStyle(
                                  fontFamily: Fontes.inter,
                                  fontWeight: FontWeight.bold, fontSize: 15)),

                          //medalhas de segundo lugar
                          Icon(Icons.workspace_premium_outlined,
                              color: Cores.cinza),
                          Text('10',
                              style: TextStyle(
                                  fontFamily: Fontes.inter,
                                  fontWeight: FontWeight.bold, fontSize: 15)),

                          //medalhas de terceiro lugar
                          Icon(Icons.workspace_premium_outlined,
                              color: Cores.bronze),
                          Text('10',
                              style: TextStyle(
                                  fontFamily: Fontes.inter,
                                  fontWeight: FontWeight.bold, fontSize: 15)),

                          //medalhas sem serem as do pódio
                          Icon(Icons.workspace_premium_outlined,
                              color: Cores.azul45B0F0),
                          Text('20',
                              style: TextStyle(
                                  fontFamily: Fontes.inter,
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      )),
                ),

                //Medalhas de ouro, prata e bronze
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 50.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    Text(
                      'Posição:',
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "1° Lugar",
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child:

                //card que expande e mostra as medalhas de um usuário
                ExpansionTileCard(
              baseColor: Cores.branco,
              key: GlobalKey(),
              leading: CircleAvatar(child: Image.asset("assets/imgPerfil.png")),

              //nome do usuário
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'GABRIEL MORAIS FELIX',
                    style: TextStyle(
                      fontFamily: Fontes.raleway,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Cores.preto,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 25,
                  ),
                  VerticalDivider(
                    color: Cores.amarelo,
                    width: 5,
                    indent: 10,
                    thickness: 2.0,
                  )
                ],
              ),

              //sua profissão
              subtitle: Text('Desempregado',
                  style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    color: Cores.preto,
                  )),

              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.workspace_premium_outlined, color: Cores.preto),
                  Text(
                    "50",
                    style: TextStyle(
                        fontFamily: Fontes.inter,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Cores.preto),
                  )
                ],
              ),

              //parte interna do componente, que só aparece ao clicar
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 8.0,
                      ),
                      child:
                          //as medalhas internas do usuário
                          Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //medalhas de primeiro lugar
                          Icon(Icons.workspace_premium_outlined,
                              color: Cores.amarelo),
                          Text('10',
                              style: TextStyle(
                                  fontFamily: Fontes.inter,
                                  fontWeight: FontWeight.bold, fontSize: 15)),

                          //medalhas de segundo lugar
                          Icon(Icons.workspace_premium_outlined,
                              color: Cores.cinza),
                          Text('10',
                              style: TextStyle(
                                  fontFamily: Fontes.inter,
                                  fontWeight: FontWeight.bold, fontSize: 15)),

                          //medalhas de terceiro lugar
                          Icon(Icons.workspace_premium_outlined,
                              color: Cores.bronze),
                          Text('10',
                              style: TextStyle(
                                  fontFamily: Fontes.inter,
                                  fontWeight: FontWeight.bold, fontSize: 15)),

                          //medalhas sem serem as do pódio
                          Icon(Icons.workspace_premium_outlined,
                              color: Cores.azul45B0F0),
                          Text('20',
                              style: TextStyle(
                                  fontFamily: Fontes.inter,
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      )),
                ),

                //Medalhas de ouro, prata e bronze
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 50.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    Text(
                      'Posição:',
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "1° Lugar",
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
