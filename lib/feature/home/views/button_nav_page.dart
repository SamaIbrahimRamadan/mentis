import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api/di.dart';
import '../../../core/theme/color.dart';
import '../view-model/home_cubit.dart';

class ButtonNavPage extends StatelessWidget {
  const ButtonNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<HomeCubit>(),
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
              items: [
                btnNavItem(Icons.home, 'home'),
                btnNavItem(Icons.category_outlined, 'feedback'),
                btnNavItem(Icons.sports_esports_rounded, 'Games'),
                btnNavItem(Icons.chat, 'tasks'),
                btnNavItem(Icons.person, 'profile'),
              ],
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem btnNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 30),
      label: label,
    );
  }
}
