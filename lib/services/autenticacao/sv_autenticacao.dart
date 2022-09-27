import 'dart:io';

import 'package:easy_chat/models/chat_user.dart';

abstract class SvAutenticacao {
  ChatUser? get currentUser;
  Stream<ChatUser?> get userChanges;

  Future<void> cadastrar(String nome, String emaul, String senha, File image);
  Future<void> login(String email, String senha);
  Future<void> logout();
}
