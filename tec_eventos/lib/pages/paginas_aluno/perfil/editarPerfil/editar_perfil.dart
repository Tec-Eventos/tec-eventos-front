import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/function/adicionarImagem/editimagens.dart';
import 'package:tec_eventos/function/adicionarImagem/img_gallery.dart';
import 'package:tec_eventos/pages/paginas_aluno/perfil/editarPerfil/componentsPerfil/textFormFieldEditUser.dart';
import 'package:tec_eventos/widgets/Appbar/AppBarEditarPerfil/appbar_editar_perfil.dart';

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
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          //appbar, ou seja, parte superior
          const AppBarEditarPerfil(),
        ],
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
                                margin: const EdgeInsets.only(top: 13),
                                child: SizedBox(
                                  height: 130,
                                  width: 130,
                                  child: imagePerfil == null
                                      ? Image.asset('assets/userperfil.png')
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
                                    child: EditImagens(
                                      imagePerfil: imagePerfil,
                                    )),
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
              Column(
                children: [
                  Text(
                    "Gabriel Felix",
                    style: TextStyle(
                      fontFamily: Fontes.raleway,
                      color: Cores.preto,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "Desempregado",
                    style: TextStyle(
                      fontFamily: Fontes.raleway,
                      color: Cores.preto,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              const TextFFEditUser(
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
                iconeInicio: const Icon(Icons.call_outlined, size: 17),
                keyBoardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(
                height: 20,
              ),
              const TextFFEditUser(
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
                iconeInicio: const Icon(Icons.qr_code_2, size: 17),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(
                height: 20,
              ),
              const TextFFEditUser(
                keyBoardType: TextInputType.text,
                conteudoCampo: "Etec Antonio Devisate",
                iconeInicio: Icon(Icons.school_outlined, size: 17),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextFFEditUser(
                keyBoardType: TextInputType.text,
                conteudoCampo: "Marília, SP",
                iconeInicio: Icon(Icons.location_on_outlined, size: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
