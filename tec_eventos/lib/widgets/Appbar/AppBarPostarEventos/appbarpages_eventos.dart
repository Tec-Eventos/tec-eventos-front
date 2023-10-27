import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/function/images_select/image_helper.dart';


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
                fit: BoxFit.fill,
                child: Image.file(_image!),
              )
            : Container(),
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
      title: TextButton(
        onPressed: () async {
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
        },
        child: const Text("Selecionar foto"),
      ),
    );
  }
}