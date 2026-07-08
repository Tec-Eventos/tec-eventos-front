import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/core/auth/auth_provider.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_cep.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_email.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_telefone.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_aluno/input_name.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_aluno/input_rmaluno.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_password.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_cdescolar.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/login.dart';

/// Formulário de cadastro do Aluno.
///
/// Valida as entradas e consome o caso de uso [registerAlunoUseCaseProvider] do Riverpod.
class CadastroAluno extends ConsumerStatefulWidget {
  /// Construtor padrão.
  const CadastroAluno({super.key});

  @override
  ConsumerState<CadastroAluno> createState() => _CadastroAlunoState();
}

class _CadastroAlunoState extends ConsumerState<CadastroAluno> {
  final _formfield = GlobalKey<FormState>();
  final _controllerNomeAluno = TextEditingController();
  final _controllerEmailAluno = TextEditingController();
  final _controllerTellAluno = TextEditingController();
  final _controllerCEPAluno = TextEditingController();
  final _controllerInstAluno = TextEditingController();
  final _controllerRmAlunooo = TextEditingController();
  final _controllerSenhaAluno = TextEditingController();
  final _controllerConfirmSenha = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _controllerNomeAluno.dispose();
    _controllerEmailAluno.dispose();
    _controllerTellAluno.dispose();
    _controllerCEPAluno.dispose();
    _controllerInstAluno.dispose();
    _controllerRmAlunooo.dispose();
    _controllerSenhaAluno.dispose();
    _controllerConfirmSenha.dispose();
    super.dispose();
  }

  Future<void> _handleCadastro() async {
    if (!_formfield.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final nome = _controllerNomeAluno.text.trim();
    final email = _controllerEmailAluno.text.trim();
    final telefone = _controllerTellAluno.text.replaceAll(RegExp(r'\D'), '');
    final cep = _controllerCEPAluno.text.replaceAll('-', '');
    final cdEscolar = int.tryParse(_controllerInstAluno.text.trim()) ?? 0;
    final rm = int.tryParse(_controllerRmAlunooo.text.trim()) ?? 0;
    final senha = _controllerSenhaAluno.text;

    try {
      final registerUseCase = ref.read(registerAlunoUseCaseProvider);
      await registerUseCase.execute(
        nome: nome,
        email: email,
        telefone: telefone,
        cep: cep,
        cdEscolar: cdEscolar,
        rm: rm,
        senha: senha,
      );

      if (mounted) {
        _showMessageSuccess();
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

  void _showMessageSuccess() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      titleTextStyle: const TextStyle(fontFamily: Fontes.inter, fontWeight: FontWeight.w600),
      title: "Usuário criado!",
      btnOkText: "Prosseguir",
      barrierColor: Cores.branco.withOpacity(0.7),
      btnOkOnPress: () async {
        const String userTypeKey = 'userType';
        final sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setString(userTypeKey, 'Aluno');

        if (mounted) {
          Navigator.pushReplacement(
            context,
            PageTransition(
              child: const LoginPage(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        }
      },
      btnOkColor: Cores.azul42A5F5,
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formfield,
          child: SizedBox(
            height: 400,
            width: 350,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: InputTextName(controllerUser: _controllerNomeAluno),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: InputTextEmail(controllerEmail: _controllerEmailAluno),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: InputTextTelefone(controllerTel: _controllerTellAluno),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: InputTextCEP(controllerCEP: _controllerCEPAluno),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: InputTextCdEscolar(controllerCdEscolar: _controllerInstAluno),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: InputTextRmAluno(controllerRmAluno: _controllerRmAlunooo),
                  ),
                  InputTextSenhaCadastro(
                    controllerSenha: _controllerSenhaAluno,
                    controllerConfirmSenha: _controllerConfirmSenha,
                  ),
                ],
              ).animate().fade(),
            ),
          ),
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: _isLoading ? null : _handleCadastro,
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
                        "Cadastrar-se",
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
