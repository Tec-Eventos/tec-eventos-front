import 'package:flutter/material.dart';
import 'package:tec_eventos/widgets/Cards/eventos_em_alta/cards_eventos_alta.dart';
import 'package:tec_eventos/widgets/Cards/eventos_inscritos/cards_eventos_inscritos.dart';
import 'package:tec_eventos/widgets/Cards/eventos_recomendados/cards_recomendados.dart';
import 'package:tec_eventos/widgets/InstituicaoSugerida/instituicao_sugerida.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

List<String> imagensEventos = [
  "assets/UnivemIMG.png",
  "assets/UnivemIMG.png",
  "assets/UnivemIMG.png",
  "assets/UnivemIMG.png",
];

bool palestras = true;
bool competicoes = false;
bool bootcamp = false;
bool notificationButton = false;

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    //responsividades - Largura e Altura
    // double displayWidth = MediaQuery
    //     .of(context)
    //     .size
    //     .width;
    // double displayHeight = MediaQuery
    //     .of(context)
    //     .size
    //     .height;

    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu de filtragem
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      filtragemEventos(false, !competicoes, false,
                          Icons.school_outlined, competicoes),
                      filtragemEventos(!palestras, false, false,
                          Icons.school_outlined, palestras),
                      filtragemEventos(false, false, !bootcamp,
                          Icons.school_outlined, bootcamp),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 50),

              Text(
                "Eventos que você está inscrito",
                style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              //carrossel dos eventos que o usuário vai participar, mostrando os dias que faltam
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      CardEventosInscritos(
                          nomeEvento: "Hackathon Univem Nasa",
                          diasFaltam: "2 DIAS",
                          diaRealizacao: "12/02/2222",
                          horas: "13h00",
                          imagemEvento:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKeOAXzBhqQCDcid2tD1HJiWUzECWBpuU_ozXny7mC&s",
                          organizacao: "assets/UnivemIMG.png"),
                      CardEventosInscritos(
                          nomeEvento: "Festa de Formatura",
                          diasFaltam: "É HOJE!",
                          diaRealizacao: "15/12/2023",
                          horas: "19h00",
                          imagemEvento:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZh_ed8ebxamWQoJtWg8cF1fOvOYIEr0Tkaw17UpGV1RGydNI3TxyfoqwNTbvOxrpOMN0&usqp=CAU",
                          organizacao: "assets/EtecIMG.png"),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 50),

              Text(
                "Eventos em alta",
                style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              //carrossel dos eventos que as pessoas mais fizeram inscrições
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    EventosAlta(
                        imagemEvento:
                            "https://i0.wp.com/eztravel.com.br/wp-content/uploads/2022/01/elizeu-dias-seq9dyzse6c-unsplash.jpeg",
                        modalidade: "Competição",
                        nomeEvento: "Unvem Nasa",
                        descricao:
                            "LoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremmLoremLoremLoremLoremLorem",
                        organizacaoImagem: "assets/UnivemIMG.png")
                  ],
                ),
              ),

              const SizedBox(height: 50),

              Text(
                "Recomendados para você",
                style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              //carrossel dos cards recomendados para o aluno
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Recomendados(
                        nomeEvento: "UnimarFest",
                        imagemEvento:
                            "https://i0.wp.com/eztravel.com.br/wp-content/uploads/2022/01/elizeu-dias-seq9dyzse6c-unsplash.jpeg",
                        imagemOrganizacao: "assets/UnimarIMG.png",
                        descricao:
                            "Venha ver nosso evento hoje, será muito legal!")
                  ],
                ),
              ),

              const SizedBox(height: 50),

              Text(
                "Algumas instituições",
                style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              //imagens das instituições parceiras
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InstituicaoSugerida(imagem: "assets/unimarImagem.png"),
                    InstituicaoSugerida(imagem: "assets/unimarImagem.png"),
                    InstituicaoSugerida(imagem: "assets/unimarImagem.png")
                  ],
                ),
              ),
            ],
          ),
        ]);
  }

  //filtragem
  filtragemEventos(bool palestrasBool, bool compBool, bool bootcampBool,
      IconData icon, bool optionTrue) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            palestras = palestrasBool;
            competicoes = compBool;
            bootcamp = bootcampBool;
          });
        },
        child: Column(children: [
          AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                    color: optionTrue ? Colors.transparent : Cores.azul42A5F5),

                //cor de fundo
                color: optionTrue ? Cores.azul42A5F5 : Colors.transparent,
              ),
              child: optionTrue
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //icone
                        Icon(
                          icon,
                          color: Cores.branco,
                          size: 30,
                        ),

                        Text(
                          "Palestras",
                          style: TextStyle(
                              fontFamily: Fontes.raleway,
                              fontSize: 10,
                              color: Cores.branco,
                              fontWeight: FontWeight.bold),
                        ),

                        //texto do filtro em específico
                      ],
                    )
                  : Icon(icon, color: Cores.azul42A5F5, size: 30)),
        ]),
      ),
    );
  }
}
