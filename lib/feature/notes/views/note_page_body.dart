import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/core/widget/icon_button.dart';

import '../../../res.dart';

class NotePageBody extends StatelessWidget {
  const NotePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            50.sbH,
            Row(
              children: [
                40.sbW,
                const Text(
                  'Notes',
                  style: Styles.title24,
                ),
                170.sbW,
                CustomIconButton(
                  onTap: () {},
                  icon: Icons.search,
                  colorIcon: Colors.white,
                ),
                30.sbW,
                CustomIconButton(
                    onTap: () {},
                    icon: Icons.settings_input_svideo_outlined,
                    colorIcon: Colors.white),
              ],
            ),
            Image.asset(Res.note2),
            const Text('Create Your First Note!', style: Styles.title20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManger.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: const BorderSide(color: ColorManger.mainColor),
        ),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
