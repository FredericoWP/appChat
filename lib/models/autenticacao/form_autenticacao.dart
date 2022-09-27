import 'dart:io';

enum Modo { cadastrar, login }

class FormAutenticacao {
  String? nome;
  String? email;
  String? senha;
  File? image;
  Modo modo = Modo.cadastrar;

  Modo get modoAtual {
    return modo;
  }

  void alterarModo() {
    modo = modo == Modo.cadastrar ? Modo.login : Modo.cadastrar;
  }
}
