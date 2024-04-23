import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/data/repositories/postar_evento_repository.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_instituicao/page_postar_evento/input_text/data.dart';
import 'package:tec_eventos/pages/paginas_instituicao/page_postar_evento/input_text/hora.dart';
import 'package:tec_eventos/pages/paginas_instituicao/page_postar_evento/input_text/nome_evento.dart';
import 'package:tec_eventos/pages/paginas_aluno/meuIngresso/QrCodeIngresso/qrcode_ingresso.dart';
import 'package:tec_eventos/widgets/AddImagensEventos/adicionar_imagens_eventos.dart';
import 'package:tec_eventos/widgets/Appbar/AppBarPostarEventos/appbarpages_eventos.dart';
import 'package:tec_eventos/widgets/InputTextPostarEvento/ingressos.dart';
import 'package:tec_eventos/widgets/InputTextPostarEvento/tipo_pagamento.dart';
import 'package:tec_eventos/widgets/LocalEvent/local_event.dart';
import 'package:tec_eventos/widgets/gerarQrCodeButton/dialogQrCode/dialog_qrcode.dart';
import 'package:dio/dio.dart' as dio;

TextEditingController controllerDataEvento = TextEditingController();
TextEditingController controllerHorarioEvento = TextEditingController();
TextEditingController controllerNomeEvento = TextEditingController();
TextEditingController controllerPrivacidadeEvento = TextEditingController();
TextEditingController controllerSenhaPrivEvento = TextEditingController();
TextEditingController controllerQntdIngresso = TextEditingController();
TextEditingController controllerTipoIngresso = TextEditingController();
TextEditingController controllerPrecoIngresso = TextEditingController();
TextEditingController controllerDescricaoEvento = TextEditingController();
TextEditingController controllerCEPEvento = TextEditingController();
TextEditingController controllerQrCode = TextEditingController();
File? image;
File? imageLogo;

class PagePostarEvento extends StatefulWidget {
  const PagePostarEvento({super.key});

  @override
  State<PagePostarEvento> createState() => _PagePostarEventoState();
}

