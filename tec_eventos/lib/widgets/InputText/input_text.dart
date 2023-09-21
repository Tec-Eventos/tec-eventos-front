import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tec_eventos/all_pages.dart';
import 'package:tec_eventos/pages/paginas_aluno/perfil/perfil.dart';
import 'package:tec_eventos/widgets/InputText/validations/validations_info.dart';

final controllerEmail = TextEditingController();
final controllerSenha = TextEditingController();
final controllerUser = TextEditingController();

class InputTextEmail extends StatelessWidget {
  const InputTextEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controllerEmail,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined),
        isDense: true,
        labelText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        //   contentPadding: const EdgeInsets.only(
        //       top: 18.0, right: 20, bottom: 18.0, left: 40),
        // ),
      ),
      validator: (email) {
        return emailValid(email);
      },
    );
  }
}

class InputTextPassword extends StatefulWidget {
  const InputTextPassword({super.key});

  @override
  State<InputTextPassword> createState() => _InputTextPasswordState();
}

class _InputTextPasswordState extends State<InputTextPassword> {
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      controller: controllerSenha,
      obscureText: passToggle,
      decoration: InputDecoration(
        isDense: true,
        labelText: "Senha",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        prefixIcon: const Icon(Icons.lock),
        suffix: InkWell(
          onTap: () {
            setState(() {
              passToggle = !passToggle;
            });
          },
          child: Icon(
              passToggle ? Icons.visibility : Icons.visibility_off_outlined),
        ),
      ),
      validator: (senha) {
        return passwordValid(senha, controllerSenha);
      },
    );
  }
}

class InputTextName extends StatelessWidget {
  const InputTextName({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: controllerUser,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person_outline_outlined),
        isDense: true,
        labelText: "Usuário",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

// loginValid() {
//   //acesso do ALUNO
//   //email = bielzinho@gmail.com
//   //user = fgabrielmorais;
//   //senha = 123456

//   //acesso da instituição
//   //email = unicamp@gmail.com
//   //user = unicamp;
//   //senha = 122222

//   if (controllerEmail == "bielzinho@gmail.com" &&
//       controllerSenha == "123456" &&
//       controllerUser == "fgabrielmorais") {
//     print("Success");
//   } else if (controllerEmail == "unicamp@gmail.com" &&
//       controllerSenha == "122222" &&
//       controllerUser == "unicamp") {
//     print("Deu ruim");
//   } else {
//     print("${}");
//   }
// }
