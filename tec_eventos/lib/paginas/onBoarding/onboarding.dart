import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/cores.dart';
import 'package:tec_eventos/paginas/pag_principal/principal_page.dart';
import 'package:tec_eventos/paginas/acesso/login.dart';
import 'package:tec_eventos/paginas/perfil/perfil.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController _pageController;

  int _pageIndex = 0;
  bool isLastPage = false;


  //controle das páginas
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  //começo da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(

              children: [

                //função para a transição de uma etapa da página para a outra
                Expanded(


                    child: PageView.builder(
                      itemCount: demo_data.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _pageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) => TelaBoarding(
                          demo_data[index].image,
                          demo_data[index].titulo,
                          demo_data[index].descricao,
                          context)),
                ),




                //se a função estiver na terceira etapa, aparece o botão de começar
               Padding(padding: const EdgeInsets.all(25.0),
               child:

               _pageIndex == 3
                   ? Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [

                   //botão de começar
                   ElevatedButton(

                     onPressed: () {
                       Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(
                               builder: (context) => PrincipalPage()));
                     },
                     child: Text('COMEÇAR',
                       style: GoogleFonts.inter(
                         fontSize: 24,
                       ),
                     ),
                     style: ElevatedButton.styleFrom(
                       padding: EdgeInsets.only(right: 35, left: 35, top: 10, bottom: 10),
                       shape: RoundedRectangleBorder(

                           borderRadius:
                           BorderRadius.all(Radius.circular(15.0))),
                     ),
                   )
                 ],
               )

               //parte inferior do onBoarding mostrando em que parte o usuário está
                   : Row(

                 children: [

                   //as bolinhas para indicar a etapa, lista gerada para passar a informação para a classe DotIndicator
                   ...List.generate(
                       demo_data.length,
                           (index) => Padding(
                         padding: EdgeInsets.only(right: 4),
                         child: DotIndicator(
                           isActive: index == _pageIndex,
                         ),
                       )),

                   //espaçamento
                   const Spacer(),


                   //botão de passar para a próxima página
                   ElevatedButton(
                     onPressed: () {
                       _pageController.nextPage(
                           duration: Duration(milliseconds: 300),
                           curve: Curves.ease);
                     },
                     child: Icon(Icons.arrow_forward_ios,
                         color: Colors.white),
                     style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                           borderRadius:
                           BorderRadius.all(Radius.circular(15.0))),
                     ),
                   ),
                 ],
               ),
               ),
              ],
            ),
    );
  }
}


//guardando as imagens e explicação em uma classe
class Onboard {
  final String image, titulo, descricao;

  Onboard({required this.image, required this.titulo, required this.descricao});
}


//coisas que devem aparecer em cada etapa
final List<Onboard> demo_data = [
  //tutorial 1
  Onboard(
    image: './assets/t!e_logo.png',
    titulo: 'OnBoarding1',
    descricao:
        'Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum',
  ),

  //tutorial 2
  Onboard(
    image: './assets/t!e_logo.png',
    titulo: 'OnBoarding2',
    descricao:
        'Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum',
  ),

  //tutorial 3
  Onboard(
    image: './assets/t!e_logo.png',
    titulo: 'OnBoarding3',
    descricao:
        'Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum',
  ),

  //tutorial 4
  Onboard(
    image: './assets/t!e_logo.png',
    titulo: 'OnBoarding4',
    descricao:
    'Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum',
  )
];


//classe para as informações de cada tutorial
TelaBoarding(String image, String titulo, String descricao, context) {
  return
    Center(
      child:
        ListView(
           scrollDirection: Axis.vertical,

                      children: [
                        //imagem
                        Image.asset(image, height: MediaQuery.of(context).size.height / 2.5),
                        //título
                        Text(
                          titulo,
                          style: GoogleFonts.cabin(fontSize: 35),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height / 11.5,),

                        //descricao
                        Text(
                          descricao,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),

      );

}



//Indicador de qual etapa o usuário está
class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
        height: isActive
          ? 24
          : 5,
      width: isActive
          ? 6
          : 15,
      decoration: BoxDecoration(
        color: isActive ? Cores.AzulClaro : Cores.AzulCinzento,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
