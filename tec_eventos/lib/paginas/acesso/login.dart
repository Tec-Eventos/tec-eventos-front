import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool selectedValue = true;

  @override
  Widget build(BuildContext context) {
    var i = 300;
    var hint = "E-mail";
    return Scaffold(
      body:  Container(
            child: ListView(
              children: [
                SizedBox(height: 10,),

                Image.asset('./assets/t!e_logo.png',
                  alignment: Alignment.bottomCenter,
                  height: 120,
                  width: 120,
                ),

                // Spacer(),
                SizedBox(height: 30,),
                
                const Text('Login',
                  textAlign: TextAlign.center,
                  style: 
                  TextStyle(
                    color: Color(0xff47BBEC),
                    fontSize: 38.0,
                  )
                ),

                TextBox("E-mail"),


                TextBox("Usuário"),

                TextBox("Senha"),

                Padding(
                  padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Radio(
                            value: 1,
                            groupValue: selectedValue, 
                            onChanged: (value) => setState(() => selectedValue = !selectedValue),
                          ),
                         ),
                        Text('Lembrar-se de mim',
                          textAlign: TextAlign.center,
                          style: 
                          TextStyle(
                            color: Color(0xffA69F9F),
                            fontSize: 15.0,
                          )
                        ),
                      ],
                    ),
                ),   

                Text(
                  'Esqueceu sua senha?',
                  textAlign: TextAlign.center,
                  style: 
                    TextStyle(
                            color: Color(0xff45B0F0),
                            fontSize: 15.0,
                    ),
                )

              ],       
            ),
      ),
    );
  }
}


TextBox(String hint){
  return Padding(
      padding: 
        const EdgeInsets.only(top: 30, left:40, right: 40),
        // const EdgeInsets.symmetric(horizontal: 40.0),  
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              offset:const Offset(10, 10),
              blurRadius: 6,
              spreadRadius: -5,
            )
          ]
        ),
        child: TextFormField(
          decoration: InputDecoration(
            isDense: true,
            hintText: hint, 
            hintStyle: 
              TextStyle(
                color: Color(0xffA69F9F),
              ),
            border: InputBorder.none,
            // contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            contentPadding: const EdgeInsets.only(top: 18.0, right: 20, bottom: 18.0, left: 40),
            // focusedBorder: OutlineInputBorder(
            //   borderSide: const BorderSide(width: 1, color: Color(0xffE9E3E3)),
            //   borderRadius: BorderRadius.circular(27),
            // ),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: const BorderSide(width: 1, color: Color(0xffE9E3E3)),
            //   borderRadius: BorderRadius.circular(27),
            // ),
            // Comandos para mudar a cor do botão, antes e durante quando for escrever
          ),                    
        ),
      ),
    );
}
