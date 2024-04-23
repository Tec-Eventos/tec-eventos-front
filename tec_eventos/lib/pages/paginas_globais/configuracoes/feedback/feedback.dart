import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class FeedBackPage extends StatelessWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Cores.azulBebe,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Cores.preto,)),
        
        
            title: Text(
              "Configurações",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: Fontes.raleway,
                fontSize: 24,
                color: Cores.preto,
                fontWeight: FontWeight.bold
              ),
            ),
        bottom: PreferredSize(
            preferredSize: const Size.square(70),  
            child:  Container(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
               alignment: Alignment.centerLeft, 
              child: Text("Feedback",  style: TextStyle(
                fontFamily: Fontes.raleway,
                fontSize: 24,
                color: Cores.preto,
                      fontWeight: FontWeight.bold
              ),),
            ),

          ),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
          scrollDirection: Axis.vertical,
          children:  [
             const FeedbackOptions(nameOption: "Reportar algum erro"),
             const SizedBox(height: 30),
             const FeedbackOptions(nameOption: "Entre em contato"),
             const SizedBox(height: 30),





            Divider(height: 10, color: Cores.preto),

            ListTile(
              leading: Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Cores.azulBebe
                ),
                child: Icon(Icons.feedback_outlined, color: Cores.azul1565C0, size: 20,)),
              title: Text("Enviar feedback", style: TextStyle(fontFamily: Fontes.raleway, fontSize: 13, fontWeight: FontWeight.w700),),
            ),  


            Divider(height: 10, color: Cores.preto),


          ]),
    );
  }
}

class ConfigGeral extends StatefulWidget {
  const ConfigGeral({Key? key, required this.icone, required this.opcao})
      : super(key: key);

  final String opcao;
  final IconData icone;

  @override
  State<ConfigGeral> createState() => _ConfigGeralState();
}

class _ConfigGeralState extends State<ConfigGeral> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(),
          shape: Border(
            bottom: BorderSide(
              color: Cores.cinzaMaisClaro,
              width: 1.0,
            ),
          ),
          titleAlignment: ListTileTitleAlignment.center,
          leading: Icon(widget.icone, color: Cores.preto, size: 20),
          title: Text(widget.opcao,
              style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Cores.preto)),
          trailing: Icon(Icons.arrow_forward_ios, color: Cores.preto, size: 12),
        ),
      ],
    );
  }
}



class FeedbackOptions extends StatelessWidget {
  const FeedbackOptions({ Key? key, required this.nameOption }) : super(key: key);


  final String nameOption;

  @override
  Widget build(BuildContext context) {
    return  Container(
            decoration: BoxDecoration(
                color: Cores.azulBebe,
                borderRadius: BorderRadius.circular(10)
            ),
              height: 87,
              child: Center(
                child: ListTile(
                  
                  leading: Icon(Icons.person_outline_outlined, color: Cores.azul1565C0,),
                  title: Text(nameOption, style: TextStyle(fontFamily: Fontes.raleway, fontSize: 16, fontWeight: FontWeight.w600)),
                  subtitle: Text("Lorem ipsum lorem lorem ipsum, lorem ipsum lorem lorem ipsum", style: TextStyle(fontFamily: Fontes.raleway, fontSize: 13, fontWeight: FontWeight.w700)),
                ),
              ),
            );
  }
}

