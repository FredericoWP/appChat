import 'package:easy_chat/models/chat_user.dart';
import 'package:easy_chat/services/autenticacao/sv_autenticacao_mock.dart';
import 'package:easy_chat/view/_widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AutAppPage extends StatelessWidget {
  const AutAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<ChatUser?>(
      stream: SvAutenticacaoMock().userChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        } else {}
      },
    ));
  }
}
