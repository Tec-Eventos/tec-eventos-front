import 'dart:io';

import 'package:flutter/material.dart';

class Anexo extends StatelessWidget {
  final File arquivo;
  const Anexo({super.key, required this.arquivo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: Center(
        child: SizedBox(
          width: 200,
          height: 141,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.file(
              arquivo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
