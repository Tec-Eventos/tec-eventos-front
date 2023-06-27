import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tec_eventos/cores.dart';

class Ranking extends StatefulWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {



  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child:

              //card que expande e mostra as medalhas de um usuário
          ExpansionTileCard(
            baseColor: Cores.Branco,
            key: GlobalKey(),
            leading: CircleAvatar(child: Image.asset("assets/imgPerfil.png")),

            //nome do usuário
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'GABRIEL MORAIS FELIX',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Cores.Preto,
                  ),
                ),
                
                const Icon(
                 Icons.arrow_drop_down,
                 size: 25,
                ),

               VerticalDivider(
                 color: Cores.Amarelo,
                  width: 5,
                 indent: 10,
                 thickness: 2.0,
               )
              ],
            ),

            //sua profissão
            subtitle: Text('Desempregado',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  color: Cores.Preto,
                )),

            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.workspace_premium_outlined, color: Cores.Preto),
                Text(
                  "50",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Cores.Preto
                  ),
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
                        Icon(Icons.workspace_premium_outlined, color: Cores.Amarelo),
                        Text('10', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15)),


                        //medalhas de segundo lugar
                        Icon(Icons.workspace_premium_outlined, color: Cores.Cinza),
                        Text('10', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15)),


                        //medalhas de terceiro lugar
                        Icon(Icons.workspace_premium_outlined, color: Cores.Bronze),
                        Text('10', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15)),


                        //medalhas sem serem as do pódio
                        Icon(Icons.workspace_premium_outlined, color: Cores.Azul45B0F0),
                        Text('20', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15)),

                      ],
                    )),
              ),

              //Medalhas de ouro, prata e bronze
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                buttonHeight: 50.0,
                buttonMinWidth: 90.0,
                children: <Widget>[
                 Text('Posição:',
                 style: GoogleFonts.raleway(
                   fontWeight: FontWeight.bold,
                   fontSize: 15,
                 ),
                 ),
                 Text("1° Lugar",
                   style: GoogleFonts.raleway(
                     fontWeight: FontWeight.bold,
                     fontSize: 15,
                   ),),
                ],
              ),
            ],
          ),
        ),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child:

          //card que expande e mostra as medalhas de um usuário
          ExpansionTileCard(
            baseColor: Cores.Branco,
            key: GlobalKey(),
            leading: CircleAvatar(child: Image.asset("assets/imgPerfil.png")),

            //nome do usuário
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'GABRIEL MORAIS FELIX',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Cores.Preto,
                  ),
                ),

                const Icon(
                  Icons.arrow_drop_down,
                  size: 25,
                ),

                VerticalDivider(
                  color: Cores.Amarelo,
                  width: 5,
                  indent: 10,
                  thickness: 2.0,
                )
              ],
            ),

            //sua profissão
            subtitle: Text('Desempregado',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  color: Cores.Preto,
                )),

            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.workspace_premium_outlined, color: Cores.Preto),
                Text(
                  "50",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Cores.Preto
                  ),
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
                        Icon(Icons.workspace_premium_outlined, color: Cores.Amarelo),
                        Text('10', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15)),


                        //medalhas de segundo lugar
                        Icon(Icons.workspace_premium_outlined, color: Cores.Cinza),
                        Text('10', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15)),


                        //medalhas de terceiro lugar
                        Icon(Icons.workspace_premium_outlined, color: Cores.Bronze),
                        Text('10', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15)),


                        //medalhas sem serem as do pódio
                        Icon(Icons.workspace_premium_outlined, color: Cores.Azul45B0F0),
                        Text('20', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15)),

                      ],
                    )),
              ),

              //Medalhas de ouro, prata e bronze
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                buttonHeight: 50.0,
                buttonMinWidth: 90.0,
                children: <Widget>[
                  Text('Posição:',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text("1° Lugar",
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                ],
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child:

          //card que expande e mostra as medalhas de um usuário
          ExpansionTileCard(
            baseColor: Cores.Branco,
            key: GlobalKey(),
            leading: CircleAvatar(child: Image.asset("assets/imgPerfil.png")),

            //nome do usuário
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'GABRIEL MORAIS FELIX',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Cores.Preto,
                  ),
                ),

                const Icon(
                  Icons.arrow_drop_down,
                  size: 25,
                ),

                VerticalDivider(
                  color: Cores.Amarelo,
                  width: 5,
                  indent: 10,
                  thickness: 2.0,
                )
              ],
            ),

            //sua profissão
            subtitle: Text('Desempregado',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  color: Cores.Preto,
                )),

            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.workspace_premium_outlined, color: Cores.Preto),
                Text(
                  "50",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Cores.Preto
                  ),
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
                        Icon(Icons.workspace_premium_outlined, color: Cores.Amarelo),
                        Text('10', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15)),


                        //medalhas de segundo lugar
                        Icon(Icons.workspace_premium_outlined, color: Cores.Cinza),
                        Text('10', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15)),


                        //medalhas de terceiro lugar
                        Icon(Icons.workspace_premium_outlined, color: Cores.Bronze),
                        Text('10', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15)),


                        //medalhas sem serem as do pódio
                        Icon(Icons.workspace_premium_outlined, color: Cores.Azul45B0F0),
                        Text('20', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15)),

                      ],
                    )),
              ),

              //Medalhas de ouro, prata e bronze
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                buttonHeight: 50.0,
                buttonMinWidth: 90.0,
                children: <Widget>[
                  Text('Posição:',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text("1° Lugar",
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                ],
              ),
            ],
          ),
        ),


      ],
    );
  }
}
