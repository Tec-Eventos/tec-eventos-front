import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tec_eventos/pagamento/cardsteceventos.dart';
import 'package:tec_eventos/pagamento/precos.dart';

class CardsGeral extends StatelessWidget{


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width/1.10,
                  decoration: BoxDecoration(
                    color: Color(0xffE9E9E9),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child:  ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CardsComponent()),);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 72,),
                        Text("Adicionar cartão",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 16),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 33),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      primary: Color(0xffE9E9E9),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 26,),

              Container(
                decoration: BoxDecoration(
                color: Color(0xffE9E9E9),
                borderRadius: BorderRadius.circular(18.0),
              ),
                width: MediaQuery.of(context).size.width/1.10,
                  child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 29),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              primary: Color(0xffE9E9E9),
                            ),
                            onPressed: (){},
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("MasterCard", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.black),),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Image.asset('assets/bancos_pagamento/logoMasterCard.png'),
                                    ),
                                    Text('21091', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.black),),
                                    Icon(Icons.check_circle_outline, color: Color(0xff1565C0),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ),

              SizedBox(height: 26,),

              Container(
                decoration: BoxDecoration(
                  color: Color(0xffE9E9E9),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                width: MediaQuery.of(context).size.width/1.10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 29),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    primary: Color(0xffE9E9E9),
                  ),
                  onPressed: (){},
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("NuBank", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.black),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Image.asset('assets/bancos_pagamento/logoNuBank.png'),
                          ),
                          Text('21092', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.black),),
                          Icon(Icons.check_circle_outline, color: Color(0xff1565C0),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 75,
              ),

              PrecosComponent(),
    ],
          ),
        ),
        );
  }
}

class SearchBarPix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25,),
          Container(
            width: MediaQuery.of(context).size.width/1.10,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Insira o pix aqui",
                  hintStyle: TextStyle(
                    color: Color(0xff837D7D),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )
                ),
              ),
            ),
          ),
          SizedBox(height: 35,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/1.10,
                child: Text("Pagamentos Recentes",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
              ),
            ],
          ),
          SizedBox(height: 17,),

          //Colocar os dados dos últimos pix feitos aqui

          Container(
            height: 300,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.only(bottom: 21),
                    margin: EdgeInsets.symmetric(horizontal: 19),
                    child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/UnivemIMG.png'),
                            Text("R\$120,00",style: TextStyle(fontSize: 12, fontStyle: FontStyle.normal),),
                          ],
                      ),
                  );
              },),
          ),
          SizedBox(height: 75,),
          //////////////////////////////////////////////
          PrecosComponent(),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}


class ContainerTres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: Text('AINDA PENSANDO NO QUE COLOCAR AQUI',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
      ),
    );
  }
}