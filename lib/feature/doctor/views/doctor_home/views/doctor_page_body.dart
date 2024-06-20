import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/feature/doctor/widgets/custom_search.dart';

import '../../../../../core/api/di.dart';
import '../../../../../core/navigator/named_navigator_impl.dart';
import '../../../../../core/theme/color.dart';
import '../../../../../core/widget/app_loader.dart';
import '../get_all_doctor_cubit.dart';
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
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            onPressed: () {
              NamedNavigatorImpl.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorManger.mainColor,
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'All Doctors',
          style: Styles.title18,
        ),
      ),
      body: BlocProvider(
        create: (context) => di<GetAllDoctorCubit>()..getAllDoctor(),
        child: BlocConsumer<GetAllDoctorCubit, GetAllDoctorState>(
          listener: (context, state) {},
          builder: (context, state) {
            final model = GetAllDoctorCubit.get(context).doctorData;
            return state is GetAllDoctorLoading
                ? const AppLoader()
                : Column(
                    children: [
                      20.sbH,
                      const Center(
                        child: CustomTextFieldSearch(
                          hintText: 'Search',
                          icons3: Icons.search,
                          icon2: (Icons.mic),
                        ),
                      ),
                      20.sbH,
                      Expanded(
                        child: model?.data.isEmpty ?? true
                            ? const Text('No Doctor Available')
                            : Padding(
                                padding: const EdgeInsets.only(left: 33, right: 33),
                                child: ListView.separated(
                                  itemCount: model!.data.length,
                                  itemBuilder: (c, i) => DoctorListView(model: model, index: i),
                                  separatorBuilder: (c, i) => 14.sbH,
                                ),
                              ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}
