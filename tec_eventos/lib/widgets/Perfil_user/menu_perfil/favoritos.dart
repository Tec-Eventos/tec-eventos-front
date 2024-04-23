import 'package:flutter/material.dart';

//Eventos favoritos do usuário
class Favoritos extends StatefulWidget {
  const Favoritos({Key? key, required this.imgEvento, required this.imgOrg})
      : super(key: key);

  final String imgEvento, imgOrg;

  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, top: 25, bottom: 25),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Image.asset(
          widget.imgEvento,
          height: 93,
          width: 93,
          fit: BoxFit.fill,
        ),
        Container(
          width: 93,
          height: 30,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 8,
                // Shadow position
              ),
            ],
          ),
          child: Image.asset(
            widget.imgOrg,
            height: 16,
            width: 46,
            alignment: Alignment.center,
          ),
        ),
      ]),
    );
  }
}
