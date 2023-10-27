
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tec_eventos/api_cep/data/dataController_cep.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

class LocalEvent extends StatefulWidget {
  const LocalEvent({super.key});

  @override
  State<LocalEvent> createState() => _LocalEventState();
}

class _LocalEventState extends State<LocalEvent> {
  @override
  void dispose() {
    controllerCEP.dispose();
    super.dispose();
  }


  dynamic endereco = '';
  var maskcep = MaskTextInputFormatter(mask: '#####-###');
  late TextEditingController controllerCEP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$endereco'),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.3,
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
                      contentPadding: const EdgeInsets.all(20),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back)),
                          const SizedBox(width: 10),
                          Text(
                            "Adicione o cep:",
                            style: TextStyle(
                                fontFamily: Fontes.inter,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      content: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [maskcep],
                        controller: controllerCEP,
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
                            final replace = int.tryParse(
                                controllerCEP.text.replaceAll("-", ""));
                            FutureBuilder(
                                future: callCep(replace),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    setState(() async {
                                      endereco = await callCep(replace);
                                    });

                                    return endereco;
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                });

                            setState(
                                () async => endereco = await callCep(replace));

                            Navigator.of(context).pop();
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

              // Navigator.push(
              //     context,
              //     PageTransition(
              //         child: const GooglePage(),
              //         type: PageTransitionType.bottomToTop));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on_outlined, color: Cores.azul42A5F5),
                Text(
                  "Adicionar coordenada",
                  style: TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Cores.azul42A5F5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

