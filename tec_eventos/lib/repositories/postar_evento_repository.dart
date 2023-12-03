import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tec_eventos/utils/gerador_id_evento.dart';
import 'package:tec_eventos/utils/image_helper.dart';
import 'package:http_parser/http_parser.dart';

class PostarEventoRepository {
  String url = "http://192.168.1.112:8080";
  final idEvento = GeradorDeID().gerarIDUnico();
  dio.Dio dioInstance = dio.Dio();
  final imageHelper = ImageHelper();

  Future<bool?> sendQrCode(TextEditingController controllerQrCode) async {
    String qrCode = controllerQrCode.text;

    final body = {
      "cd_evento": 33,
      "valor_qr": qrCode,
    };

    var response = await http.post(
      Uri.parse(url + '/qrcode'),
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print("Success: ${response.body}");
      return true;
    } else {
      print("Erro: ${response.body}");
      return false;
    }
  }

  Future<bool?> sendImage(File? image) async {
    //envio do evento

    //envio das imagens
    String filename = image!.path.split('/').last;
    //criação do objeto FormData
    dio.FormData formData = dio.FormData.fromMap({
      "cd_evento": 33,
      "imagem": await dio.MultipartFile.fromFile(
        image.path,
        filename: filename,
        contentType: MediaType('image', 'jpg'),
      ),
      "principal": 1,
      "logo_evento": 0,
    });

    //envio do QrCode

    return _requisicaoImagem(formData);
  }

  Future<bool> _requisicaoImagem(dio.FormData formData) async {
    dio.Response responseImagem = await dioInstance.post(url + "/upload",
        data: formData,
        options: dio.Options(headers: {
          'accept': '*/*',
          'Content-Type': 'multipart/form-data',
        }));

    if (responseImagem.statusCode == 200) {
      print("Resposta: ${responseImagem.data}");
      return true;
    } else {
      print("Erro ${responseImagem.data}");
      return false;
    }
  }
  

  
}
