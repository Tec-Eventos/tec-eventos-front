import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tec_eventos/fontes.dart';
import 'package:tec_eventos/widgets/Appbar/AppBarPostarEventos/appbarpages_eventos.dart';

class MultipleImagesEvent extends StatefulWidget {
  const MultipleImagesEvent({super.key});

  @override
  State<MultipleImagesEvent> createState() => _MultipleImagesEventState();
}

class _MultipleImagesEventState extends State<MultipleImagesEvent> {
  List<File> _images = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Imagens do local",
              style: TextStyle(
                  fontFamily: Fontes.raleway,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () async {
                  sendImages();
                },
                child: const Text('Selecione mais imagens'))
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _images
                  .map(
                    (imagem) => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.file(
                        imagem,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  .toList()),
        ),
      ],
    );
  }

  Future<void> sendImages() async {
    final files = await imageHelper.pickImage(multiple: true);
    setState(() => _images = files.map((e) => File(e.path)).toList());
  }
}
