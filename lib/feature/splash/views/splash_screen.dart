import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/feature/splash/splash_cubit.dart';
import '../../../core/api/di.dart';
import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../core/theme/color.dart';
import '../../../core/widget/button.dart';
import '../../../res.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SplashCubit>()..switchAnimation(),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticatedState) {
            NamedNavigatorImpl.pushNamed(Routes.kOnBoarding, clean: true);
          }
          if (state is AuthenticatedState) {
            NamedNavigatorImpl.pushNamed(Routes.kHome, clean: true);
          }
        },
        builder: (context, state) {
          final cubit = SplashCubit.get(context);
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Res.color),
                fit: BoxFit.fill,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Pulse(
                      infinite: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.asset(Res.logo, width: 200),
                      ),
                    ),
                    150.sbH,
                    !cubit.hideBtn
                        ? const SizedBox()
                        : CustomButton(
                            text: "Let's Start",
                            onPressed: () => NamedNavigatorImpl.pushNamed(
                              Routes.kOnBoarding,
                            ), // clean: true),
                            horizontal: 100,
                            color: Colors.white,
                            color2: ColorManger.mainColor,
                            vertical: 10,
                          )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
