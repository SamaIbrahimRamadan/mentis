import 'package:flutter/material.dart';
import 'package:mentis/feature/advice/views/advice_page.dart';
import 'package:mentis/feature/advice/views/take_advice_page.dart';
import 'package:mentis/feature/auth/login/views/login_screen.dart';
import 'package:mentis/feature/auth/login/views/recover_pass.screen.dart';
import 'package:mentis/feature/auth/login/views/reset_pass_screen.dart';
import 'package:mentis/feature/auth/login/views/verification_screen.dart';
import 'package:mentis/feature/auth/sign_up/views/sign_up_screen.dart';
import 'package:mentis/feature/doctor/views/doctor_booking/views/book_time_page.dart';
import 'package:mentis/feature/doctor/views/doctor_booking/views/doctor_booking.dart';
import 'package:mentis/feature/doctor/views/doctor_nav_bar.dart';
import 'package:mentis/feature/doctor/views/doctor_notification/views/chat_doctor.dart';
import 'package:mentis/feature/doctor/views/doctor_notification/views/doctor_notification.dart';
import 'package:mentis/feature/doctor/views/doctor_payment/payment_done.dart';
import 'package:mentis/feature/feedback/views/feedback_page_body.dart';
import 'package:mentis/feature/feedback/views/manage_mode_advice.dart';
import 'package:mentis/feature/feedback/views/send_feedback.dart';
import 'package:mentis/feature/games/views/coloring.dart';
import 'package:mentis/feature/games/views/random_game/random_game.dart';
import 'package:mentis/feature/games/views/games.dart';
import 'package:mentis/feature/games/views/learn_letter_page.dart';
import 'package:mentis/feature/games/views/learn_social_behavior.dart';
import 'package:mentis/feature/home/views/button_nav_page.dart';
import 'package:mentis/feature/notes/views/note_page.dart';
import 'package:mentis/feature/onBoarding/views/boarding_screen.dart';
import 'package:mentis/feature/profile/views/edit_profile.dart';
import 'package:mentis/feature/profile/views/profile_screen.dart';
import 'package:mentis/feature/splash/views/splash_screen.dart';
import 'package:mentis/feature/vr/views/vr_score_page.dart';

import '../../feature/auth/main_page/views/main_page_screen.dart';
import '../../feature/doctor/views/doctor_notification/views/call_doctor.dart';
import '../../feature/games/views/learn_color_page.dart';
import 'named_navigator_routes.dart';

class NamedNavigatorImpl {
  static final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

  static void pop({dynamic result}) {
    if (Navigator.of(navigatorState.currentState!.context).canPop()) {
      Navigator.of(navigatorState.currentState!.context).pop(result);
    }
  }

  static Future push(Widget screen, {bool replace = false, bool clean = false}) {
    if (clean) {
      return navigatorState.currentState!
          .pushAndRemoveUntil(MaterialPageRoute(builder: (_) => screen), (_) => false);
    } else if (replace) {
      return navigatorState.currentState!
          .pushReplacement(MaterialPageRoute(builder: (_) => screen));
    } else {
      return navigatorState.currentState!.push(MaterialPageRoute(builder: (_) => screen));
    }
  }

  static Future pushNamed(String routeName, {arguments, bool replace = false, bool clean = false}) {
    if (clean) {
      return navigatorState.currentState!
          .pushNamedAndRemoveUntil(routeName, (_) => false, arguments: arguments);
    } else if (replace) {
      return navigatorState.currentState!.pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!.pushNamed(routeName, arguments: arguments);
    }
  }

  static Route<dynamic> onGenerateRoute(RouteSettings? settings) {
    switch (settings!.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.kLogin:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.kHome:
        return MaterialPageRoute(builder: (_) => const ButtonNavPage());

      case Routes.kAppointment:
        return MaterialPageRoute(builder: (_) => const DoctorBookingPages());

      case Routes.kBookTime:
        return MaterialPageRoute(builder: (_) => const BookTimePage());

      case Routes.kGame:
        return MaterialPageRoute(builder: (_) => const GamesScreen());

      case Routes.kColoring:
        return MaterialPageRoute(builder: (_) => const Coloring());

      case Routes.kLearnLetter:
        return MaterialPageRoute(builder: (_) => const LearnLetterPage());

      case Routes.kLearnColor:
        return MaterialPageRoute(builder: (_) => const LearnColorPage());

      case Routes.kLearnSocialBehavior:
        return MaterialPageRoute(builder: (_) => const LearnSocialBehaviorPage());

      case Routes.kSendFeedback:
        return MaterialPageRoute(builder: (_) => const SendFeedBack());

      case Routes.kVrScore:
        return MaterialPageRoute(builder: (_) => const VrScore());

      case Routes.kChatDoctor:
        return MaterialPageRoute(builder: (_) => const DoctorChatPage());

      case Routes.kNotificationDoctor:
        return MaterialPageRoute(builder: (_) => const DoctorNotificationPage());

      case Routes.kDoctorHome:
        return MaterialPageRoute(builder: (_) => const DoctorButtonNavPage());

      case Routes.kPaymentDone:
        return MaterialPageRoute(builder: (_) => const PaymentDone());

      case Routes.kCallDoctor:
        return MaterialPageRoute(builder: (_) => const CallDoctorPage());

      case Routes.kMoodAdvice:
        return MaterialPageRoute(builder: (_) => const MangeMoodAdvice());

      case Routes.kNote:
        return MaterialPageRoute(builder: (_) => const NotePage());

      case Routes.kFeedback:
        return MaterialPageRoute(builder: (_) => const FeedBackPageScreen());

      case Routes.kAdvice:
        return MaterialPageRoute(builder: (_) => const AdvicePage());

      case Routes.kEditProfile:
        return MaterialPageRoute(builder: (_) => const EditProfile());

      case Routes.kProfile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case Routes.kRecoverPass:
        return MaterialPageRoute(builder: (_) => const RecoverPass());

      case Routes.kVerification:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());

      case Routes.kResetPass:
        return MaterialPageRoute(builder: (_) => const ResetPassScreen());

      case Routes.kOnBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.kLearn:
        return MaterialPageRoute(builder: (_) => const RandomGameScreen());
      case Routes.kMainPage:
        return MaterialPageRoute(builder: (_) => const MainPageScreen());

      case Routes.kTakeAdvice:
        return MaterialPageRoute(builder: (_) => const TakeAdvice());

      case Routes.kSignUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      ///
    }

    return MaterialPageRoute(builder: (_) => Container());
  }
}
