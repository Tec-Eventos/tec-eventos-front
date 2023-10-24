import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tec_eventos/pages/paginas_aluno/perfil/editarPerfil/editar_perfil.dart';



refreshPerfilImage(File? newImage) {
  if (newImage != null) {
    setState(() {
      imagePerfil = newImage;
    });
  }
}



final picker = ImagePicker();

imgFromGallery() async {
  try {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        cropImage(File(value.path));
      }
    });
  } catch (e) {
    print("Erro ao tentar pegar a imagem da galeria: $e");
  }
}

imgFromCamera() async {
  try {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        cropImage(File(value.path));
      }
    });
  } catch (e) {
    print("Erro ao tentar tirar uma foto: $e");
  }
}



  Future<void> cropImage(File imgFile) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
          sourcePath: imgFile.path,
          aspectRatioPresets: Platform.isAndroid
              ? [
                  CropAspectRatioPreset.square,
                  CropAspectRatioPreset.ratio3x2,
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.ratio4x3,
                  CropAspectRatioPreset.ratio16x9
                ]
              : [
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.square,
                  CropAspectRatioPreset.ratio3x2,
                  CropAspectRatioPreset.ratio4x3,
                  CropAspectRatioPreset.ratio5x3,
                  CropAspectRatioPreset.ratio5x4,
                  CropAspectRatioPreset.ratio7x5,
                  CropAspectRatioPreset.ratio16x9
                ],
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: "Tec!Eventos",
                toolbarColor: Colors.blue,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
          ]);

      if (croppedFile != null) {
        setState(() {
          refreshPerfilImage(File(croppedFile.path));
        });
      }
    } catch (e) {
      print("Erro ao cortar imagem: $e");
    }
  }
