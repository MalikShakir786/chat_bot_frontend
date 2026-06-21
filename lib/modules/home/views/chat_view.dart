import 'package:chat_bot_frontend/modules/home/controllers/chat_controller.dart';
import 'package:chat_bot_frontend/modules/home/widgets/agent_reply_message_box.dart';
import 'package:chat_bot_frontend/modules/home/widgets/user_reply_message_box.dart';

import '../../../constants/app_imports.dart';
import '../widgets/typing_loader.dart';

class ChatView extends StatefulWidget {
  ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final chatCon = Get.find<ChatController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      chatCon.fetchChatHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 16.h,
            bottom: 80.h,
          ),
          child: Column(
            children: [
              CustomAppBar(title: 'Chat'),
              SizedBox(height: 10.h),
              Expanded(
                child: Obx(() {
                  final messages = chatCon.messages;

                  if (messages.isEmpty) {
                    return ListView(
                      controller: chatCon.scrollController,
                      children: [
                        Obx(() {
                          return AgentReplyMessageBox(
                            text:
                            "Hello ${PrefManager.userData.value?.name ??
                                ''}! I'm InnovaChat\nAsk me anything about your documents.",
                            time: '',
                          );
                        }),
                      ],
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async {
                      chatCon.fetchChatHistory();
                    },
                    child: ListView.builder(
                      controller: chatCon.scrollController,
                      itemCount: messages.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        final isFirst = index == 0;

                        return Column(
                            children: [
                              UserReplyMessageBox(
                                text: message.query ?? '',
                                time: message.createdAt?.timeAgoOrDate ?? '',
                              ),

                              if (chatCon.sendingMessage.value &&
                                  isFirst &&
                                  (message.answer == null ||
                                      message.answer!.isEmpty))
                                TypingLoaderBox()
                              else
                                if (message.answer != null &&
                                    message.answer!.isNotEmpty)
                                  AgentReplyMessageBox(
                                    text: message.answer ?? '',
                                    time: message.createdAt?.timeAgoOrDate ??
                                        '',
                                  ),
                            ],
                          );
                      },
                    ),
                  );
                }),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: chatCon.messageController,
                      hint: 'Type your message...',
                      onSubmit: (_) => chatCon.sendMessage(),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Obx(
                        () =>
                        CustomIconButton(
                          iconPath: AppAssets.send,
                          size: 22,
                          iconColor: Colors.white,
                          bgColor: AppColors.primary,
                          onTap: chatCon.sendingMessage.value
                              ? null
                              : chatCon.sendMessage,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
