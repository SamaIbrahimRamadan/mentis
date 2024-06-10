import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/widget/icon_button.dart';
import '../../../widgets/custom_search.dart';

class SendMessages extends StatefulWidget {
  const SendMessages({Key? key}) : super(key: key);

  @override
  State<SendMessages> createState() => _SendMessagesState();
}

class _SendMessagesState extends State<SendMessages> {
  final messagesController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    messagesController.dispose();
  }

  _sendMessages() async {
    final enterMessage = messagesController.text;
    if (enterMessage.trim().isEmpty) {
      return;
    }
    final User user = FirebaseAuth.instance.currentUser!; //بجيب اليوزر الحالي
    final userData =
        await FirebaseFirestore.instance.collection('user').doc(user.uid).get();

    await FirebaseFirestore.instance.collection('chat').add({
      'text': enterMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'email': userData.data()!['email'],
    });
    messagesController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 310),
          child: CustomIconButton(
            onTap: () {},
            icon: Icons.mic_none,
            width: 60,
            x: 40,
            height: 60,
          ),
        ),
        verticalSpace(10),
        Row(
          children: [
            horizontalSpace(20),
            CustomTextFieldSearch(
              width: 290,
              hintText: 'Write here',
              icon2: Icons.emoji_emotions,
              controller: messagesController,
              icons3: Icons.camera_alt,
            ),
            horizontalSpace(10),
            CustomIconButton(
              onTap: _sendMessages,
              icon: Icons.send,
              width: 60,
              x: 40,
              height: 60,
            )
          ],
        ),
        verticalSpace(60)
      ],
    );
  }
}
