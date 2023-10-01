import "package:flutter/material.dart";
import "package:tec_eventos/cores.dart";

class TipoPagamento extends StatefulWidget {
  const TipoPagamento({super.key});

  @override
  State<TipoPagamento> createState() => _TipoPagamentoState();
}

class _TipoPagamentoState extends State<TipoPagamento> {
  final List<String> opcaoPagamento = <String>['Pago', 'Gratuito'];
  bool shouldShowInput = false;
  String dropdownValue = "Gratuito";
  TextEditingController controllerPreco = TextEditingController();

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
      title: DropdownButton<String>(
        value: dropdownValue,
        elevation: 0,
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
            shouldShowInput = (dropdownValue == 'Pago');
          });
        },
        items: opcaoPagamento.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
      trailing: shouldShowInput
          ? SizedBox(
              width: 100,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controllerPreco,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.attach_money_rounded,
                  ),
                ),
              ))
          : null,
    );
  }
}
