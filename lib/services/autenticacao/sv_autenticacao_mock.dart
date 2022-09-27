import 'package:easy_chat/models/chat_user.dart';
import 'dart:io';
import 'sv_autenticacao.dart';

class SvAutenticacaoMock implements SvAutenticacao {
  @override
  Future<void> cadastrar(
      String nome, String emaul, String senha, File image) async {
    throw UnimplementedError();
  }

  @override
  Future<void> login(String email, String senha) async {}

  @override
  Future<void> logout() async {}

  @override
  ChatUser? get currentUser {
    return null;
  }

  @override
  Stream<ChatUser?> get userChanges => throw UnimplementedError();
}
