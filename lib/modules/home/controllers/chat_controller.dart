import 'package:intl/intl.dart';
import '../../../constants/app_imports.dart';
import '../../../models/chat_model.dart';

class ChatController extends GetxController {
  final _api = HomeRepository();

  final messageController = TextEditingController();
  final scrollController = ScrollController();

  var messages = <ChatModel>[].obs;
  var sendingMessage = false.obs;
  var loadingChats = false.obs;

  // ================= SEND MESSAGE =================
  Future<void> sendMessage() async {
    final text = messageController.text.trim();

    if (text.isEmpty || sendingMessage.value) return;

    final now = DateTime.now();

    messages.insert(0,
      ChatModel(
        id: null,
        userId: int.tryParse(PrefManager.getUserId() ?? "0"),
        query: text,
        answer: "",
        sources: [],
        confidence: null,
        hasContext: null,
        createdAt: now,
      ),
    );

    messageController.clear();

    try {
      sendingMessage(true);

      final response = await _api.sendMessageApi(
        body: {
          "query": text,
          "top_k": 3,
          "min_score": 0.0,
          "user_id": PrefManager.getUserId(),
        },
      );

      if (response != null) {
        messages[0] = ChatModel(
          id: response.id,
          userId: response.userId,
          query: response.query,
          answer: response.answer,
          sources: response.sources,
          confidence: response.confidence,
          hasContext: response.hasContext,
          createdAt: response.createdAt,
        );
      } else {
        messages[0] = messages[0].copyWith(
          answer: "No response from server",
        );
      }
    } catch (e) {
      messages[0] = messages[0].copyWith(
        answer: "Something went wrong. Please try again.",
      );
    } finally {
      sendingMessage(false);
    }
  }

  // ================= FETCH HISTORY =================
  Future<void> fetchChatHistory() async {
    try {
      loadingChats(true);

      final response = await _api.getAllChatsApi(
        params: {"user_id": PrefManager.getUserId()},
      );

      if (response.isNotEmpty) {
        messages.value = response.map((chat) {
          return ChatModel(
            id: chat.id,
            userId: chat.userId,
            query: chat.query,
            answer: chat.answer,
            sources: chat.sources,
            confidence: chat.confidence,
            hasContext: chat.hasContext,
            createdAt: chat.createdAt,
          );
        }).toList();
      } else {
        messages.clear();
      }
    } catch (e) {
      print("CHAT_HISTORY_ERROR: $e");
    } finally {
      loadingChats(false);
    }
  }

  // ================= SCROLL =================
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!scrollController.hasClients) return;

      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  // ================= CLEANUP =================
  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}