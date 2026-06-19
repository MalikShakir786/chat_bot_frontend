import 'package:chat_bot_frontend/modules/home/widgets/agent_reply_message_box.dart';
import 'package:chat_bot_frontend/modules/home/widgets/user_reply_message_box.dart';
import 'package:chat_bot_frontend/models/chat_model.dart';

import '../../../constants/app_imports.dart';
import '../controllers/home_controller.dart';
import '../widgets/typing_loader.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  final homeCon = Get.find<HomeController>();

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
              bottom: 80.h
          ),
          child: Column(
            children: [
              CustomAppBar(title: 'Chat',),
              SizedBox(height: 10.h,),
              Expanded(
                child: Obx(() {
                  final messages = homeCon.messages;

                  if (messages.isEmpty) {
                    return ListView(
                      controller: homeCon.scrollController,
                      children: [
                        AgentReplyMessageBox(
                          text: "Hello! I'm InnovaChat\nAsk me anything about your documents.",
                          time: '',
                        ),
                      ],
                    );
                  }

                  return ListView.builder(
                    controller: homeCon.scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];

                      if (message.isLoading) {
                        return const TypingLoaderBox();
                      }

                      if (message.sender == ChatMessageSender.user) {
                        return UserReplyMessageBox(
                          text: message.text,
                          time: message.time,
                        );
                      }

                      return AgentReplyMessageBox(
                        text: message.text,
                        time: message.time,
                      );
                    },
                  );
                }),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: homeCon.messageController,
                      hint: 'Type your message...',
                      onSubmit: (_) => homeCon.sendMessage(),
                    ),
                  ),
                  SizedBox(width: 8.w,),
                  Obx(() => CustomIconButton(
                    iconPath: AppAssets.send,
                    size: 22,
                    iconColor: Colors.white,
                    bgColor: AppColors.primary,
                    onTap: homeCon.sendingMessage.value
                        ? null
                        : homeCon.sendMessage,
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}