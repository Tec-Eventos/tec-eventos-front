import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/fontes.dart';

Future<void> dialogQrCode(
    BuildContext context, TextEditingController controllerQrCode) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          contentPadding: const EdgeInsets.all(10),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Coloque o valor do QRCode:",
                style: TextStyle(
                    fontFamily: Fontes.inter,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 20,
                  )),
            ],
          ),
          content: TextFormField(
            keyboardType: TextInputType.text,
            controller: controllerQrCode,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.qr_code),
              isDense: true,
              labelText: "QrCode",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Container(
                  width: 282,
                  height: 52,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Cores.azul47BBEC,
                        Cores.azul42A5F5,
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Confirmar",
                      style: TextStyle(
                          fontFamily: Fontes.inter,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Cores.branco),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      });
}
