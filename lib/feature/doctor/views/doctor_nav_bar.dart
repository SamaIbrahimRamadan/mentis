import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/color.dart';
import '../views_model/doctor_cubit.dart';

class DoctorButtonNavPage extends StatelessWidget {
  const DoctorButtonNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit(),
      child: BlocConsumer<DoctorCubit, DoctorState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body:
                DoctorCubit.get(context).pages[DoctorCubit.get(context).select],
            bottomNavigationBar: BottomNavigationBar(
              onTap: DoctorCubit.get(context).selectPage,
              currentIndex: DoctorCubit.get(context).select,
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
                    icon: Icon(Icons.shopping_bag_outlined, size: 30),
                    label: 'Payment'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.access_time, size: 30), label: 'Booking'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_outlined, size: 30), label: "chats"),
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
