import 'dart:math';

import 'package:easy_chat/models/chat_user.dart';
import 'dart:io';
import 'dart:async';
import 'sv_autenticacao.dart';

class SvAutenticacaoMock implements SvAutenticacao {
  static Map<String, ChatUser> _user = {};
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _currentUser = null;
    controller.add(_currentUser);
    _updateUser(null);
  });

  @override
  Future<void> cadastrar(
    String nome,
    String email,
    String senha,
    File image,
  ) async {
    final newUser = ChatUser(
      id: Random().nextDouble().toString(),
      nome: nome,
      email: email,
      imageUrl: image.path,
    );

    _user.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  Future<void> login(String email, String senha) async {
    _updateUser(_user[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  @override
  ChatUser? get currentUser {
    return _currentUser;
  }

  @override
  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  static void _updateUser(ChatUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
