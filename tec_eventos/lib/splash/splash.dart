import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/core/auth/auth_provider.dart';
import 'package:tec_eventos/pages/all_pages.dart';
import 'package:tec_eventos/pages/paginas_aluno/onBoarding/onboarding.dart';

/// Tela inicial de Splash do aplicativo.
///
/// Inicializa e aguarda a sessão reativa do [authProvider] ser resolvida
/// para direcionar o usuário logado para o fluxo principal (AllPages)
/// ou não-logado para o OnBoarding.
class Splash extends ConsumerStatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  ConsumerState<Splash> createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> {
  @override
  void initState() {
    super.initState();
    _verificarSessao();
  }

  Future<void> _verificarSessao() async {
    // Aguarda o post-frame callback para que o build do contexto esteja pronto
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final authState = await ref.read(authProvider.future);

      if (mounted) {
        if (authState?.isAuthenticated == true) {
          Navigator.pushReplacement(
            context,
            PageTransition(
              child: AllPages(paginaAtual: 0),
              type: PageTransitionType.bottomToTop,
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            PageTransition(
              child: const OnBoarding(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              './assets/t!e_logo.png',
              height: 300,
              width: 300,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
