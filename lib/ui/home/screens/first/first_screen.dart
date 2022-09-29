import 'package:carousel_slider/carousel_slider.dart';
import 'package:cuivi_medic/ui/home/screens/first/screens/add_appointment.dart';
import 'package:cuivi_medic/ui/home/screens/first/screens/agend.dart';
import 'package:cuivi_medic/ui/home/screens/first/widgets/items.dart';
import 'package:cuivi_medic/ui/home/screens/first/widgets/profile_button.dart';
import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final CarouselController _controller = CarouselController();
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AddAppointment();
              });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.indigo,
      ),
      /*appBar: AppBarWidget(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo1.png',
              width: size.width * 0.25,
            ),
            const Text(
              'Médicos',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        actions: const [
          ProfileButton(),
        ],
      ),*/
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 45, 191, 227),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                alignment: Alignment.center,
                child: Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * .08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  child: Icon(Icons.person),
                                  radius: 50,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Hola, Mario',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '¿Como estas hoy?',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      FontAwesomeIcons.bell,
                                      color: Colors.indigo,
                                    )),
                              ),
                            ),
                            Spacer()
                          ],
                        ),
                      )),
                  SizedBox(height: size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: TextField(
                              style: TextStyle(),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                                labelText: ' Buscar',
                              ),
                              controller: search,
                              textCapitalization: TextCapitalization.sentences,
                              onEditingComplete: () {
                                setState(() {
                                  search;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ])),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      buildCarouselSlider(size),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: const [
                            // SfCalendar(
                            //   view: CalendarView.month,
                            //   dataSource: MeetingDataSource(_getDataSource()),
                            //   monthViewSettings: MonthViewSettings(
                            //       appointmentDisplayMode:
                            //           MonthAppointmentDisplayMode.appointment),
                            // ),
                            Agend(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CarouselSlider buildCarouselSlider(Size size) {
    List cardList = [const Items()];
    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
        height: size.height * 0.15,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: cardList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[100],
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/banner.jpg'),
                ),
              ),
              child: i,
            );
          },
        );
      }).toList(),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
