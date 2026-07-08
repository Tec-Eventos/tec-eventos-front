import 'package:flutter/material.dart';
import 'package:tec_eventos/pages/paginas_aluno/pagamento/componentsPagamentos/containersPagamentos.dart';
import 'package:tec_eventos/pages/paginas_aluno/pagamento/componentsPagamentos/filtroPagamentos.dart';

/// Tela principal dos Métodos de Pagamento do Aluno.
class MetodosPagamento extends StatefulWidget {
  const MetodosPagamento({Key? key}) : super(key: key);

  @override
  State<MetodosPagamento> createState() => _MetodosPagamentoState();
}

enum Filtro { filtro1, filtro2, filtro3, filtro4 }

class _MetodosPagamentoState extends State<MetodosPagamento> {
  int _paginaAtual = 0;
  final PageController _pageController = PageController();
  Filtro _filtroSelecionado = Filtro.filtro1;

  final List<IconData> _iconCategory = <IconData>[
    Icons.credit_card,
    Icons.credit_score_outlined,
    Icons.payments_outlined,
    Icons.dynamic_feed_rounded,
  ];

  final List<String> _metodos = [
    'Crédito',
    'Débito',
    'Pix',
    'Outro',
  ];

  final List<Widget> _paginas = [
    const CardsGeral(),
    const CardsGeral(),
    const SearchBarPix(),
    const ContainerTres(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 27,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Métodos de Pagamento",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: _metodos.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FiltroPagamento(
                  nomeMetodo: _metodos[index],
                  icontype: Icon(
                    _iconCategory[index],
                    color: _filtroSelecionado == Filtro.values[index]
                        ? const Color(0xff1565C0)
                        : Colors.black,
                  ),
                  isSelected: _filtroSelecionado == Filtro.values[index],
                  onFilterSelected: () {
                    setState(() {
                      _filtroSelecionado = Filtro.values[index];
                      _paginaAtual = index;
                      _pageController.jumpToPage(index);
                    });
                  },
                );
              },
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _paginaAtual = index;
                });
              },
              itemCount: _paginas.length,
              itemBuilder: (context, index) {
                return _paginas[index];
              },
            ),
          )
        ],
      ),
    );
  }
}
