import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/feature/doctor/widgets/custom_search.dart';

import '../../../../../core/navigator/named_navigator_impl.dart';
import '../../../../../core/navigator/named_navigator_routes.dart';
import '../widget/doctor_list_view.dart';

class DoctorPageBody extends StatefulWidget {
  const DoctorPageBody({super.key});

  @override
  State<DoctorPageBody> createState() => _DoctorPageBodyState();
}

class _DoctorPageBodyState extends State<DoctorPageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          verticalSpace(40),
          Row(
            children: [
              horizontalSpace(30),
              IconButton(
                  onPressed: () {
                    NamedNavigatorImpl.pushNamed(Routes.kHome);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorManger.mainColor,
                  )),
              horizontalSpace(80),
              const Text(
                "All Doctors",
                style: Styles.title18,
              ),
            ],
          ),
          verticalSpace(30),
          const CustomTextFieldSearch(
            hintText: 'Search',
            icons3: Icons.search,
            icon2: (Icons.mic),
          ),
          //verticalSpace(10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 33, right: 33),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return const DoctorListView();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return verticalSpace(14);
                },
                itemCount: 4,
              ),
            ),
          )
        ],
      ),
    );
  }
}
