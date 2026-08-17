import 'package:flutter/material.dart';

/// Define a paleta de cores unificada do aplicativo Tec!Eventos.
///
/// Contém as cores primárias, secundárias, tons de cinza, pódio e estados,
/// garantindo consistência visual em todos os componentes da interface.
class Cores {
  Cores._(); // Evita a instanciação da classe de utilitários

  // --- Paleta de Azuis (Principal) ---

  /// Azul claro padrão para destaques suaves.
  static const Color azulClaro = Color(0xff64B5F6);

  /// Azul acinzentado claro usado como fundo de containers de destaque.
  static const Color azulCinzento = Color(0xffBBDEFB);

  /// Azul muito claro e suave para planos de fundo e áreas amplas.
  static const Color azulBebe = Color(0xffE3F2FD);

  /// Azul médio utilizado especificamente para opções de perfil e links navegáveis.
  static const Color azulEscuroPerfilOption = Color(0xff1976D2);

  /// Azul vibrante principal, muito utilizado em botões e barras de navegação secundárias.
  static const Color azul42A5F5 = Color(0xff42A5F5);

  /// Azul intermediário com bom contraste para textos informativos.
  static const Color azul1E88E5 = Color(0xff1E88E5);

  /// Azul para estados ativos e marcações de seleção secundárias.
  static const Color azul45B0F0 = Color(0xff45B0F0);

  /// Azul vibrante primário para gradientes e marcação de logo.
  static const Color azul47BBEC = Color(0xff47BBEC);

  /// Azul escuro oficial para headers e textos de alta ênfase.
  static const Color azul1565C0 = Color(0xff1565C0);

  /// Tom de azul muito suave para fundos com leve contraste.
  static const Color azulC8E6FC = Color(0xffC8E6FC);

  /// Tom azul claro pastel para cards e bordas discretas.
  static const Color azulAFDAFA = Color(0xffAFDAFA);

  // --- Tons de Branco ---

  /// Branco puro padrão.
  static const Color branco = Color(0xffFFFFFF);

  /// Branco ligeiramente acinzentado para fundos secundários.
  static const Color brancoCinzento = Color(0xffEEEEEE);

  // --- Tons de Preto ---

  /// Preto puro padrão para contraste de texto máximo.
  static const Color preto = Color(0xff000000);

  // --- Tons de Cinza ---

  /// Cinza médio neutro usado em bordas e ícones inativos.
  static const Color cinza = Color(0xffB8B3AF);

  /// Cinza escuro para texto secundário de alta legibilidade.
  static const Color cinzaMaisEscuro = Color(0xff4D4A4A);

  /// Cinza bem claro para divisores de seções e linhas de contorno.
  static const Color cinzaMaisClaro = Color(0xffD1CFCF);

  /// Cinza médio para textos de suporte e descrições.
  static const Color cinza6A6666 = Color(0xff6A6666);

  /// Cinza azulado para componentes desabilitados ou placeholders.
  static const Color cinzaACB0B6 = Color(0xffACB0B6);

  /// Cinza claro neutro para backgrounds alternados.
  static const Color cinzaD8D7D7 = Color(0xffD8D7D7);

  /// Cinza suave para bordas de campos de entrada secundários.
  static const Color cinza8A8A8A = Color(0xff8A8A8A);

  // --- Cores Especiais de Pódio ---

  /// Cor bronze para indicações de terceiro lugar no ranking.
  static const Color bronze = Color(0xffCD7F32);

  /// Cor amarela/ouro para destaques do topo do ranking (primeiro lugar).
  static const Color amarelo = Color(0xffFFE533);

  // --- Cores de Feedback de Status ---

  /// Verde escuro para estados de sucesso e confirmação.
  static const Color verde = Color(0xff137B02);

  /// Verde claro vibrante para crachás e badges positivos.
  static const Color verdeClaro = Color(0xff64d05b);

  /// Vermelho vivo para alertas, erros e ações de cancelamento.
  static const Color vermelho = Color(0xffE50F0F);
}
