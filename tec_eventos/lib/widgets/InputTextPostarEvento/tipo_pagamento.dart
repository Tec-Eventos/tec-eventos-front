import "package:flutter/material.dart";
import "package:tec_eventos/cores.dart";
import "package:tec_eventos/fontes.dart";

class TipoPagamento extends StatefulWidget {
  const TipoPagamento({super.key, required this.controllerPreco});

  final TextEditingController controllerPreco;

  @override
  State<TipoPagamento> createState() => _TipoPagamentoState();
}

class _TipoPagamentoState extends State<TipoPagamento> {
  final List<String> opcaoPagamento = <String>['Pago', 'Gratuito'];
  bool shouldShowInput = false;
  String? selectedPagamento = 'Gratuito';
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 40,
        width: 40,
        child: CircleAvatar(
            backgroundColor: Cores.azul42A5F5,
            child: Icon(
              Icons.payments_outlined,
              color: Cores.branco,
              size: 20,
            )),
      ),
      title: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        value: selectedPagamento,
        elevation: 0,
        dropdownColor: Cores.branco,
        isDense: false,
        items: opcaoPagamento.map<DropdownMenuItem<String>>((opcaoPagamento) {
          return DropdownMenuItem<String>(
            value: opcaoPagamento,
            child: Text(
              opcaoPagamento,
              style: TextStyle(
                  fontFamily: Fontes.inter, fontWeight: FontWeight.w600),
            ),
          );
        }).toList(),
        onChanged: (opcaoPagamento) {
          setState(() {
            selectedPagamento = opcaoPagamento;
            shouldShowInput = (selectedPagamento == 'Pago');
          });
        },
      ),
      trailing: shouldShowInput
          ? SizedBox(
              width: 100,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: widget.controllerPreco,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                  hintText: "00.00",
                  hintStyle: TextStyle(
                    fontSize: 20,
                  ),
                  prefixIcon: Icon(
                    Icons.attach_money_rounded,
                    size: 25,
                  ),
                ),
              ))
          : null,
    );
  }
}
