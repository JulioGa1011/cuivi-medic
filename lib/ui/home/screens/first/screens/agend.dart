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
        if (mounted)
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
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFF9FA8DA),
                  shape: BoxShape.rectangle),
              selectedDecoration: BoxDecoration(
                  //borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFF5C6BC0),
                  shape: BoxShape.rectangle),
            ),
            headerVisible: false,
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
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Hora'),
                  Text('Citas'),
                  SizedBox(width: 100),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.format_line_spacing_sharp))
                ],
              ),
              Column(
                  children: List.generate(appointment.add.length, (index) {
                final info = appointment.add[index];

                if (info.appointmentTime.toString().substring(0, 10) ==
                    _focusedDay.toString().substring(0, 10)) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Column(children: [
                              Text(
                                info.start,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              Text(info.end)
                            ]),
                          ),
                          Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.65,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 0, 189, 236),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(info.title,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white)),
                                        SizedBox(height: 10),
                                        const Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      info.description
                                          .replaceAll("<p>", "")
                                          .replaceAll("</p>", ""),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Text(
                                      'Paciente',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 10)
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              })),
            ],
          ),
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
