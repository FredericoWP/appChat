import 'package:easy_chat/models/autenticacao/form_autenticacao.dart';
import 'package:easy_chat/view/_widgets/loading.dart';
import 'package:easy_chat/view/_widgets/login/form_login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  Future<void> _handleSubmit(FormAutenticacao from) async {
    try {
      setState(() => isLoading = true);

      if (from.modo == Modo.login) {
        //login
      } else {
        //cadastrar
      }
    } on Exception catch (e) {
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: FormLogin(onSubmit: _handleSubmit),
            ),
          ),
          if (isLoading) const LoadingPage()
        ],
      ),
    );
  }
}
