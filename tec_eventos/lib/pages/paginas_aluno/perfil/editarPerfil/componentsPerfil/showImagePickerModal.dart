import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tec_eventos/cores.dart';

class ShowImagePickerModal extends StatefulWidget {
  ShowImagePickerModal({Key? key}) : super(key: key);

  @override
  State<ShowImagePickerModal> createState() => _ShowImagePickerModalState();
}

class _ShowImagePickerModalState extends State<ShowImagePickerModal> {
  File? imagePerfil;

  @override
  Widget build(BuildContext context) {
    return showImagePicker();

  }

  showImagePicker() {
    return
         SingleChildScrollView(
            child: Card(
              elevation: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.4,
                              child: const Text(
                                "Foto de perfil",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 9),
                                width: MediaQuery.of(context).size.width / 1.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                  Border.all(width: 1, color: Colors.black),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 55,
                                      height: 55,
                                      decoration: const BoxDecoration(
                                        color: Color(0xffE3F2FD),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.add_photo_alternate_outlined,
                                        size: 25,
                                        color: Color(0xff1565C0),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 32,
                                    ),
                                    const Text(
                                      "Ir à galeria",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            imgFromGallery();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 9),
                                width: MediaQuery.of(context).size.width / 1.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                  Border.all(width: 1, color: Colors.black),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 55,
                                      height: 55,
                                      decoration: const BoxDecoration(
                                        color: Color(0xffE3F2FD),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.add_a_photo_outlined,
                                        size: 25,
                                        color: Cores.azul1565C0,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 32,
                                    ),
                                    const Text(
                                      "Tirar uma foto agora",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            imgFromCamera();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );

  }

  final picker = ImagePicker();

  refreshPerfilImage(File? newImage) {
    if (newImage != null) {
      setState(() {
        imagePerfil = newImage;
      });
    }
  }

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
}
