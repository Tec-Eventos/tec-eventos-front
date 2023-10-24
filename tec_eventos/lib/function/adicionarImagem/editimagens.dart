import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/function/adicionarImagem/img_gallery.dart';

class EditImagens extends StatefulWidget {
  const EditImagens({Key? key}) : super(key: key);

  @override
  _EditImagensState createState() => _EditImagensState();
}

class _EditImagensState extends State<EditImagens> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.storage,
          Permission.camera,
        ].request();
        if (statuses[Permission.storage]!.isGranted &&
            statuses[Permission.camera]!.isGranted) {
          showImagePicker();
        } else {
          print("Alou, ta podendo falar ou ta negando permissão?");
        }
      },
      icon: const Icon(Icons.photo_camera_outlined),
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
}
