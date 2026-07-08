import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/login.dart';
import 'package:tec_eventos/core/theme/fontes.dart';

/// Tela introdutória de OnBoarding para novos usuários.
///
/// Apresenta uma série de 4 slides contendo ilustrações explicativas sobre
/// os propósitos do aplicativo (Conexão, Busca, Pagamento e Boas-Vindas).
class OnBoarding extends StatefulWidget {
  /// Construtor padrão da tela de onboarding.
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late final PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
        itemBuilder: (context, index) => _TelaBoarding(
          onboard: demoData[index],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: _pageIndex == 3
            // Botão final para navegar à tela de login
            ? const _BotaoComecar()
            // Controles de etapa inferior
            : Row(
                children: [
                  ...List.generate(
                    demoData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Botão de avançar
                  _BotaoProximo(pageController: _pageController),
                ],
              ),
      ),
    );
  }
}

/// Representação dos dados de um slide do Onboarding.
class Onboard {
  final String image;
  final String titulo;
  final String descricao;

  const Onboard({
    required this.image,
    required this.titulo,
    required this.descricao,
  });
}

/// Dados fixos dos slides informativos do Onboarding.
final List<Onboard> demoData = const [
  Onboard(
    image: 'assets/onBoarding/conecte.png',
    titulo: 'Conecte-se',
    descricao: 'Conecte-se ao mundo acadêmico da melhor maneira possível',
  ),
  Onboard(
    image: 'assets/onBoarding/busque.png',
    titulo: 'Busque',
    descricao: 'Ache eventos que são do seu interesse.',
  ),
  Onboard(
    image: 'assets/onBoarding/pague.png',
    titulo: 'Pague',
    descricao: 'Conecte-se ao mundo acadêmico da melhor maneira possível',
  ),
  Onboard(
    image: 'assets/onBoarding/comecar.png',
    titulo: '',
    descricao: 'Bem vindo ao nosso aplicativo',
  ),
];

/// Conteúdo interno de cada slide.
class _TelaBoarding extends StatelessWidget {
  final Onboard onboard;

  const _TelaBoarding({required this.onboard});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Image.asset(
              onboard.image,
              width: 400,
              height: 450,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              onboard.titulo,
              style: const TextStyle(
                fontFamily: Fontes.cabin,
                color: Cores.azul42A5F5,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              onboard.descricao,
              style: TextStyle(
                fontFamily: Fontes.raleway,
                fontWeight: FontWeight.w600,
                fontSize: 23,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(1, 2),
                    blurRadius: 7,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        )
      ],
    );
  }
}

/// Indicador visual do slide ativo (bolinhas inferiores).
class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);

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

/// Botão para avançar ao próximo slide.
class _BotaoProximo extends StatelessWidget {
  final PageController pageController;

  const _BotaoProximo({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Cores.azul42A5F5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
      child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
    );
  }
}

/// Botão final "COMEÇAR" para acessar o login.
class _BotaoComecar extends StatelessWidget {
  const _BotaoComecar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                child: const LoginPage(),
                type: PageTransitionType.rightToLeft,
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Cores.azul42A5F5,
            padding: const EdgeInsets.only(right: 35, left: 35, top: 10, bottom: 10),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
          child: const Text(
            'COMEÇAR',
            style: TextStyle(
              fontFamily: Fontes.inter,
              fontSize: 24,
              color: Cores.branco,
            ),
          ),
        )
      ],
    );
  }
}
