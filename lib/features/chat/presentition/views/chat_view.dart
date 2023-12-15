import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/utils/assets.dart';
import 'package:chat_app/core/widgets/custom_background.dart';
import 'package:chat_app/features/chat/data/chat_model.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ChatView extends StatefulWidget {
  static String id = 'ChatView';
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _controller = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromjson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.primaryColor,
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: AssetImage(AssetConstants.logoWhite),
                        height: 40),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Chat',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              body: Stack(
                children: [
                  customBackground(AssetConstants.chatBg),
                  Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          reverse: true,
                          controller: _controller,
                          itemCount: messagesList.length,
                          itemBuilder: (context, index) {
                            return messagesList[index].id == email
                                ? BubbleNormal(
                                    text: messagesList[index].text,
                                    isSender: true,
                                    color: const Color(0xFF1B97F3),
                                    tail: true,
                                    sent: true,
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  )
                                : BubbleNormal(
                                    text: messagesList[index].text,
                                    isSender: false,
                                    color: const Color(0xFFE8E8EE),
                                    tail: true,
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      MessageBar(
                        messageBarColor: Colors.white,
                        onSend: (data) {
                          messages.add({
                            kMessage: data,
                            kCreatedAt: DateTime.now(),
                            kId: email,
                          });
                          messages.orderBy(kCreatedAt, descending: true);
                          _controller.animateTo(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
            );
          }
        });
  }
}
