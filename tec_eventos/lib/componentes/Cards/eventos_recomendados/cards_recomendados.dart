import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/pag_inscricao_evento/info_evento/info_evento.dart';

class Recomendados extends StatefulWidget {
  const Recomendados({Key? key}) : super(key: key);

  @override
  State<Recomendados> createState() => _RecomendadosState();
}

class _RecomendadosState extends State<Recomendados> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
        child: SizedBox(
          width: 305,
          child: Card(
            margin: EdgeInsets.only(top: 20),
            shadowColor: Cores.Preto,
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
                      "https://i0.wp.com/eztravel.com.br/wp-content/uploads/2022/01/elizeu-dias-seq9dyzse6c-unsplash.jpeg",
                      height: 180,
                      width: 305,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: Image.asset("assets/UnivemIMG.png"),
                      title: Text("Univem"),
                      subtitle: Text("LoreLoremLoremLoremLoremLoremm"),
                      trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2,
                              minimumSize: Size(14, 18),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(7))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const info_evento(),
                                    type: PageTransitionType.bottomToTop));
                          },
                          child: Text(
                            "Info",
                            style: GoogleFonts.raleway(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Cores.Branco),
                          )),
                    )),
              ],
            ),
          ),
        ),
      );
  }
}
