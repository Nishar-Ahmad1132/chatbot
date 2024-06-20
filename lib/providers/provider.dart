import 'package:bot_ai/models/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNotifier extends StateNotifier<List<ChatModal>> {
  ChatNotifier() : super([]);
  void add(ChatModal chatModal) {
    state = [...state, chatModal];
  }

  void removeTyping() {
    state = state..removeWhere((chat) => chat.id == 'typing');
  }

  void removeWhere(bool Function(dynamic chat) param0) {}
}

final chatsProvider = StateNotifierProvider<ChatNotifier, List<ChatModal>>(
  (ref) => ChatNotifier(),
);
