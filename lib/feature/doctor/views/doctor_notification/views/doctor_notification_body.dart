import 'package:flutter/material.dart';
import 'package:mentis/feature/doctor/views/doctor_notification/widgets/list_view_item_messages.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/styles.dart';
import '../../../widgets/custom_search.dart';
import '../widgets/list_view_item_circle_avatar.dart';

class DoctorNotificationBody extends StatelessWidget {
  const DoctorNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Messages', style: Styles.title20),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                size: 28,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          30.sbH,
          const CustomTextFieldSearch(
            hintText: 'Search',
            icons3: Icons.search,
            icon2: (Icons.mic),
          ),
          20.sbH,
          Container(
            margin: const EdgeInsets.only(right: 195),
            child: const Text('Active Now', style: Styles.title22),
          ),
          20.sbH,
          SizedBox(
            height: 80,
            child: Expanded(
              flex: 1,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const ListViewItemCircleAvatar();
                  }),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 205),
            child: const Text('Messages', style: Styles.title22),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return const ListViewItemMessages();
                },
                separatorBuilder: (x, i) => 14.sbH,
                itemCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
