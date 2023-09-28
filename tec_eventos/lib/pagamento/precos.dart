import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class PrecosComponent extends StatelessWidget {
  const PrecosComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.10,
      child:
      ElevatedButton(
        onPressed: (){
          AwesomeDialog(
            padding: EdgeInsets.all(20),
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.topSlide,
            title: "Pagamento \nEfetuado",
            btnCancelText: "Fechar",
            titleTextStyle: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            btnCancelColor: Color(0xff1565C0),
            btnCancelOnPress: (){},
          ).show();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pagar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)),

              Text("R\$ 250,00",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 20),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          primary: Color(0xff1565C0),
        ),
      ),
    );
  }
}
