import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/all_pages.dart';
import 'package:tec_eventos/pages/paginas_instituicao/page_principal_instituicao/page_principal_instituicao.dart';
import 'package:tec_eventos/widgets/AddImagensEventos/adicionar_imagens_eventos.dart';
import 'package:tec_eventos/widgets/Appbar/AppBarPostarEventos/appbarpages_eventos.dart';
import 'package:tec_eventos/widgets/InputTextPostarEvento/ingressos.dart';
import 'package:tec_eventos/widgets/InputTextPostarEvento/tipo_pagamento.dart';

TextEditingController controllerDescricao = TextEditingController();
TextEditingController controllerCEP = TextEditingController();

class PagePostarEvento extends StatefulWidget {
  const PagePostarEvento({super.key});

  @override
  State<PagePostarEvento> createState() => _PagePostarEventoState();
}

class _PagePostarEventoState extends State<PagePostarEvento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          //AppBar
          const AppBarPostarEvento()
        ],
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            //parte do nome, horário e organização do evento
            ListTile(
              shape: Border(bottom: BorderSide(color: Cores.cinza)),
              style: ListTileStyle.drawer,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    height: 20,
                    child: TextFormField(
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 15,
                        color: Cores.cinza6A6666,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                          hintText: "Data",
                          hintStyle: TextStyle(
                              fontFamily: Fontes.raleway,
                              fontSize: 15,
                              color: Cores.cinza6A6666,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Text("às",
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 18,
                        color: Cores.cinza6A6666,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    width: 100,
                    height: 20,
                    child: TextFormField(
                      style: TextStyle(
                          fontFamily: Fontes.raleway,
                          fontSize: 15,
                          color: Cores.cinza6A6666,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: "Horário",
                        hintStyle: TextStyle(
                            fontFamily: Fontes.raleway,
                            fontSize: 15,
                            color: Cores.cinza6A6666,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: TextFormField(
                style: TextStyle(
                    fontFamily: Fontes.raleway,
                    fontSize: 20,
                    color: Cores.preto,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Nome do evento",
                  hintStyle: TextStyle(
                      fontFamily: Fontes.raleway,
                      fontSize: 20,
                      color: Cores.preto,
                      fontWeight: FontWeight.bold),
                ),
              ),
              trailing: SizedBox(
                width: 108,
                height: 39,
                child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     PageTransition(
                      //         child: const PagePostarEvento(),
                      //         type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Cores.preto),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 21,
                            color: Cores.preto,
                          ),
                          Text(
                            "Logo",
                            style: TextStyle(
                                fontFamily: Fontes.ralewayBold, fontSize: 18),
                          )
                        ],
                      ),
                    )),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Informações do ingresso",
                    style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  //parte dos ingressos restantes
                  const CaixaTextoIngressos(),

                  //parte do preço
                  const TipoPagamento(),

                  const SizedBox(height: 20),
                  Text(
                    "Descrição",
                    style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    maxLines: null,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            "Coloque mais informações sobre o evento aqui"),
                  ),

                  const SizedBox(height: 50),
                  Text(
                    "Local",
                    style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 5),

                  TextFormField(
                    maxLines: null,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Coloque a localização do evento aqui"),
                  ),
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
                                content: TextFormField(
                                  keyboardType: TextInputType.name,
                                  // controller: controllerUser,
                                  decoration: InputDecoration(
                                    suffixIcon:
                                        const Icon(Icons.location_on_outlined),
                                    isDense: true,
                                    labelText: "CEP",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                ),
                                actions: [
                                  GestureDetector(
                                    onTap: () {},
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
                                            borderRadius:
                                                BorderRadius.circular(20)),
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
                          Icon(Icons.location_on_outlined,
                              color: Cores.azul42A5F5),
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
                  const SizedBox(height: 50),
                  Text(
                    "Imagens do local",
                    style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AdicionarImagemEvento(),
                          AdicionarImagemEvento(),
                          AdicionarImagemEvento(),
                          AdicionarImagemEvento(),
                        ],
                      )),

                  const SizedBox(height: 30),

                  Center(
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         child: const PagePostarEvento(),
                        //         type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 61,
                        decoration: BoxDecoration(
                          border: Border.all(color: Cores.azul42A5F5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 59,
                              height: 61,
                              decoration: BoxDecoration(
                                  color: Cores.azul42A5F5,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5))),
                              child: Icon(
                                Icons.qr_code_2_outlined,
                                color: Cores.branco,
                                size: 33,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "Gerar QRcode",
                              style: TextStyle(
                                  fontFamily: Fontes.ralewayBold,
                                  color: Cores.azul42A5F5,
                                  fontSize: 27),
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         child: const PagePostarEvento(),
                        //         type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 61,
                        decoration: BoxDecoration(
                          border: Border.all(color: Cores.azul42A5F5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 59,
                              height: 61,
                              decoration: BoxDecoration(
                                  color: Cores.azul42A5F5,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5))),
                              child: Icon(
                                Icons.barcode_reader,
                                color: Cores.branco,
                                size: 33,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "Gerar Código de barras",
                              style: TextStyle(
                                  fontFamily: Fontes.ralewayBold,
                                  color: Cores.azul42A5F5,
                                  fontSize: 18),
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.topSlide,
            title: "Evento Cadastrado",
            btnOkText: "Fechar",
            barrierColor: Cores.branco.withOpacity(0.7),
            btnOkOnPress: () {},
            btnOkColor: Cores.azul42A5F5,
          ).show();
        },
        child: Container(
          height: 64,
          decoration: BoxDecoration(
              color: Cores.azul42A5F5,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
          child: Center(
            child: Text(
              "Postar Evento",
              style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Cores.branco),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
