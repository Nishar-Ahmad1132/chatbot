import 'package:bot_ai/models/model.dart';
import 'package:bot_ai/providers/provider.dart';
import 'package:bot_ai/services/ai.dart';
import 'package:bot_ai/services/voice_handler.dart';
import 'package:bot_ai/widgets/toggal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum InputMode { text, voice }

class TextAndVoiceField extends ConsumerStatefulWidget {
  const TextAndVoiceField({super.key});

  @override
  ConsumerState<TextAndVoiceField> createState() => _TextAndVoiceFieldState();
}

class _TextAndVoiceFieldState extends ConsumerState<TextAndVoiceField> {
  InputMode _inputMode = InputMode.voice;
  final _messageController = TextEditingController();
  bool _isReplying = false;
  // ignore: unused_field
  var _isListening = false;
  final AIHandler _openAI = AIHandler();
  final VoiceHandler voiceHandler = VoiceHandler();

  @override
  void initState() {
    voiceHandler.initSpeech();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            onChanged: (value) {
              value.isNotEmpty
                  ? setInputMode(InputMode.text)
                  : setInputMode(InputMode.voice);
            },
            cursorColor: Colors.red,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.greenAccent),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        ToggalButton(
          isReplying: _isReplying,
          inputMode: _inputMode,
          sendTextMessage: () {
            setReplyingState(true);
            final message = _messageController.text;
            _messageController.clear();
            sendTextMessage(message);
          },
          sendVoiceMessage: () {
            sendVoiceMessage();
          },
        ),
      ],
    );
  }

  void sendTextMessage(String message) async {
    setReplyingState(true);
    addToList(message, true, DateTime.now().toString());
    setInputMode(InputMode.voice);
    // addToList("Typing..", false, 'typing');
    final aiResponse = await _openAI.getResponse(message);
    // removeTyping();
    addToList(aiResponse, false, DateTime.now().toString());
    setReplyingState(false);
  }

  void sendVoiceMessage() async {
    if (!voiceHandler.isEnabled) {
      // print('Not supported');
      return;
    }
    if (voiceHandler.speechToText.isListening) {
      await voiceHandler.stopListening();
      setListeningState(false);
    } else {
      setListeningState(true);
      final result = await voiceHandler.startListening();
      setListeningState(false);
      sendTextMessage(result);
    }
  }

  void setListeningState(bool isListening) {
    setState(() {
      _isListening = isListening;
    });
  }

  void setReplyingState(bool isReplying) {
    setState(() {
      _isReplying = isReplying;
    });
  }

  void removeTyping() {
    final chats = ref.read(chatsProvider.notifier);
    chats.removeTyping();
  }

  void addToList(String message, bool isMe, String id) {
    final chats = ref.read(chatsProvider.notifier);
    chats.add(
      ChatModal(id: DateTime.now().toString(), message: message, isMe: isMe),
    );
  }

  void setInputMode(InputMode inputMode) {
    setState(() {
      _inputMode = inputMode;
    });
  }
}
