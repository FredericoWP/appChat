import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatUser {
  final String id;
  final String nome;
  final String email;
  final String imageUrl;

  const ChatUser({
    required this.id,
    required this.nome,
    required this.email,
    required this.imageUrl,
  });

  ChatUser copyWith({
    String? id,
    String? nome,
    String? email,
    String? imageUrl,
  }) {
    return ChatUser(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'email': email,
      'imageUrl': imageUrl,
    };
  }

  factory ChatUser.fromMap(Map<String, dynamic> map) {
    return ChatUser(
      id: map['id'] as String,
      nome: map['nome'] as String,
      email: map['email'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatUser.fromJson(String source) =>
      ChatUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatUser(id: $id, nome: $nome, email: $email, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant ChatUser other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.email == email &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nome.hashCode ^ email.hashCode ^ imageUrl.hashCode;
  }
}
