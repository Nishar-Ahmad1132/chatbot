import 'package:bot_ai/widgets/text_and_voice.dart';
import 'package:flutter/material.dart';

class ToggalButton extends StatefulWidget {
  final VoidCallback _sendTextMessage;
  final VoidCallback _sendVoiceMessage;
  final InputMode _inputMode;
    final bool _isReplying;
  const ToggalButton(
      {super.key,
      required InputMode inputMode,
      required VoidCallback sendTextMessage,
      required VoidCallback sendVoiceMessage,
      required bool isReplying})
      : _inputMode = inputMode,
        _sendTextMessage = sendTextMessage,
        _sendVoiceMessage = sendVoiceMessage,
        _isReplying = isReplying;

  @override
  State<ToggalButton> createState() => _ToggalButtonState();
}

class _ToggalButtonState extends State<ToggalButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.grey.shade800,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
      ),
      onPressed: widget._isReplying ? null : widget._inputMode == InputMode.text
          ? widget._sendTextMessage
          : widget._sendVoiceMessage,
      child: Icon(widget._inputMode == InputMode.text ? Icons.send : Icons.mic),
    );
  }
}
