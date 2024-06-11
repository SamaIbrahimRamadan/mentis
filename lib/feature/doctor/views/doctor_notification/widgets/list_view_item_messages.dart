import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/navigator/named_navigator_impl.dart';
import '../../../../../core/navigator/named_navigator_routes.dart';
import '../../../../../core/theme/styles.dart';
import 'list_view_item_circle_avatar.dart';

class ListViewItemMessages extends StatelessWidget {
  const ListViewItemMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NamedNavigatorImpl.pushNamed(Routes.kChatDoctor);
      },
      child: Container(
        width: 340,
        height: 100,
        decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9).withOpacity(.7),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            10.sbW,
            const CustomCircleAvatar(),
            10.sbW,
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              20.sbH,
              Row(
                children: [
                  Text(
                    'Dr.Sara',
                    style:
                        Styles.title18.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  130.sbW,
                  Text(
                    '12:50',
                    style:
                        Styles.title14.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              10.sbH,
              Text(
                'how are you ? what are you feel now ? ',
                style: Styles.title14.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              10.sbH,
            ]),
          ],
        ),
      ),
    );
  }
}
