import 'package:flutter/material.dart';

@immutable
class ChatModal {
  final String id;
  final String message;
  final bool isMe;

  const ChatModal(
      {required this.id, required this.message, required this.isMe});
}