class _PagePostarEventoState extends State<PagePostarEvento> {
  final _formfield = GlobalKey<FormState>();
  final List<String> privacidadeEvento = <String>['Público', 'Privado'];
  bool shouldShowInput = false;
  String? selectedPrivacidade = 'Público';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          //AppBar
          const EventsImage(),
        ],
        body: Form(
          key: _formfield,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //parte do nome, horário e organização do evento
              ListTile(
                  shape: Border(bottom: BorderSide(color: Cores.cinza)),
                  style: ListTileStyle.drawer,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DataInput(controllerDataEvento: controllerDataEvento),
                      Text("às",
                          style: TextStyle(
                            fontFamily: Fontes.raleway,
                            fontSize: 18,
                            color: Cores.cinza6A6666,
                            fontWeight: FontWeight.bold,
                          )),
                      HoraInput(controllerHorario: controllerHorarioEvento),
                    ],
                  ),
                  subtitle: NomeEventoInput(
                      controllerNomeEvento: controllerNomeEvento),
                  trailing: const LogoImage()),

              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     SizedBox(
              //       width: 200,
              //       child: DropdownButtonFormField<String>(
              //         decoration: const InputDecoration(
              //           prefixIcon: Icon(Icons.lock_outline_rounded),
              //           border: InputBorder.none,
              //         ),
              //         value: selectedPrivacidade,
              //         elevation: 0,
              //         dropdownColor: Cores.branco,
              //         isDense: false,
              //         items: privacidadeEvento
              //             .map<DropdownMenuItem<String>>((privacidadeEvento) {
              //           return DropdownMenuItem<String>(
              //             value: privacidadeEvento,
              //             child: Text(
              //               privacidadeEvento,
              //               style: TextStyle(
              //                   fontFamily: Fontes.inter,
              //                   fontWeight: FontWeight.w600),
              //             ),
              //           );
              //         }).toList(),
              //         onChanged: (privacidadeEvento) {
              //           setState(() {
              //             selectedPrivacidade = privacidadeEvento as String;
              //             controllerPrivacidadeEvento.text =
              //                 selectedPrivacidade!;
              //             shouldShowInput = (selectedPrivacidade == 'Privado');
              //           });
              //         },
              //       ),
              //     ),
              //     if (shouldShowInput) ...[
              //       Padding(
              //         padding: const EdgeInsets.only(left: 18.0),
              //         child: SizedBox(
              //             width: 200,
              //             child: TextFormField(
              //               keyboardType: TextInputType.visiblePassword,
              //               controller: controllerSenhaPrivEvento,
              //               decoration: InputDecoration(
              //                 alignLabelWithHint: true,
              //                 hintText: "Informe a senha do evento",
              //                 hintStyle: TextStyle(
              //                     fontSize: 13, fontFamily: Fontes.raleway),
              //               ),
              //             )),
              //       )
              //     ]
              //   ],
              // ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
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
                    CaixaTextoIngressos(
                        controllerIngressos: controllerQntdIngresso),

                    //parte do preço

                    ListTile(
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
                        title: Text(
                          "Gratuito",
                          style: TextStyle(
                            fontFamily: Fontes.raleway,
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        )),
                    // TipoPagamento(controllerPreco: controllerPrecoIngresso),

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
                      controller: controllerDescricaoEvento,
                      maxLines: null,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              "Coloque mais informações sobre o evento aqui"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Coloque a descrição do evento";
                        }
                      },
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
                    LocalEvent(controllerCEP: controllerCEPEvento),

                    const SizedBox(height: 30),

                    const MultipleImagesEvent(),

                    const SizedBox(height: 30),

                    if (controllerQrCode.text.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Código gerado:",
                              style: TextStyle(
                                color: Cores.preto,
                                fontFamily: Fontes.ralewayBold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Exemplo do ingresso: ",
                              style: TextStyle(
                                color: Cores.preto,
                                fontFamily: Fontes.raleway,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(height: 30),
                            QrCodeIngresso(valorQrCode: controllerQrCode.text),
                            const SizedBox(height: 30),
                            Text(
                              "(Esse será o ingresso gerado para que você possa ter acesso ao evento.)",
                              style: TextStyle(
                                color: Cores.preto,
                                fontFamily: Fontes.raleway,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],

                    Center(
                      child: InkWell(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return DialogQrCode(
                                    controllerQrCode: controllerQrCode);
                              });
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }

          List<String> partes = controllerDataEvento.text.split('/');

          DateTime data =
              DateTime.parse("${_formatarData(controllerDataEvento.text)}");
          String dataFormatada =
              "${data.year}-${_doisDigitos(data.month)}-${_doisDigitos(data.day)}";

          String horaFormatada = _formatarHora(controllerHorarioEvento.text);

          // controllerDataEvento.text
          // controllerDataEvento.text

          PostarEventoRepository().cadastrarEvento(
            data: dataFormatada,
            horario: horaFormatada,
            nomeEvento: controllerNomeEvento.text,
            senhaEvento: '',
            ingressosQntd: int.parse(controllerQntdIngresso.text),
            preco: 0.0,
            descricao: controllerDescricaoEvento.text,
            localEvento: controllerCEPEvento.text.replaceAll("-", ""),
            qrCode: controllerQrCode.text,
            imagePrincipal: image!,
            imagelogo: imageLogo!,
            context: context,
          );
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

  String _formatarData(String dataString) {
    List<String> partes = dataString.split('/');
    return "${partes[2]}-${_doisDigitos(int.parse(partes[1]))}-${_doisDigitos(int.parse(partes[0]))}";
  }

  String _formatarHora(String horaString) {
    List<String> partes = horaString.split('h');
    return "${_doisDigitos(int.parse(partes[0]))}:${_doisDigitos(int.parse(partes[1]))}:00";
  }

  String _doisDigitos(int numero) {
    return numero.toString().padLeft(2, '0');
  }
}

class LogoImage extends StatefulWidget {
  const LogoImage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LogoImageState createState() => _LogoImageState();
}

class _LogoImageState extends State<LogoImage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108,
      height: 36,
      child: Column(
        children: [
          imageLogo != null
              ? Column(
                  children: [
                    Image.file(
                      imageLogo!,
                      fit: BoxFit.contain,
                      width: 108,
                      height: 36,
                    ),
                  ],
                )
              : SizedBox(
                  height: 35,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      sendImageLogo();
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Cores.preto))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Cores.branco),
                    ),
                    icon: Icon(Icons.add, color: Cores.preto),
                    label: Text(
                      'Logo',
                      style: TextStyle(
                        color: Cores.preto,
                        fontFamily: Fontes.ralewayBold,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Future<void> sendImageLogo() async {
    final files = await imageHelper.pickImage();
    if (files.isNotEmpty) {
      final croppedFile = await imageHelper.crop(
        file: files.first,
        cropStyle: CropStyle.rectangle,
      );

      if (croppedFile != null) {
        setState(() => imageLogo = File(croppedFile.path));
      }
    }
  }
}

class EventsImage extends StatefulWidget {
  const EventsImage({
    super.key,
  });

  @override
  State<EventsImage> createState() => _EventsImageState();
}

class _EventsImageState extends State<EventsImage> {
  dio.Dio dioInstance = dio.Dio();

  @override
  Widget build(BuildContext context) {
    double displayHeight = MediaQuery.of(context).size.height;
    return SliverAppBar(
        expandedHeight: displayHeight / 3,
        flexibleSpace: FlexibleSpaceBar(
          background: image != null
              ? FittedBox(
                  fit: BoxFit.cover,
                  child: Image.file(image!),
                )
              : Center(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      sendImagePrincipal();
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Cores.preto))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Cores.branco),
                    ),
                    icon: Icon(Icons.add, color: Cores.preto),
                    label: Text(
                      'Imagem do Evento',
                      style: TextStyle(
                        color: Cores.preto,
                        fontFamily: Fontes.ralewayBold,
                      ),
                    ),
                  ),
                ),
        ),
        floating: true,
        snap: true,
        pinned: true,
        elevation: 0,
        backgroundColor: Cores.branco,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Cores.preto,
          ),
        ),
        actions: [
          image != null
              ? IconButton(
                  onPressed: () {
                    sendImagePrincipal();
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 25,
                    color: Cores.preto,
                  ))
              : Container(),
        ]);
  }

  sendImagePrincipal() async {
    final files = await imageHelper.pickImage();
    if (files.isNotEmpty) {
      final croppedFile = await imageHelper.crop(
        file: files.first,
        cropStyle: CropStyle.rectangle,
      );

      FocusScopeNode currentFocus = FocusScope.of(context);
      currentFocus.unfocus();

      if (croppedFile != null) {
        return setState(() => image = File(croppedFile.path));
      }
    }
  }
}
