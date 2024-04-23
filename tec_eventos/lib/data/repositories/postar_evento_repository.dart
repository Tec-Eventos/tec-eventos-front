import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/data/repositories/instituicao_repository.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/utils/gerador_id_evento.dart';
import 'package:tec_eventos/utils/image_helper.dart';
import 'package:http_parser/http_parser.dart';
import 'package:tec_eventos/utils/providers/instituicao_provider.dart';

class PostarEventoRepository {
  String url = "https://api-tec-eventos-i6hr.onrender.com";
  final idEvento = GeradorDeID().gerarIDUnico();
  dio.Dio dioInstance = dio.Dio();
  final imageHelper = ImageHelper();

  //envio outras informações
  Future<void> cadastrarEvento({
    required String data,
    required String horario,
    required String nomeEvento,
    required String senhaEvento,
    required int ingressosQntd,
    required double preco,
    required String descricao,
    required String localEvento,
    required String qrCode,
    required File imagePrincipal,
    required File imagelogo,
    required BuildContext context,
  }) async {
    if (imagePrincipal != null) {
      print('chamou?');
      final cdInstituicao =
          Provider.of<InstituicaoProvider>(context, listen: false).cdEscolar;
      String filename = imagePrincipal.path.split('/').last;

      //estrutura dos eventos
      final Map<String, dynamic> bodyEvents = {
        "cd_evento": idEvento,
        "cd_instituicao": cdInstituicao,
        "nome_evento": nomeEvento,
        "data_evento": data,
        "horario": horario,
        "quantidade_ingressos": ingressosQntd,
        "descricao": descricao,
        "cep": localEvento,
        "senha": senhaEvento,
        "preco": preco
      };

      //estrutura do QrCode
      final bodyQrCode = {
        "cd_evento": idEvento,
        "valor_qr": qrCode,
      };

      //criação do objeto FormData
      dio.FormData formDataImagePrincipal = dio.FormData.fromMap({
        "cd_evento": idEvento,
        "imagem": await dio.MultipartFile.fromFile(
          imagePrincipal.path,
          filename: filename,
          contentType: MediaType('image', 'jpg'),
        ),
        "principal": 1,
        "logo_evento": 0,
      });

      dio.FormData formDataImageLogo = dio.FormData.fromMap({
        "cd_evento": idEvento,
        "imagem": await dio.MultipartFile.fromFile(
          imagePrincipal.path,
          filename: filename,
          contentType: MediaType('image', 'jpg'),
        ),
        "principal": 0,
        "logo_evento": 1,
      });

      final bodyCEP = {
        "cep": int.parse(localEvento),
        "logradouro": '',
        "complemento": '',
        "bairro": '',
        "cidade": '',
        "estado": '',
      };

      final responseCEP = await _requisicaoCEP(bodyCEP);
      final responseEvents = await _requisicaoEvento(bodyEvents);
      final responseImgPrincipal =
          await _requisicaoImagem(formDataImagePrincipal);
      final responseImgLogo = await _requisicaoLogo(formDataImageLogo);
      final responseQrCode = await _requisicaoQrCode(bodyQrCode);

      print(
          "Responses: ${responseEvents}, ${responseImgPrincipal}, ${responseQrCode}");
      if (responseEvents == 200 &&
          responseImgPrincipal == 200 &&
          responseQrCode == 200 &&
          responseCEP == 200) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.topSlide,
          titleTextStyle:
              TextStyle(fontFamily: Fontes.inter, fontWeight: FontWeight.w600),
          title: "Evento criado!",
          btnOkText: "Prosseguir",
          barrierColor: Cores.branco.withOpacity(0.7),
          btnOkOnPress: () {
            Navigator.pop(context);
          },
          btnOkColor: Cores.azul42A5F5,
        ).show();
      } else {
        print("Aparentemente deu errado");
        final snackBar = SnackBar(
          elevation: 0,
          content: Text(
            'Informações inválidas',
            style: TextStyle(
                fontFamily: Fontes.inter, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Cores.vermelho,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      print("Coloque a imagem principal");
      final snackBar = SnackBar(
        elevation: 0,
        content: Text(
          'Informações inválidas',
          style:
              TextStyle(fontFamily: Fontes.inter, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Cores.vermelho,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<int?> _requisicaoImagem(dio.FormData formData) async {
    dio.Response responseImagem = await dioInstance.post(url + "/upload",
        data: formData,
        options: dio.Options(headers: {
          'accept': '*/*',
          'Content-Type': 'multipart/form-data',
        }));

    if (responseImagem.statusCode == 200) {
      print("Resposta: ${responseImagem.data}");
      return responseImagem.statusCode;
    } else {
      print("Erro ${responseImagem.data}");
    }
  }

  Future<int?> _requisicaoLogo(dio.FormData formData) async {
    dio.Response responseImagem = await dioInstance.post(url + "/upload",
        data: formData,
        options: dio.Options(headers: {
          'accept': '*/*',
          'Content-Type': 'multipart/form-data',
        }));

    if (responseImagem.statusCode == 200) {
      print("Resposta: ${responseImagem.data}");
      return responseImagem.statusCode;
    } else {
      print("Erro ${responseImagem.data}");
    }
  }

  Future<int?> _requisicaoQrCode(var body) async {
    var response = await http.post(
      Uri.parse(url + '/qrcode'),
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print("Success: ${response.body}");
      return response.statusCode;
    } else {
      print("Erro: ${response.body}");
      return response.statusCode;
    }
  }

  Future<int?> _requisicaoEvento(var body) async {
    final response = await http.post(Uri.parse(url + '/event'),
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      print("deu certo" + response.body);
      return response.statusCode;
    } else {
      print("deu errado" + response.body);
      return response.statusCode;
    }
  }

  Future<int?> _requisicaoCEP(var body) async {
    final response = await http.post(Uri.parse(url + '/endereco'),
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      print("CEP inserido:" + response.body);
      return response.statusCode;
    } else {
      print("Deu ruim no CEP:" + response.body);
      return response.statusCode;
    }
  }
}
