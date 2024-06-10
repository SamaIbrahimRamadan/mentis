import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentis/feature/doctor/views/doctor_booking/views/doctor_booking.dart';
import 'package:mentis/feature/doctor/views/doctor_home/views/doctor_page.dart';
import 'package:mentis/feature/doctor/views/doctor_notification/views/doctor_notification.dart';
import 'package:mentis/feature/doctor/views/doctor_payment/doctor_payment.dart';
import 'package:mentis/feature/doctor/views/doctor_profile/doctor_profile.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  static DoctorCubit get(context) => BlocProvider.of(context);
  int select = 0;
  void selectPage(int value) {
    select = value;
    emit(Doctor());
  }

  final pages = const [
    DoctorHomePages(),
    DoctorPaymentPages(),
    DoctorBookingPages(),
    DoctorNotificationPage(),
    DoctorProfile()
  ];
}
