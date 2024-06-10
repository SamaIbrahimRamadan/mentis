import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
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

abstract class AppRouter {
  static const kLogin = '/Login';
  static const kSignUp = '/SignUp';
  static const kMainPage = '/mainPage';
  static const kOnBoarding = '/onBoarding';
  static const kRecoverPass = '/RecoverPass';
  static const kVerification = '/Verification';
  static const kResetPass = '/ResetPass';
  static const kMoodAdvice = '/MoodAdvice';
  static const kChatDoctor = '/ChatDoctor';
  static const kNotificationDoctor = '/ NotificationDoctor';
  static const kCallDoctor = "/CallDoctor";
  static const kHome = '/home';
  static const kDoctorHome = '/doctor';
  static const kProfile = '/profile';
  static const kEditProfile = '/editProfile';
  static const kSendFeedback = '/kSendFeedback';
  static const kFeedback = '/kFeedback';
  static const kAdvice = '/kAdvice';
  static const kTakeAdvice = '/kTakeAdvice';
  static const kNote = '/kNote';
  static const kPaymentDone = '/kPaymentDone';
  static const kGame = '/kGame';
  static const kLearnLetter = '/kLearnLetter';
  static const kLearnColor = '/kLearnColor';
  static const kLearnSocialBehavior = '/kLearnSocialBehavior';
  static const kColoring = '/kColoring';
  static const kVrScore = '/kVrScore';
  static const kBookTime = '/kBookTime';
  static const kAppointment = '/kAppointment';
  static final GoRouter router = GoRouter(routes: <RouteBase>[
    // بيحتوي علي كل ال view
    GoRoute(
        path: "/",
        builder: (BuildContext context, GoRouterState state) {
          return (const SplashScreen());
        }),
    GoRoute(
        path: kAppointment,
        builder: (BuildContext context, GoRouterState state) {
          return (const DoctorBookingPages());
        }),
    GoRoute(
        path: kBookTime,
        builder: (BuildContext context, GoRouterState state) {
          return (const BookTimePage());
        }),
    GoRoute(
        path: kGame,
        builder: (BuildContext context, GoRouterState state) {
          return (const GamesScreen());
        }),
    GoRoute(
        path: kColoring,
        builder: (BuildContext context, GoRouterState state) {
          return (const Coloring());
        }),
    GoRoute(
        path: kLearnLetter,
        builder: (BuildContext context, GoRouterState state) {
          return (const LearnLetterPage());
        }),
    GoRoute(
        path: kLearnColor,
        builder: (BuildContext context, GoRouterState state) {
          return (const LearnColorPage());
        }),
    GoRoute(
        path: kLearnSocialBehavior,
        builder: (BuildContext context, GoRouterState state) {
          return (const LearnSocialBehaviorPage());
        }),
    GoRoute(
        path: kSendFeedback,
        builder: (BuildContext context, GoRouterState state) {
          return (const SendFeedBack());
        }),
    GoRoute(
        path: kVrScore,
        builder: (BuildContext context, GoRouterState state) {
          return (const VrScore());
        }),
    GoRoute(
        path: kChatDoctor,
        builder: (BuildContext context, GoRouterState state) {
          return (const DoctorChatPage());
        }),
    GoRoute(
        path: kNotificationDoctor,
        builder: (BuildContext context, GoRouterState state) {
          return (const DoctorNotificationPage());
        }),
    GoRoute(
        path: kDoctorHome,
        builder: (BuildContext context, GoRouterState state) {
          return (const DoctorButtonNavPage());
        }),
    GoRoute(
        path: kPaymentDone,
        builder: (BuildContext context, GoRouterState state) {
          return (const PaymentDone());
        }),
    GoRoute(
        path: kCallDoctor,
        builder: (BuildContext context, GoRouterState state) {
          return (const CallDoctorPage());
        }),
    GoRoute(
        path: kMoodAdvice,
        builder: (BuildContext context, GoRouterState state) {
          return (const MangeMoodAdvice());
        }),
    GoRoute(
        path: kNote,
        builder: (BuildContext context, GoRouterState state) {
          return (const NotePage());
        }),
    GoRoute(
        path: kFeedback,
        builder: (BuildContext context, GoRouterState state) {
          return (const FeedBackPageScreen());
        }),

    GoRoute(
        path: kAdvice,
        builder: (BuildContext context, GoRouterState state) {
          return (const AdvicePage());
        }),
    GoRoute(
        path: kHome,
        builder: (BuildContext context, GoRouterState state) {
          return (const ButtonNavPage());
        }),
    GoRoute(
        path: kEditProfile,
        builder: (BuildContext context, GoRouterState state) {
          return (const EditProfile());
        }),
    GoRoute(
        path: kProfile,
        builder: (BuildContext context, GoRouterState state) {
          return (const ProfileScreen());
        }),
    GoRoute(
        path: kRecoverPass,
        builder: (BuildContext context, GoRouterState state) {
          return (const RecoverPass());
        }),
    GoRoute(
        path: kVerification,
        builder: (BuildContext context, GoRouterState state) {
          return (const VerificationScreen());
        }),
    GoRoute(
        path: kResetPass,
        builder: (BuildContext context, GoRouterState state) {
          return (const ResetPassScreen());
        }),
    GoRoute(
        path: kOnBoarding,
        builder: (BuildContext context, GoRouterState state) {
          return (const OnBoardingScreen());
        }),
    GoRoute(
        path: kMainPage,
        builder: (BuildContext context, GoRouterState state) {
          return (const MainPageScreen());
        }),
    GoRoute(
        path: kTakeAdvice,
        builder: (BuildContext context, GoRouterState state) {
          return (const TakeAdvice());
        }),
    GoRoute(
        path: kLogin,
        builder: (BuildContext context, GoRouterState state) {
          return (const LoginScreen());
        }),
    GoRoute(
        path: kSignUp,
        builder: (BuildContext context, GoRouterState state) {
          return (const SignUpScreen());
        }),
    GoRoute(
        path: kPaymentDone,
        builder: (BuildContext context, GoRouterState state) {
          return (const GamesScreen());
        }),
  ]);
}
