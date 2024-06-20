import 'package:bot_ai/providers/provider.dart';
import 'package:bot_ai/widgets/chat_items.dart';
import 'package:bot_ai/widgets/drawer.dart';
import 'package:bot_ai/widgets/text_and_voice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final ThemeData _lightTheme = ThemeData.light();
  final ThemeData _darkTheme = ThemeData.dark();

  bool _isDarkMode = true;


  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {

    final ThemeData themeData = _isDarkMode ? _darkTheme : _lightTheme;
    final Color appBarBackgroundColor = _isDarkMode
        ? themeData.appBarTheme.backgroundColor ??
            Colors.grey.shade700 // Use green as a fallback
        : Colors.green;

    return Theme(
      data: themeData,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarBackgroundColor,
          // automaticallyImplyLeading: false,
          title: const Text("Grievance Report"),
          actions: [
            IconButton(
              icon: _isDarkMode
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
              onPressed: _toggleTheme,
            ),
          ],
          toolbarHeight: 56.0,
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: Consumer(builder: (context, ref, chuld) {
                final chats = ref.watch(chatsProvider);
                return ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) => ChatItem(
                    text: chats[index].message,
                    isMe: chats[index].isMe,
                  ),
                );
              }),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: TextAndVoiceField(),
            ),
          ],
        ),
      ),
    );
  }
}
