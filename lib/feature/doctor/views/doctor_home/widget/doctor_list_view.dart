import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/color.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widget/button.dart';
import '../../../../../res.dart';

class DoctorListView extends StatefulWidget {
  const DoctorListView({Key? key}) : super(key: key);

  @override
  State<DoctorListView> createState() => _DoctorListViewState();
}

class _DoctorListViewState extends State<DoctorListView> {
  bool x = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 170,
      decoration: BoxDecoration(
          color: ColorManger.light, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          horizontalSpace(8),
          Image.asset(Res.doctorImage),
          //horizontalSpace(8),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            verticalSpace(5),
            Row(
              children: [
                Text(
                  "Dr.Sara",
                  style: Styles.title18.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                horizontalSpace(70),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (x == false) {
                          x = true;
                        } else {
                          x = false;
                        }
                      });
                    },
                    icon: x
                        ? const Icon(
                            Icons.favorite_border,
                            color: ColorManger.mainColor,
                          )
                        : const Icon(
                            Icons.favorite,
                            color: ColorManger.mainColor,
                          )),
              ],
            ),
            Text(
              "Jorem ipsum dolor, consectetur \n adipiscing elit. Nunc v libero et \n velit  interdum, ac  mattes.",
              style: Styles.title14
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            verticalSpace(10),
            Row(
              children: [
                horizontalSpace(5),
                CustomButton(
                  text: 'Book',
                  onPressed: () {},
                  horizontal: 20,
                  vertical: 5,
                ),
                horizontalSpace(40),
                const Icon(
                  Icons.star,
                  color: ColorManger.yellow,
                ),
                const Text(
                  "5.0",
                  style: Styles.title16,
                ),
              ],
            )
          ]),
        ],
      ),
    );
  }
}
