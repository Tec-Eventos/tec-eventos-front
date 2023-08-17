import 'package:flutter/material.dart';

class FiltroPagamento extends StatelessWidget {

  final String nomeMetodo;
  final Icon icontype;
  final bool isSelected;
  final VoidCallback onFilterSelected;

  const FiltroPagamento({ required this.icontype, required this.isSelected, required this.onFilterSelected, required this.nomeMetodo});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
      child: Container(
        margin: EdgeInsets.only(left: 10),
        height: 94,
        width: 94,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
           child:
           ElevatedButton(
             style: ElevatedButton.styleFrom(
               elevation: 0,
               primary: isSelected ? Color(0xffE3F2FD) : Color(0xffE9E9E9),
               shape: CircleBorder(),
             ),
             onPressed: onFilterSelected,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(icontype.icon,
                 size: 40,
                   color: isSelected ? Color(0xff1565C0) : Colors.black,),

                 SizedBox(height: 4,),

                 Text(nomeMetodo,style: TextStyle(
                 color: isSelected ? Color(0xff1565C0) : Colors.black,
                   fontWeight: FontWeight.bold,
                   fontSize: 14,
                 ),)
               ],
             )
           ),
           ),
    );
  }
}

class VoidCallBack {
}
