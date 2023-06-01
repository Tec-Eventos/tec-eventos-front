import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//Medalhas do usuário
class Medalhas extends StatefulWidget {
  const Medalhas(
      {Key? key,
        required this.nomeEvento,
        required this.organizacao,
        required this.posicao,
        required this.imgOrg,
        required this.corPodio})
      : super(key: key);

  final String nomeEvento, organizacao, posicao, imgOrg;
  final Color corPodio;

  @override
  State<Medalhas> createState() => _MedalhasState();
}

class _MedalhasState extends State<Medalhas> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, 4),
                  blurRadius: 4
              )
            ]
        ),
        child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 80),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),
            tileColor: Colors.transparent,
            leading:

            //posição que o usuário ficou no evento
            Container(
              width: 30,
              height: 53,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: widget.corPodio,
                ),


              child: const Icon(
                Icons.workspace_premium_outlined,
              ),
            ),
            title: Text(
              widget.nomeEvento,
              style: GoogleFonts.raleway(fontSize: 13, fontWeight: FontWeight.bold),
            ),


            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.organizacao,
                  style: GoogleFonts.raleway(
                    fontSize: 13,
                  ),
                ),
                Text(
                  widget.posicao,
                  style: GoogleFonts.raleway(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            trailing: SizedBox(
                width: 90,
                height: 90,
                child: Image.asset(
                  widget.imgOrg,
                  alignment: Alignment.bottomRight,
                )),
          ),

      ),
    );
  }
}