import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/models/appointment_model.dart';
import 'package:cuivi_medic/ui/providers/appointment_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Agend extends StatefulWidget {
  const Agend({Key? key}) : super(key: key);

  @override
  State<Agend> createState() => _AgendState();
}

class _AgendState extends State<Agend> {
  var isInit = false;
  bool exist = false;

  var _isLoading = false;
  @override
  void didChangeDependencies() {
    if (!isInit) {
      setState(() {
        _isLoading = true;
      });
      // Provider.of<ParamsProvider>(context).typesProvider(context).then((value) {
      //   setState(() {
      //     _isLoading = false;
      //   });
      // });
      Provider.of<AppointmentProvider>(context)
          .getAppointment(context)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      isInit = true;
      super.didChangeDependencies();
    }
  }

  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  AppointmentModel? appointmentModel;

  @override
  Widget build(BuildContext context) {
    final appointment = Provider.of<AppointmentProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          TableCalendar(
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
              logger.d(_selectedDay);
            },
            calendarBuilders:
                CalendarBuilders(markerBuilder: (context, date, event) {
              final children = <Widget>[];
              int ticket = 0;

              appointment.add.forEach((element) {
                if (element.appointmentTime.toString().substring(0, 10) ==
                    date.toString().substring(0, 10)) {
                  ticket++;
                }
              });
              children.add(
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ticket != 0
                        ? containerEvent(
                            ticket,
                            const Color.fromARGB(255, 91, 178, 216),
                            Colors.black87)
                        : Container(),
                    const SizedBox(width: 2, height: 0),
                  ],
                ),
              );
              return Row(
                children: children,
                mainAxisAlignment: MainAxisAlignment.center,
              );
            }),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _selectedDay ?? DateTime.now(),
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          ),
          const SizedBox(height: 30),
          Column(
              children: List.generate(appointment.add.length, (index) {
            final info = appointment.add[index];

            if (info.appointmentTime.toString().substring(0, 10) ==
                _focusedDay.toString().substring(0, 10)) {
              return Column(
                children: [
                  Container(
                      height: 80,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.clock,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${info.start}- ${info.end}',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.calendar,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    SizedBox(height: 10),
                                    Text(info.title,
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            const Divider(
                              height: 2,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              info.description,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(height: 10)
                ],
              );
            } else {
              return const SizedBox();
            }
          })),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<DateTime>('_focusedDay', _focusedDay));
  }

  Container containerEvent(int ticket, Color color, Color textColor) {
    return Container(
      width: 13,
      height: 13,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Center(
        child: Text(
          '$ticket',
          style: TextStyle(
              color: textColor, fontSize: 7, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // _onDaySelected(DateTime day) {
  //   globals.date = day;
  //   selectedDate = day;
  //   _selectedDay = day;
  //   _focusedDay = day;
  //   dateNow = day;
  //   date = DateTime.parse(selectedDate.toString().split(" ")[0]);

  //   // schedulesDay = schedules
  //   //     .where((e) =>
  //   //         DateUtils.dateOnly(DateTime.parse(e.start)) ==
  //   //         DateUtils.dateOnly(_focusedDay))
  //   //     .toList();
  //   // schedulesDay.sort(
  //   //     (a, b) => a.start.split(' ').last.compareTo(b.start.split(' ').last));
  //   setState(() {});
  // }

}
