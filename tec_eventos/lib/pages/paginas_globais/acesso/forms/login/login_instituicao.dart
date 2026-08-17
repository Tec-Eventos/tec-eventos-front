import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/core/auth/auth_provider.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/all_pages.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_cdescolar.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_email.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_instituicao.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_password.dart';

/// Formulário de login da Instituição.
///
/// Gerencia os campos de entrada de forma local e chama o [authProvider] para autenticação.
class LoginInstituicao extends ConsumerStatefulWidget {
  /// Construtor padrão.
  const LoginInstituicao({super.key});

  @override
  ConsumerState<LoginInstituicao> createState() => _LoginInstituicaoState();
}

class _LoginInstituicaoState extends ConsumerState<LoginInstituicao> {
  final _formfield = GlobalKey<FormState>();
  final _controllerNomeInst = TextEditingController();
  final _controllerCdEscolar = TextEditingController();
  final _controllerEmailInst = TextEditingController();
  final _controllerSenhaInst = TextEditingController();
  bool _isChecked = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _controllerNomeInst.dispose();
    _controllerCdEscolar.dispose();
    _controllerEmailInst.dispose();
    _controllerSenhaInst.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formfield.currentState!.validate()) return;

    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    setState(() {
      _isLoading = true;
    });

    final cdEscolar = int.tryParse(_controllerCdEscolar.text.trim()) ?? 0;
    final nome = _controllerNomeInst.text.trim();
    final email = _controllerEmailInst.text.trim();
    final senha = _controllerSenhaInst.text;

    try {
      await ref.read(authProvider.notifier).loginInstituicao(
            instituicao: nome,
            email: email,
            cdEscolar: cdEscolar,
            senha: senha,
          );

      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: const AllPages(paginaAtual: 0),
            type: PageTransitionType.bottomToTop,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 0,
            content: Text(
              e.toString().replaceAll('Failure: ', ''),
              style: const TextStyle(fontFamily: Fontes.inter, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Cores.vermelho,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formfield,
          child: SizedBox(
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: InputTextInstituicao(controllerInstituicao: _controllerNomeInst),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: InputTextCdEscolar(controllerCdEscolar: _controllerCdEscolar),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: InputTextEmail(controllerEmail: _controllerEmailInst),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: InputTextPassword(controllerSenha: _controllerSenhaInst),
                ),
              ],
            ).animate().fade(),
          ),
        ),

        ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          autofocus: true,
          dense: true,
          leading: Checkbox(
            shape: const CircleBorder(),
            activeColor: Cores.azul42A5F5,
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value ?? false;
              });
            },
          ),
          title: const Text(
            "Lembrar-se de mim",
            style: TextStyle(
              fontFamily: Fontes.inter,
              fontSize: 15,
            ),
          ),
        ),

        const SizedBox(height: 10),

        GestureDetector(
          onTap: _isLoading ? null : _handleLogin,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: 282,
              height: 52,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Cores.azul47BBEC,
                    Cores.azul42A5F5,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: _isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: Fontes.raleway,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Cores.branco,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
