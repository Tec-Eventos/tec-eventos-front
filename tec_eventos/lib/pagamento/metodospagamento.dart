import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/pagamento/containersPagamentos.dart';
import 'package:tec_eventos/pagamento/filtroPagamentos.dart';

class MetodosPagamento extends StatefulWidget {
  const MetodosPagamento({super.key});

  @override
  State<MetodosPagamento> createState() => _MetodosPagamentoState();
}

final _iconCategory = <IconData>[
  Icons.credit_card,
  Icons.credit_score_outlined,
  Icons.payments_outlined,
];

enum Filtro {
  filtro1,
  filtro2,
  filtro3,
}

final List metodos = [
  'Crédito',
  'Débito',
  'Pix',
];

final List<Widget> paginas = [
  CardsGeral(),
  CardsGeral(),
  SearchBarPix(),
];

Filtro filtroSelecionado = Filtro.filtro1;

class _MetodosPagamentoState extends State<MetodosPagamento> {
  int paginaAtual = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 27,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Métodos de Pagamento",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            child: ListView.builder(
              itemCount: metodos.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FiltroPagamento(
                  nomeMetodo: metodos[index],
                  icontype: Icon(
                    _iconCategory[index],
                    color: filtroSelecionado == Filtro.values[index]
                        ? Color(0xff1565C0)
                        : Colors.black,
                  ),
                  isSelected: filtroSelecionado == Filtro.values[index],
                  onFilterSelected: () {
                    setState(() {
                      filtroSelecionado = Filtro.values[index];
                      paginaAtual = index;
                      pageController.jumpToPage(index);
                    });
                  },
                );
              },
            ),
          ),
          Expanded(
              child: PageView.builder(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                paginaAtual = index;
              });
            },
            itemBuilder: (context, index) {
              return paginas[index];
            },
          ))
        ],
      ),
    );
  }
}
