import 'dart:io';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tec_eventos/cameraAccess/preview_page.dart';
import 'package:tec_eventos/paginas/perfil/editarPerfil/componentsPerfil/textFormFieldEditUser.dart';
import 'package:tec_eventos/widgets/anexo.dart';

class EditProfileUser extends StatefulWidget {
  const EditProfileUser({Key? key}) : super(key: key);

  @override
  State<EditProfileUser> createState() => _EditProfileUserState();
}

class _EditProfileUserState extends State<EditProfileUser> {
  File? imagePerfil;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE3F2FD),
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 27,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Editar Perfil",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "SALVAR",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/perfilcima.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 13),
                              child: SizedBox(
                                height: 130,
                                width: 130,
                                child: imagePerfil == null
                                    ? Image.asset('assets/imgPerfil.png')
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.file(
                                          imagePerfil!,
                                          key: ValueKey(imagePerfil!.path),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                              ),
                            ),
                            Positioned(
                              top: 12,
                              right: 0,
                              child: Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: const Color(0xffEBEBEB),
                                ),
                                child: IconButton(
                                  onPressed: () async {
                                    Map<Permission, PermissionStatus> statuses =
                                        await [
                                      Permission.storage,
                                      Permission.camera,
                                    ].request();
                                    if (statuses[Permission.storage]!
                                            .isGranted &&
                                        statuses[Permission.camera]!
                                            .isGranted) {
                                      showImagePicker(context);
                                    } else {
                                      print(
                                          "Alou, ta podendo falar ou ta negando permissão?");
                                    }
                                  },
                                  icon: const Icon(Icons.photo_camera_outlined),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Column(
              children: [
                Text(
                  "Gabriel Felix",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Text(
                  "Desempregado",
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            TextFFEditUser(
              keyBoardType: TextInputType.text,
              conteudoCampo: "Gabriel Felix",
              iconeInicio: Icon(
                Icons.person_outline,
                size: 17,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFFEditUser(
              conteudoCampo: "+55 (14) 997684312",
              iconeInicio: Icon(Icons.call_outlined, size: 17),
              keyBoardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFFEditUser(
              keyBoardType: TextInputType.emailAddress,
              conteudoCampo: "gabriel123@etec.com",
              iconeInicio: Icon(Icons.email_outlined, size: 17),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFFEditUser(
              keyBoardType: TextInputType.number,
              conteudoCampo: "RM - 21091",
              iconeInicio: Icon(Icons.qr_code_2, size: 17),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFFEditUser(
              keyBoardType: TextInputType.text,
              conteudoCampo: "Etec Antonio Devisate",
              iconeInicio: Icon(Icons.school_outlined, size: 17),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFFEditUser(
              keyBoardType: TextInputType.text,
              conteudoCampo: "Marília, SP",
              iconeInicio: Icon(Icons.location_on_outlined, size: 17),
            ),
          ],
        ),
      ),
    );
  }

  void refreshPerfilImage(File? newImage) {
    if (newImage != null) {
      setState(() {
        imagePerfil = newImage;
      });
    }
  }

  final picker = ImagePicker();

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
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
                              icon: Icon(
                                Icons.close,
                                size: 30,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.4,
                              child: Text(
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
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
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
                                        Icons.add_photo_alternate_outlined,
                                        size: 25,
                                        color: Color(0xff1565C0),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xffE3F2FD),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 32,
                                    ),
                                    Text(
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
                            _imgFromGallery();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
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
                                        color: Color(0xff1565C0),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xffE3F2FD),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 32,
                                    ),
                                    Text(
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
                            _imgFromCamera();
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

  _imgFromGallery() async {
    try {
      await picker
          .pickImage(source: ImageSource.gallery, imageQuality: 50)
          .then((value) {
        if (value != null) {
          _cropImage(File(value.path));
        }
      });
    } catch (e) {
      print("Erro ao tentar pegar a imagem da galeria: $e");
    }
  }

  _imgFromCamera() async {
    try {
      await picker
          .pickImage(source: ImageSource.camera, imageQuality: 50)
          .then((value) {
        if (value != null) {
          _cropImage(File(value.path));
        }
      });
    } catch (e) {
      print("Erro ao tentar tirar uma foto: $e");
    }
  }

  Future<void> _cropImage(File imgFile) async {
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
