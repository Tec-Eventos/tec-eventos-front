import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/gerador_id_evento.dart';
import 'package:tec_eventos/pages/paginas_aluno/meuIngresso/QrCodeIngresso/qrcode_ingresso.dart';
import 'package:tec_eventos/widgets/AddImagensEventos/adicionar_imagens_eventos.dart';
import 'package:tec_eventos/widgets/Appbar/AppBarPostarEventos/appbarpages_eventos.dart';
import 'package:tec_eventos/widgets/InputTextPostarEvento/ingressos.dart';
import 'package:tec_eventos/widgets/InputTextPostarEvento/tipo_pagamento.dart';
import 'package:tec_eventos/widgets/LocalEvent/local_event.dart';
import 'package:tec_eventos/widgets/gerarQrCodeButton/dialogQrCode/dialog_qrcode.dart';
import 'package:http/http.dart' as http;

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
                      SizedBox(
                        width: 100,
                        height: 20,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: controllerDataEvento,
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
                          keyboardType: TextInputType.text,
                          controller: controllerHorarioEvento,
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
                    keyboardType: TextInputType.name,
                    controller: controllerNomeEvento,
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

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        border: InputBorder.none,
                      ),
                      value: selectedPrivacidade,
                      elevation: 0,
                      dropdownColor: Cores.branco,
                      isDense: false,
                      items: privacidadeEvento
                          .map<DropdownMenuItem<String>>((privacidadeEvento) {
                        return DropdownMenuItem<String>(
                          value: privacidadeEvento,
                          child: Text(
                            privacidadeEvento,
                            style: TextStyle(
                                fontFamily: Fontes.inter,
                                fontWeight: FontWeight.w600),
                          ),
                        );
                      }).toList(),
                      onChanged: (privacidadeEvento) {
                        setState(() {
                          selectedPrivacidade = privacidadeEvento as String;
                          controllerPrivacidadeEvento.text =
                              selectedPrivacidade!;
                          shouldShowInput = (selectedPrivacidade == 'Privado');
                        });
                      },
                    ),
                  ),
                  if (shouldShowInput) ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: SizedBox(
                          width: 200,
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: controllerSenhaPrivEvento,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              hintText: "Informe a senha do evento",
                              hintStyle: TextStyle(
                                  fontSize: 13, fontFamily: Fontes.raleway),
                            ),
                          )),
                    )
                  ]
                ],
              ),

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
                    TipoPagamento(controllerPreco: controllerPrecoIngresso),

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

                    const SizedBox(height: 50),

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
                          dialogQrCode(context, controllerQrCode);
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
          cadastrarEvento();
          // AwesomeDialog(
          //   context: context,
          //   dialogType: DialogType.success,
          //   animType: AnimType.topSlide,
          //   title: "Evento Cadastrado",
          //   btnOkText: "Fechar",
          //   barrierColor: Cores.branco.withOpacity(0.7),
          //   btnOkOnPress: () {},
          //   btnOkColor: Cores.azul42A5F5,
          // ).show();
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

  Future<void> cadastrarEvento() async {
    GeradorDeID gerador = GeradorDeID();

    final idEvento = gerador.gerarIDUnico();
    final cdInstituicao = 17154741;
    final data = controllerDataEvento.text;
    final horario = controllerHorarioEvento.text;
    final nomeEvento = controllerNomeEvento.text;
    final tipoPrivacidade = controllerPrivacidadeEvento.text;
    final senhaEvento = controllerSenhaPrivEvento.text;
    final ingressosQntd = int.tryParse(controllerQntdIngresso.text);
    final tipoPagamento = controllerTipoIngresso.text;
    final precoIngresso = controllerPrecoIngresso.text;
    final descricaoEvento = controllerDescricaoEvento.text;
    final localEvento = controllerCEPEvento.text.replaceAll("-", "");
    final valorQrEvento = controllerQrCode.text;

    final Map<String, dynamic> body = {
      "cd_evento": idEvento,
      "cd_instituicao": cdInstituicao,
      "nome_evento": nomeEvento,
      "data_evento": data,
      "horario": horario,
      "quantidade_ingressos": ingressosQntd,
      "descricao": descricaoEvento,
      "cep": localEvento,
      "senha": senhaEvento
    };

    final url = Uri.parse('http://192.168.1.112:8080/event');
    final response = await http.post(url,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return showMessageSuccess();
    } else {
      return showMessageError();
    }
  }

  showMessageSuccess() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      titleTextStyle:
          TextStyle(fontFamily: Fontes.inter, fontWeight: FontWeight.w600),
      title: "Evento Criado!",
      btnOkText: "Prosseguir",
      barrierColor: Cores.branco.withOpacity(0.7),
      btnOkOnPress: () {},
      btnOkColor: Cores.azul42A5F5,
    ).show();
  }

  showMessageError() {
    final snackBar = SnackBar(
      elevation: 0,
      content: Text(
        'Informações inválidas',
        style: TextStyle(fontFamily: Fontes.inter, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Cores.vermelho,
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                    height: 36,
                  ),
                )
              : ElevatedButton.icon(
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
        setState(() => _image = File(croppedFile.path));
      }
    }
  }
}

//envio de imagens - LOGO
 
