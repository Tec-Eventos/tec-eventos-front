// import 'package:flutter/material.dart';
// import 'package:tec_eventos/pages/paginas_globais/acesso/forgetPasswordProccess/verificacao_codigo.dart';
// import 'package:tec_eventos/pages/paginas_globais/acesso/login.dart';
// import 'package:tec_eventos/cores.dart';
// import 'package:tec_eventos/fontes.dart';

// class EnvioEmail extends StatefulWidget {
//   const EnvioEmail({super.key});

//   @override
//   State<EnvioEmail> createState() => _EnvioEmailState();
// }

// class _EnvioEmailState extends State<EnvioEmail> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Text(
//         "Esqueceu sua senha?",
//         style: TextStyle(
//           fontFamily: Fontes.inter,
//           fontSize: 23,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       const SizedBox(height: 20),
//       Text(
//         "Informe seu e-mail para que possamos lhe enviar um código de confirmação",
//         style: TextStyle(
//           fontFamily: Fontes.inter,
//           fontSize: 16,
//         ),
//       ),
//       const SizedBox(height: 50),
//       Text(
//         'Email',
//         style: TextStyle(
//           fontFamily: Fontes.inter,
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: Container(
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey[300]!,
//                   offset: const Offset(10, 10),
//                   blurRadius: 6,
//                   spreadRadius: -5,
//                 )
//               ]),
//           child: TextFormField(
//             decoration: const InputDecoration(
//               prefixIcon: Icon(Icons.email_outlined),
//               isDense: true,
//               hintText: "Email",
//               hintStyle: TextStyle(color: Color(0xffA69F9F)),
//               border: InputBorder.none,
//               contentPadding:
//                   EdgeInsets.only(top: 18.0, right: 20, bottom: 18.0, left: 40),
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(height: 20),
//       Center(
//         child: SizedBox(
//           width: 282,
//           height: 52,
//           child: OutlinedButton(
//             style: OutlinedButton.styleFrom(
//               backgroundColor: Cores.azul42A5F5,
//             ),
//             onPressed: () {
//               setState(() {
//                 conteudoVerificacao = const VerificacaoCodigo();
//               });
//             },
//             child: Text(
//               "Enviar",
//               style: TextStyle(
//                   fontFamily: Fontes.raleway,
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Cores.branco),
//             ),
//           ),
//         ),
//       ),
//     ]);
//   }
// }
