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
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_password.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/input_telefone.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_cdescolar.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_cnpj.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_instituicao.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/InputText/inputs_instituicao/input_tipo_inst.dart';
import 'package:tec_eventos/pages/paginas_globais/acesso/login.dart';

/// Formulário de cadastro da Instituição.
///
/// Valida as entradas e consome o caso de uso [registerInstituicaoUseCaseProvider] do Riverpod.
class CadastroInstituicao extends ConsumerStatefulWidget {
  /// Construtor padrão.
  const CadastroInstituicao({super.key});

  @override
  ConsumerState<CadastroInstituicao> createState() => _CadastroInstituicaoState();
}

class _CadastroInstituicaoState extends ConsumerState<CadastroInstituicao> {
  final _formfield = GlobalKey<FormState>();

  final _controllerCNPJ = TextEditingController();
  final _controllerNomeInstituicao = TextEditingController();
  final _controllertipoInst = TextEditingController();
  final _controllerCdEscolar = TextEditingController();
  final _controllerEmailInstituicao = TextEditingController();
  final _controllerTellInst = TextEditingController();
  final _controllerCEPInst = TextEditingController();
  final _controllerSenhaInst = TextEditingController();
  final _controllerConfirmSenhaInst = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _controllerCNPJ.dispose();
    _controllerNomeInstituicao.dispose();
    _controllertipoInst.dispose();
    _controllerCdEscolar.dispose();
    _controllerEmailInstituicao.dispose();
    _controllerTellInst.dispose();
    _controllerCEPInst.dispose();
    _controllerSenhaInst.dispose();
    _controllerConfirmSenhaInst.dispose();
    super.dispose();
  }

  Future<void> _handleCadastro() async {
    if (!_formfield.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final cnpj = _controllerCNPJ.text.replaceAll(RegExp(r'[./-]'), '');
    final nomeInst = _controllerNomeInstituicao.text.trim();
    final cdEscolar = int.tryParse(_controllerCdEscolar.text.trim()) ?? 0;
    final emailInst = _controllerEmailInstituicao.text.trim();
    final teleInst = _controllerTellInst.text.replaceAll(RegExp(r'\D'), '');
    final cepInst = _controllerCEPInst.text.replaceAll('-', '');
    final senhaInst = _controllerSenhaInst.text;

    try {
      final registerUseCase = ref.read(registerInstituicaoUseCaseProvider);
      await registerUseCase.execute(
        instituicao: nomeInst,
        email: emailInst,
        telefone: teleInst,
        cep: cepInst,
        cdEscolar: cdEscolar,
        senha: senhaInst,
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
      title: "Instituição criada!",
      btnOkText: "Prosseguir",
      barrierColor: Cores.branco.withOpacity(0.7),
      btnOkOnPress: () async {
        const String userTypeKey = 'userType';
        final sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setString(userTypeKey, 'Instituição');

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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: InputTextCNPJ(controllerCNPJ: _controllerCNPJ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: InputTextInstituicao(controllerInstituicao: _controllerNomeInstituicao),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: InputTextTipoInstituicao(controllerTipoInstituicao: _controllertipoInst),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: InputTextCdEscolar(controllerCdEscolar: _controllerCdEscolar),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: InputTextEmail(controllerEmail: _controllerEmailInstituicao),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: InputTextTelefone(controllerTel: _controllerTellInst),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: InputTextCEP(controllerCEP: _controllerCEPInst),
                  ),
                  InputTextSenhaCadastro(
                    controllerSenha: _controllerSenhaInst,
                    controllerConfirmSenha: _controllerConfirmSenhaInst,
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
