import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentis/feature/doctor/views/doctor_notification/widgets/message_bubble.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({Key? key}) : super(key: key);

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  @override
  Widget build(BuildContext context) {
    final authUser = FirebaseAuth.instance.currentUser!;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (ctx, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (!snapShot.hasData || snapShot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No Messages found"),
            );
          }
          if (snapShot.hasError) {
            return const Center(
              child: Text("something error have"),
            );
          }
          final loadedMessage = snapShot.data!.docs;
          return ListView.builder(
              padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
              reverse: true,
              itemCount: loadedMessage.length,
              itemBuilder: (ctx, index) {
                final chatMessages = loadedMessage[index].data();
                final nextMessages = index + 1 < loadedMessage.length
                    ? loadedMessage[index + 1].data()
                    : null;
                final currentMessagesUserId = chatMessages['userId'];
                final nextMessagesUserId =
                    nextMessages != null ? nextMessages['userId'] : null;
                final bool nextUserSame =
                    nextMessagesUserId == currentMessagesUserId;
                if (nextUserSame) {
                  return MessageBubble.next(
                      message: chatMessages['text'],
                      isMe: authUser.uid == currentMessagesUserId);
                } else {
                  return MessageBubble.first(
                      message: chatMessages['text'],
                      isMe: authUser.uid == currentMessagesUserId);
                }
              });
        });
  }
}
