import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/pages/paginas_aluno/pag_principal/principal_page.dart';

class AppBarPostarEvento extends StatefulWidget {
  const AppBarPostarEvento({super.key});

  @override
  State<AppBarPostarEvento> createState() => _AppBarPostarEventoState();
}

class _AppBarPostarEventoState extends State<AppBarPostarEvento> {
  File? image;
  @override
  Widget build(BuildContext context) {



    Widget ButtonImgEvent = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: InkWell(
          onTap: () async{
              Map<Permission, PermissionStatus> statuses = await [
              Permission.storage,
                  Permission.camera,
            ].request();
            if (statuses[Permission.storage]!.isGranted &&
            statuses[Permission.camera]!.isGranted) {
            showImagePicker();
            } else {
            print("Permissão negada!");
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 61,
            decoration: BoxDecoration(
              border: Border.all(color: Cores.preto),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Container(
                  width: 59,
                  height: 61,
                  decoration: BoxDecoration(
                      color: Cores.preto,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5))),
                  child: Icon(
                    Icons.add,
                    color: Cores.branco,
                    size: 33,
                  ),
                ),
                const Spacer(),
                Text(
                  "Imagem do evento",
                  style: TextStyle(
                      fontFamily: Fontes.ralewayBold,
                      color: Cores.preto,
                      fontSize: 27),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );


    Widget imagemEvento = Stack(

          children: [
            Image.file(
              image!,
              key: ValueKey(image!.path),
              fit: BoxFit.fill,
            ),

            OutlinedButton(onPressed: (){}, child: Text("Remover imagem"))
          ]
        );


    double displayHeight = MediaQuery.of(context).size.height;

    return SliverAppBar(

      expandedHeight: displayHeight / 3,
      flexibleSpace: FlexibleSpaceBar(

        background: image == null ? ButtonImgEvent : imagemEvento,
      ),
      floating: true,
      snap: true,
      pinned: true,
      elevation: 0,
      backgroundColor: Cores.brancoCinzento,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 30,
          color: Cores.branco,
        ),
      ),
    );
  }



  showImagePicker() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        ),
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
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
                                      child: const Icon(
                                        Icons.add_photo_alternate_outlined,
                                        size: 25,
                                        color: Color(0xff1565C0),
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Color(0xffE3F2FD),
                                        shape: BoxShape.circle,
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
                                      child: Icon(
                                        Icons.add_a_photo_outlined,
                                        size: 25,
                                        color: Cores.azul1565C0,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Color(0xffE3F2FD),
                                        shape: BoxShape.circle,
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
        });
  }

  final picker = ImagePicker();

  refreshPerfilImage(File? newImage) {
    if (newImage != null) {
      setState(() {
         image = newImage;
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



