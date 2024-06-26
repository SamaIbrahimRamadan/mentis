import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/core/widget/button.dart';
import 'package:mentis/feature/doctor/views/doctor_booking/widgets/list_view_item.dart';

import '../../../../../core/navigator/named_navigator_impl.dart';
import '../../../../../core/navigator/named_navigator_routes.dart';
import '../../../../../res.dart';
import '../widgets/custom_icon.dart';

class DoctorBookingBody extends StatelessWidget {
  const DoctorBookingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          50.sbH,
          const Center(
            child: Text(
              'Appointment',
              style: Styles.title20,
            ),
          ),
          30.sbH,
          Row(
            children: [
              10.sbW,
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorManger.light),
                child: Image.asset(Res.doctorImage),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      10.sbW,
                      Text(
                        'Dr.Sara',
                        style: Styles.title24.copyWith(color: Colors.black),
                      ),
                      40.sbW,
                      CustomIcon(
                          onTap: () {
                            NamedNavigatorImpl.pushNamed(Routes.kChatDoctor);
                          },
                          icon: Icons.chat_bubble_outline_rounded),
                      10.sbW,
                      CustomIcon(
                          onTap: () {
                            NamedNavigatorImpl.pushNamed(Routes.kCallDoctor);
                          },
                          icon: Icons.call),
                      10.sbW,
                      CustomIcon(onTap: () {}, icon: Icons.video_call_rounded)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Torem ipsum dolor sit amet,\n consectetur adipiscing elit.',
                      style: Styles.title14
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                  Row(
                    children: [
                      10.sbW,
                      Text(
                        'Payment',
                        style: Styles.title16
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      100.sbW,
                      Text(
                        '\$ 120.00',
                        style: Styles.title16
                            .copyWith(fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 300, top: 30),
            child: Text(
              'Details',
              style: Styles.title18.copyWith(color: Colors.black),
            ),
          ),
          20.sbH,
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Worem ipsum dolor sit amet, consectetur adipiscing elit. \n Nunc vulputate libero et velit interdum, ac aliquet odio \n mattis.Class aptent taciti sociosqu ad litora torquent per conubia  nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.',
              style: Styles.title14.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          20.sbH,
          const TextItem(text: 'Working hour'),
          20.sbH,
          SizedBox(
            height: 60,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) => const ListViewItem(
                      text: '10.00 PM',
                    ),
                separatorBuilder: (ctx, index) => 20.sbW,
                itemCount: 10),
          ),
          20.sbH,
          const TextItem(text: 'Date', x: 270),
          20.sbH,
          SizedBox(
            height: 60,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) => const ListViewItem(
                      text: 'Sun 4',
                    ),
                separatorBuilder: (ctx, index) => 20.sbW,
                itemCount: 10),
          ),
          20.sbH,
          CustomButton(
              text: 'Book on Appointment',
              onPressed: () {
                NamedNavigatorImpl.pushNamed(Routes.kBookTime);
              },
              horizontal: 100,
              vertical: 20)
        ]),
      ),
    );
  }
}
