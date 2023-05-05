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

                SizedBox(height: 30,),

                Padding(
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
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
                        // focusedBorder: OutlineInputBorder(
                        //   borderSide: const BorderSide(width: 1, color: Color(0xffE9E3E3)),
                        //   borderRadius: BorderRadius.circular(27),
                        // ),
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide: const BorderSide(width: 1, color: Color(0xffE9E3E3)),
                        //   borderRadius: BorderRadius.circular(27),
                        // ),
                      ),                    
                    ),
                  ),
                ),

                
              ],       
            ),

      ),
    );
  }
}