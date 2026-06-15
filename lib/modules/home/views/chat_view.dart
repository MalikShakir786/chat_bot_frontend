import 'package:chat_bot_frontend/modules/home/widgets/agent_reply_message_box.dart';
import 'package:chat_bot_frontend/modules/home/widgets/user_reply_message_box.dart';

import '../../../constants/app_imports.dart';
import '../controllers/home_controller.dart';

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
                child: Column(
                  children: [
                    AgentReplyMessageBox(text: "Hello! I'm InnovaChat\nAsk me anything about your documents.", time: '10:20 AM'),
                    UserReplyMessageBox(text: "What are the key findings from the research paper?", time: '10:20 AM'),
                    AgentReplyMessageBox(text: "Based on the document Al_Research_Paper.pdf, the key findings are...", time: '10:20 AM'),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hint: 'Type your message...',
                    ),
                  ),
                  SizedBox(width: 8.w,),
                  CustomIconButton(iconPath: AppAssets.send, size: 22,iconColor: Colors.white, bgColor: AppColors.primary,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
