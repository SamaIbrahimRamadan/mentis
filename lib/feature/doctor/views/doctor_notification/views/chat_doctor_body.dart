import 'package:flutter/material.dart';
import 'package:mentis/feature/doctor/views/doctor_notification/widgets/appbar_chat_doctor.dart';
import 'package:mentis/feature/doctor/views/doctor_notification/widgets/new_messages.dart';
import 'package:mentis/feature/doctor/views/doctor_notification/widgets/send_messages.dart';

import '../../../../../core/helper/spacing.dart';

class DoctorChatBody extends StatelessWidget {
  const DoctorChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      40.sbH,
      const AppBarChatDoctor(),
      const Expanded(child: NewMessages()),
      const SendMessages()
    ]));
  }
}
