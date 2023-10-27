import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:br_api/br_api.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/widgets/AddImagensEventos/adicionar_imagens_eventos.dart';
import 'package:tec_eventos/widgets/Appbar/AppBarPostarEventos/appbarpages_eventos.dart';
import 'package:tec_eventos/widgets/InputTextPostarEvento/ingressos.dart';
import 'package:tec_eventos/widgets/InputTextPostarEvento/tipo_pagamento.dart';
import 'package:tec_eventos/widgets/LocalEvent/local_event.dart';

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
          const EventsImage(),
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
                trailing: const LogoImage()),

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
                  const LocalEvent(),

                  const SizedBox(height: 50),

                  const MultipleImagesEvent(),

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

class LogoImage extends StatefulWidget {
  const LogoImage({Key? key}) : super(key: key);

  @override
  _LogoImageState createState() => _LogoImageState();
}

class _LogoImageState extends State<LogoImage> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          _image != null
              ? FittedBox(
                  fit: BoxFit.fill,
                  child: Image.file(
                    _image!,
                    width: 108,
                    height: 38,
                  ),
                )
              : Icon(Icons.add),
          TextButton(
            onPressed: () async {
              final files = await imageHelper.pickImage();
              if (files.isNotEmpty) {
                final croppedFile = await imageHelper.crop(
                  file: files.first,
                  cropStyle: CropStyle.rectangle,
                );

                if (croppedFile != null) {
                  setState(() => _image = File(croppedFile.path));
                }
              }
            },
            child: Text("Adicionar logo"),
          ),
        ],
      ),
    );

    // return SizedBox(
    //             width: 108,
    //             height: 39,
    //             child: InkWell(
    //                 onTap: () {
    //                   // Navigator.push(
    //                   //     context,
    //                   //     PageTransition(
    //                   //         child: const PagePostarEvento(),
    //                   //         type: PageTransitionType.bottomToTop));
    //                 },
    //                 child: Container(
    //                   decoration: BoxDecoration(
    //                     border: Border.all(color: Cores.preto),
    //                     borderRadius: BorderRadius.circular(8),
    //                   ),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       Icon(
    //                         Icons.add,
    //                         size: 21,
    //                         color: Cores.preto,
    //                       ),
    //                       Text(
    //                         "Logo",
    //                         style: TextStyle(
    //                             fontFamily: Fontes.ralewayBold, fontSize: 18),
    //                       )
    //                     ],
    //                   ),
    //                 )),
    //           );
  }
}
