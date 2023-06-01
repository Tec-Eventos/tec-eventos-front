import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/all_pages.dart';
import 'package:tec_eventos/paginas/pag_principal/principal_page.dart';
import 'package:tec_eventos/paginas/acesso/login.dart';
import 'package:tec_eventos/paginas/perfil/perfil.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

late PageController _pageController;
int _pageIndex = 0;
bool isLastPage = false;

class _OnBoardingState extends State<OnBoarding> {
  //controle das páginas
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  //começo da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
          itemCount: demo_data.length,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
          itemBuilder: (context, index) => TelaBoarding(demo_data[index].image,
              demo_data[index].titulo, demo_data[index].descricao, context)),

      //parte de baixo, com os botões e etapas passadas
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: _pageIndex == 3
            //botão de começar, para entrar na página de login
            ? const BotaoComecar()

            //parte inferior do onBoarding mostrando em que parte o usuário está
            : Row(
                children: [
                  //as bolinhas para indicar a etapa, lista gerada para passar a informação para a classe DotIndicator
                  ...List.generate(
                      demo_data.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(
                              isActive: index == _pageIndex,
                            ),
                          )),

                  //espaçamento
                  const Spacer(),

                  //botão de passar para a próxima página
                  const Botao_Proximo(),
                ],
              ),
      ),
    );

    //se a função estiver na terceira etapa, aparece o botão de começar
    Padding(
      padding: const EdgeInsets.all(25.0),
      child: _pageIndex == 3
          //botão de começar, para entrar na página de login
          ? const BotaoComecar()

          //parte inferior do onBoarding mostrando em que parte o usuário está
          : Row(
              children: [
                //as bolinhas para indicar a etapa, lista gerada para passar a informação para a classe DotIndicator
                ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: DotIndicator(
                            isActive: index == _pageIndex,
                          ),
                        )),

                //espaçamento
                const Spacer(),

                //botão de passar para a próxima página
                const Botao_Proximo(),
              ],
            ),
    );
  }
}

//guardando as imagens e explicação em uma classe
class Onboard {
  final String image, titulo, descricao;

  Onboard({required this.image, required this.titulo, required this.descricao});
}

//coisas que devem aparecer em cada etapa
final List<Onboard> demo_data = [
  //tutorial 1
  Onboard(
    image: 'assets/onBoarding/conecte.png',
    titulo: 'Conecte-se',
    descricao: 'Conecte-se ao mundo acadêmico da melhor maneira possível',
  ),
  //tutorial 2
  Onboard(
    image: 'assets/onBoarding/busque.png',
    titulo: 'Busque',
    descricao: 'Ache eventos que são do seu interesse.',
  ),

  //tutorial 3
  Onboard(
    image: 'assets/onBoarding/pague.png',
    titulo: 'Pague',
    descricao: 'Conecte-se ao mundo acadêmico da melhor maneira possível',
  ),

  //tutorial 4
  Onboard(
    image: 'assets/onBoarding/comecar.png',
    titulo: '',
    descricao: '',
  ),
];

//classe para as informações de cada tutorial
TelaBoarding(String image, String titulo, String descricao, context) {
  return ListView(
    children: [
      Column(
        children: [
          Image.asset(image, fit: BoxFit.fill, width: double.infinity, height: MediaQuery.of(context).size.height / 1.2,),
          Text(
            titulo,
            style: GoogleFonts.cabin(
                color: Cores.Azul42A5F5,
                fontWeight: FontWeight.bold,
                fontSize: 30),
            textAlign: TextAlign.center,
          ),

          Container(
            height: 1.0,
            width: 174.03,
            color: Cores.Azul42A5F5,
          ),
          Text(
            descricao,
            style: GoogleFonts.raleway(
                fontWeight: FontWeight.w600,
                fontSize: 23,
                shadows: [
                  Shadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(1, 2),
                      blurRadius: 7),
                ]),
            textAlign: TextAlign.center,
          ),
        ],
      )
    ],
  );
}

//Indicador de qual etapa o usuário está
class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: isActive ? 24 : 5,
      width: isActive ? 6 : 15,
      decoration: BoxDecoration(
        color: isActive ? Cores.AzulClaro : Cores.AzulCinzento,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class Botao_Proximo extends StatefulWidget {
  const Botao_Proximo({Key? key}) : super(key: key);

  @override
  State<Botao_Proximo> createState() => _Botao_ProximoState();
}

class _Botao_ProximoState extends State<Botao_Proximo> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _pageController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      },
      child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      ),
    );
  }
}

//Botão de Começar quando as etapas foram passadas
class BotaoComecar extends StatefulWidget {
  const BotaoComecar({Key? key}) : super(key: key);

  @override
  State<BotaoComecar> createState() => _BotaoComecarState();
}

class _BotaoComecarState extends State<BotaoComecar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //botão de começar
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const AllPages(),
                    type: PageTransitionType.rightToLeft));
          },
          child: Text(
            'COMEÇAR',
            style: GoogleFonts.inter(
              fontSize: 24,
            ),
          ),
          style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.only(right: 35, left: 35, top: 10, bottom: 10),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
          ),
        )
      ],
    );
  }
}
