import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Campo de texto customizado e interativo para edição de informações do usuário.
///
/// Possui um botão lateral de alternância de estado de edição (habilitado/desabilitado)
/// e se integra a um [TextEditingController] externo para envio e controle de dados.
class TextFFEditUser extends StatefulWidget {
  /// O controlador de texto vinculado ao campo.
  final TextEditingController controller;

  /// O rótulo ou título descritivo do campo (ex: 'Nome').
  final String labelText;

  /// Ícone que será exibido no início do campo.
  final Icon iconeInicio;

  /// Tipo de teclado apropriado para o campo (e-mail, telefone, texto, etc).
  final TextInputType keyBoardType;

  /// Formatadores opcionais de texto (ex: máscaras).
  final List<TextInputFormatter>? inputFormatters;

  /// Construtor padrão da entrada de texto para edição de perfil.
  const TextFFEditUser({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.iconeInicio,
    required this.keyBoardType,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<TextFFEditUser> createState() => _TextFFEditUserState();
}

class _TextFFEditUserState extends State<TextFFEditUser> {
  bool _isActivated = false;

  void _toggleHabilitado() {
    setState(() {
      _isActivated = !_isActivated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: 52,
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: _isActivated ? Colors.blue : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          IgnorePointer(
            ignoring: !_isActivated,
            child: TextFormField(
              keyboardType: widget.keyBoardType,
              inputFormatters: widget.inputFormatters,
              controller: widget.controller,
              enabled: _isActivated,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(widget.iconeInicio.icon, color: Colors.black54),
                labelText: widget.labelText,
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
          ),
          IconButton(
            onPressed: _toggleHabilitado,
            icon: Icon(
              _isActivated ? Icons.check_circle_outline : Icons.edit_outlined,
              size: 22,
              color: _isActivated ? Colors.green : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
