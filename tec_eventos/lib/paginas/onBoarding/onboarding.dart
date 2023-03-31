import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/cores.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
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
                        demo_data[index].descricao)),
              ),

              _pageIndex == 3
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        ElevatedButton(

                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Perfil()));
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
                  : Row(
                      children: [
                        ...List.generate(
                            demo_data.length,
                            (index) => Padding(
                                  padding: EdgeInsets.only(right: 4),
                                  child: DotIndicator(
                                    isActive: index == _pageIndex,
                                  ),
                                )),
                        const Spacer(),
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
            ],
          ),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, titulo, descricao;

  Onboard({required this.image, required this.titulo, required this.descricao});
}

final List<Onboard> demo_data = [
  Onboard(
    image: './assets/t!e_logo.png',
    titulo: 'OnBoarding1',
    descricao:
        'Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum',
  ),
  Onboard(
    image: './assets/t!e_logo.png',
    titulo: 'OnBoarding2',
    descricao:
        'Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum',
  ),
  Onboard(
    image: './assets/t!e_logo.png',
    titulo: 'OnBoarding3',
    descricao:
        'Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum',
  ),

  Onboard(
    image: './assets/t!e_logo.png',
    titulo: 'OnBoarding4',
    descricao:
    'Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum',
  )
];

TelaBoarding(String image, String titulo, String descricao) {
  return Center(
    child: Column(children: [
      const Spacer(),
      Image.asset(image),
      const Spacer(),
      Text(
        titulo,
        style: GoogleFonts.inter(
          fontSize: 35,
        ),
        textAlign: TextAlign.center,
      ),
      const Spacer(),
      Text(
        descricao,
        textAlign: TextAlign.center,
        style: GoogleFonts.raleway(
          fontSize: 20.0,
        ),
      ),
      const Spacer(),
    ]),
  );
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: isActive
          ? MediaQuery.of(context).size.height / 30
          : MediaQuery.of(context).size.height / 110,
      width: isActive
          ? MediaQuery.of(context).size.width / 60
          : MediaQuery.of(context).size.width / 40,
      decoration: BoxDecoration(
        color: isActive ? Cores.AzulClaro : Cores.AzulCinzento,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
