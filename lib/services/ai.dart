import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class AIHandler {
  final _openAI = OpenAI.instance.build(
      token: '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',
      baseOption: HttpSetup(
        receiveTimeout: const Duration(seconds: 10),
      ),
      enableLog: true);

  Future<String> getResponse(String message) async {
    try {
      final request = CompleteText(
        prompt: message,
        model: TextDavinci3Model(),
        maxTokens: 1000,
      );
      final response = await _openAI.onCompletion(request: request);
      if (response != null) {
        return response.choices[0].text.toString();
      }

      return 'No response received from OpenAI';
    } catch (e) {
      return 'An error occurred: $e';
    }
  }
}
