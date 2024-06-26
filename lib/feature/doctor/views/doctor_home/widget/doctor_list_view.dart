import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/models/get_doctor_model.dart';
import '../../../../../core/theme/color.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widget/button.dart';

class DoctorListView extends StatefulWidget {
  final GetDoctorResponse model;
  final int index;
  const DoctorListView({super.key, required this.model, required this.index});

  @override
  State<DoctorListView> createState() => _DoctorListViewState();
}

class _DoctorListViewState extends State<DoctorListView> {
  bool x = true;

  @override
  void initState() {
    x = widget.model.data[widget.index].fav;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = widget.model.data[widget.index];
    return Container(
      width: 280,
      height: 170,
      decoration: BoxDecoration(
          color: ColorManger.light, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(model.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          8.sbW,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    model.name,
                    style: Styles.title18.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  //80.sbW,
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
              Container(
                constraints: const BoxConstraints(maxWidth: 200),
                child: Text(
                  model.desc,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.title14.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
              10.sbH,
              Row(
                children: [
                  5.sbW,
                  CustomButton(
                    text: 'Book',
                    onPressed: () {},
                    horizontal: 20,
                    vertical: 5,
                  ),
                  40.sbW,
                  const Icon(
                    Icons.star,
                    color: ColorManger.yellow,
                  ),
                  Text(
                    model.rate.toString(),
                    style: Styles.title16,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
