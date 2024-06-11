import 'package:flutter/material.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/navigator/named_navigator_impl.dart';
import '../../../../../core/navigator/named_navigator_routes.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widget/button.dart';
import '../models/time_model.dart';
import '../widgets/List_view_item.dart';

class BookTimePageBody extends StatefulWidget {
  const BookTimePageBody({super.key});

  @override
  State<BookTimePageBody> createState() => _BookTimePageBodyState();
}

class _BookTimePageBodyState extends State<BookTimePageBody> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectDay;
  Map<DateTime, List<EventsClass>> events = {};
  @override
  void initState() {
    _selectDay = _focusedDay;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectDay, DateTime focusedDay) {
    if (!isSameDay(_selectDay, selectDay)) {
      setState(() {
        _selectDay = selectDay;
        _focusedDay = focusedDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          50.sbH,
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    NamedNavigatorImpl.pushNamed(Routes.kAppointment);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorManger.mainColor,
                  )),
              50.sbW,
              const Center(
                child: Text(
                  'Select Date And Time',
                  style: Styles.title20,
                ),
              ),
            ],
          ),
          TableCalendar(
            firstDay: DateTime.utc(2010, 3, 14),
            lastDay: DateTime.utc(2030, 3, 14),
            onDaySelected: _onDaySelected,
            // selectedDayPredicate: (day) => isSamaDay(_selectDay, day),
            calendarFormat: _calendarFormat,
            startingDayOfWeek: StartingDayOfWeek.monday,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            calendarStyle: const CalendarStyle(outsideDaysVisible: false),
            focusedDay: _focusedDay,
          ),
          30.sbH,
          const TextItem(text: 'Available Time ', x: 180),
          30.sbH,
          SizedBox(
            height: 60,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (__, _) => const ListViewItem(text: '10.00 PM'),
                separatorBuilder: (ctx, index) => 20.sbW,
                itemCount: 10),
          ),
          50.sbH,
          CustomButton(
              text: 'Set  Appointment',
              onPressed: () {
                NamedNavigatorImpl.pushNamed(Routes.kBookTime);
              },
              horizontal: 90,
              vertical: 20)
        ],
      ),
    );
  }
}
