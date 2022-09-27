import 'dart:io';

import 'package:easy_chat/models/autenticacao/form_autenticacao.dart';
import 'package:easy_chat/utils/messages.dart';
import 'package:easy_chat/view/_widgets/user/img_user.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key, required this.onSubmit}) : super(key: key);
  final void Function(FormAutenticacao) onSubmit;

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final formAutentica = FormAutenticacao();
  final formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _senha = TextEditingController();

  void _handleImagePicker(File image) {
    formAutentica.image = image;
  }

  submit() {
    final validaForm = formKey.currentState?.validate() ?? false;

    if (!validaForm) {
      return Messages.erro(context, "Imagem não selecionada");
    }

    if (formAutentica.image == null && formAutentica.modo == Modo.cadastrar) {
      return;
    }

    widget.onSubmit(formAutentica);
  }

  @override
  Widget build(BuildContext context) {
    final bool login = formAutentica.modo == Modo.login;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(90),
          ),
          child: Image.asset(
            "assets/chat.png",
            fit: BoxFit.fill,
          ),
        ),
        Card(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if (!login) UserImage(onImagePick: _handleImagePicker),
                  if (!login)
                    TextFormField(
                      controller: _nome,
                      key: const ValueKey("nome"),
                      onChanged: (value) => formAutentica.nome = value,
                      decoration: const InputDecoration(
                        labelText: "Nome:",
                      ),
                      validator: (value) {
                        String nome = value ?? '';
                        if (nome.trim().length < 3) {
                          return "Informe um nome válido.";
                        }
                        return null;
                      },
                    ),
                  TextFormField(
                    controller: _email,
                    key: const ValueKey("email"),
                    onChanged: (value) => formAutentica.email = value,
                    decoration: const InputDecoration(
                      labelText: "E-mail:",
                    ),
                    validator: (value) {
                      String mail = value ?? '';
                      if (!mail.contains("@") ||
                          !mail.contains(".") ||
                          mail.trim().length < 8) {
                        return "Informe um email válido.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _senha,
                    key: const ValueKey("senha"),
                    onChanged: (value) => formAutentica.senha = value,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Senha:",
                    ),
                    validator: (value) {
                      String senha = value ?? '';
                      if (senha.trim().length < 6) {
                        return "A senha deve conter no minimo 6 caracteres";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton.icon(
                    onPressed: submit,
                    icon: Icon(login ? Icons.login : Icons.add_reaction),
                    label: Text(login ? "Acessar" : "Cadastrar"),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        formAutentica.alterarModo();
                      });
                    },
                    icon: Icon(login ? Icons.add : Icons.person),
                    label: Text(
                      login ? "Criar nova conta" : "Usar uma conta existente",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
