import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/utils/image_helper.dart';

final imageHelper = ImageHelper();

class EventsImage extends StatefulWidget {
  const EventsImage({
    super.key,
  });

  @override
  State<EventsImage> createState() => _EventsImageState();
}

class _EventsImageState extends State<EventsImage> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    double displayHeight = MediaQuery.of(context).size.height;
    return SliverAppBar(
        expandedHeight: displayHeight / 3,
        flexibleSpace: FlexibleSpaceBar(
          background: _image != null
              ? FittedBox(
                  fit: BoxFit.cover,
                  child: Image.file(_image!),
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
          _image != null
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

  Future<void> sendImagePrincipal() async {
    final files = await imageHelper.pickImage();
    if (files.isNotEmpty) {
      final croppedFile = await imageHelper.crop(
        file: files.first,
        cropStyle: CropStyle.rectangle,
      );

      FocusScopeNode currentFocus = FocusScope.of(context);
      currentFocus.unfocus();

      if (croppedFile != null) {
        setState(() => _image = File(croppedFile.path));
      }
    }
  }
}
