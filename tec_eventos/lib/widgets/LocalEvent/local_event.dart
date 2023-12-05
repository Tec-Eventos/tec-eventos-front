import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/data/dataController_cep.dart';
import 'package:tec_eventos/data/models/cepModel.dart';
import 'package:tec_eventos/fontes.dart';

class LocalEvent extends StatefulWidget {
  const LocalEvent({super.key, required this.controllerCEP});

  final TextEditingController controllerCEP;
  @override
  State<LocalEvent> createState() => _LocalEventState();
}

class _LocalEventState extends State<LocalEvent> {
  @override
  void dispose() {
    super.dispose();
  }

  CEP? model = CEP();
  dynamic endereco = '';
  var maskcep = MaskTextInputFormatter(mask: '#####-###');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$endereco'),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.8,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
              side: BorderSide(
                color: Cores.azul42A5F5,
              ),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      actionsAlignment: MainAxisAlignment.center,
                      contentPadding: const EdgeInsets.all(20),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Adicione o cep:",
                            style: TextStyle(
                                fontFamily: Fontes.inter,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close)),
                        ],
                      ),
                      content: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [maskcep],
                        controller: widget.controllerCEP,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.location_on_outlined),
                          isDense: true,
                          labelText: "CEP",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      actions: [
                        GestureDetector(
                          onTap: () async {
                            sendCepEvent();
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
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
                                      end: Alignment.bottomRight),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "Confirmar",
                                  style: TextStyle(
                                      fontFamily: Fontes.inter,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      color: Cores.branco),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on_outlined, color: Cores.azul42A5F5),
                Text(
                  "Adicionar coordenada",
                  style: TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Cores.azul42A5F5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> sendCepEvent() async {
    model = await CepController()
        .getCEP(widget.controllerCEP.text.toString().replaceAll("-", ""));

    setState(() {
      if (model?.logradouro == "" ||
          model?.bairro == "" ||
          model?.localidade == "" ||
          model?.uf == "") {
        endereco = "Não foi possivel encontrar o endereço";
      } else {
        endereco =
            "${model?.logradouro}, ${model?.bairro} - ${model?.localidade}-${model?.uf} - ${model?.cep}";
      }
    });
  }
}
