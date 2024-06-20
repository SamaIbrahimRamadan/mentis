import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/core/widget/app_loader.dart';

import '../../../core/api/di.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../core/theme/styles.dart';
import '../../../res.dart';
import '../cubit/game_cubit.dart';

class LearnLetterPage extends StatefulWidget {
  const LearnLetterPage({super.key});

  @override
  State<LearnLetterPage> createState() => _LearnLetterPageState();
}

class _LearnLetterPageState extends State<LearnLetterPage> {
  @override
  Widget build(BuildContext context) {
    bool isLast = false;
    var control = PageController();
    return Scaffold(
      body: BlocProvider<GameCubit>(
        create: (context) => di<GameCubit>()..getGameLetters(),
        child: BlocConsumer<GameCubit, GameState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = GameCubit.of(context);
            final model = cubit.model?.data;
            if (state is GameLoadingState) {
              return const AppLoader();
            } else {
              if (model?.isEmpty ?? true) {
                return const Center(child: Text('No Data Added'));
              } else {
                return Column(
                  children: [
                    40.sbH,
                    Row(
                      children: [
                        10.sbW,
                        IconButton(
                          onPressed: () => NamedNavigatorImpl.pop(),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: ColorManger.mainColor,
                          ),
                        ),
                        100.sbW,
                        Text(
                          'Letter',
                          style: Styles.title20.copyWith(),
                        ),
                        80.sbW,
                        Image.asset(
                          Res.img,
                          width: 60,
                          height: 70,
                        ),
                      ],
                    ),
                    Expanded(
                      child: PageView.builder(
                        onPageChanged: (int index) {
                          if (index == model!.length - 1) {
                            setState(() {
                              isLast = true;
                            });
                          } else {
                            setState(() {
                              isLast = false;
                            });
                          }
                        },
                        controller: control,
                        itemCount: model?.length ?? 0,
                        //boarding.length,
                        itemBuilder: (c, i) {
                          return Container(
                            margin: const EdgeInsets.all(20),
                            child: Image.network(
                              model![i].image ?? '',
                              width: 350,
                              height: 400,
                            ),
                          );
                          // return LetterWidget(model: model![i]);
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 73, left: 250),
                      child: FloatingActionButton(
                        backgroundColor: ColorManger.mainColor,
                        onPressed: () {
                          if (isLast) {
                            NamedNavigatorImpl.pushNamed(Routes.kMainPage);
                          } else {
                            control.nextPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.fastLinearToSlowEaseIn);
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(color: ColorManger.mainColor),
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}
