import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/color.dart';
import '../view-model/home_cubit.dart';

class ButtonNavPage extends StatelessWidget {
  const ButtonNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: HomeCubit.get(context).pages[HomeCubit.get(context).select],
            bottomNavigationBar: BottomNavigationBar(
              onTap: HomeCubit.get(context).selectPage,
              currentIndex: HomeCubit.get(context).select,
              unselectedItemColor: Colors.black,
              selectedItemColor: ColorManger.mainColor,
              backgroundColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                    ),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined, size: 30),
                    label: 'feedback'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports_esports_rounded, size: 30),
                    label: 'Games'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat, size: 30), label: "tasks"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person, size: 30), label: 'profile'),
              ],
            ),
          );
        },
      ),
    );
  }
}
