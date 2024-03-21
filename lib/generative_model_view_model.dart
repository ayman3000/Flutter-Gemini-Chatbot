import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'generative_model_service.dart';

final chatProvider = StateNotifierProvider<ChatViewModel, List<String>>((ref) {
  return ChatViewModel(ref);
});

class ChatViewModel extends StateNotifier<List<String>> {
  final StateNotifierProviderRef _ref;

  ChatViewModel(this._ref) : super([]);

  void sendMessage(String message) async {
    final response = await _ref.read(generativeChatServiceProvider).sendMessage(message);
    state = [...state, "You: $message", "AI: $response"];
  }
}
