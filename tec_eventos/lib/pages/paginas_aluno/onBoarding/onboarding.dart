import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/login.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

late PageController _pageController;
int _pageIndex = 0;

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
          itemCount: demoData.length,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
          itemBuilder: (context, index) => telaBoarding(demoData[index].image,
              demoData[index].titulo, demoData[index].descricao, context)),

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
                      demoData.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(
                              isActive: index == _pageIndex,
                            ),
                          )),

                  //espaçamento
                  const Spacer(),

                  //botão de passar para a próxima página
                  const BotaoProximo(),
                ],
              ),
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
final List<Onboard> demoData = [
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
    descricao: 'Bem vindo ao nosso aplicativo',
  ),
];

//classe para as informações de cada tutorial
telaBoarding(String image, String titulo, String descricao, context) {
  return ListView(
    children: [
      Column(
        children: [
          Image.asset(
            image,
            width: 400,
            height: 450,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Text(
            titulo,
            style: TextStyle(
                fontFamily: Fontes.cabin,
                color: Cores.azul42A5F5,
                fontWeight: FontWeight.bold,
                fontSize: 30),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            descricao,
            style: TextStyle(
                fontFamily: Fontes.raleway,
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
      duration: const Duration(milliseconds: 100),
      height: isActive ? 24 : 5,
      width: isActive ? 6 : 15,
      decoration: BoxDecoration(
        color: isActive ? Cores.azulClaro : Cores.azulCinzento,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class BotaoProximo extends StatefulWidget {
  const BotaoProximo({Key? key}) : super(key: key);

  @override
  State<BotaoProximo> createState() => _BotaoProximoState();
}

class _BotaoProximoState extends State<BotaoProximo> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Cores.azul42A5F5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      ),
      child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
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
                    child: const LoginPage(),
                    type: PageTransitionType.rightToLeft));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Cores.azul42A5F5,
            padding:
                const EdgeInsets.only(right: 35, left: 35, top: 10, bottom: 10),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
          ),
          child: Text(
            'COMEÇAR',
            style: TextStyle(
                fontFamily: Fontes.inter, fontSize: 24, color: Cores.branco),
          ),
        )
      ],
    );
  }
}
