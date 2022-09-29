import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/models/medicament_model.dart';
import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:cuivi_medic/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddPrescription extends StatefulWidget {
  const AddPrescription({Key? key}) : super(key: key);

  @override
  State<AddPrescription> createState() => _AddPrescriptionState();
}

class _AddPrescriptionState extends State<AddPrescription> {
  int page = 0;
  bool generate = false;
  TextEditingController _medicamentName = TextEditingController();
  final TextEditingController _tradename = TextEditingController();
  final TextEditingController _days = TextEditingController();
  final TextEditingController _hours = TextEditingController();
  final TextEditingController _presentation = TextEditingController();
  final TextEditingController _administration = TextEditingController();
  final TextEditingController _gramage = TextEditingController();
  final TextEditingController _cantidad = TextEditingController();
  bool addMedicament = false;
  List<MedicamentModel> medicaments = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1), () {
      page = _pageController.page!.toInt();
    });
  }

  final PageController _pageController = PageController();
  submit(String name, String tradename) {
    setState(() {
      medicaments.add(MedicamentModel(name: name, tradename: tradename));
    });
  }

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      setState(() {
        page = _pageController.page!.round();
      });
    });
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    if (page == 0)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('Datos del paciente',
                                style: TextStyle(fontSize: 20)),
                            const SizedBox(height: 20),
                            InputWidget(
                                hintText: 'Nombre',
                                onSubmitted: (value) {},
                                validate: (num) {}),
                            const SizedBox(height: 20),
                            InputWidget(
                                hintText: 'Edad',
                                onSubmitted: (value) {},
                                validate: (num) {}),
                            const SizedBox(height: 20),
                            InputWidget(
                                hintText: 'Email',
                                onSubmitted: (value) {},
                                validate: (num) {}),
                            const SizedBox(height: 20),
                            InputWidget(
                                hintText: 'Peso',
                                onSubmitted: (value) {},
                                validate: (num) {}),
                            const SizedBox(height: 20),
                            InputWidget(
                                hintText: 'Alergias',
                                onSubmitted: (value) {},
                                validate: (num) {}),
                            const SizedBox(height: 20),
                            InputWidget(
                                hintText: 'Fecha de nacimiento',
                                onSubmitted: (value) {},
                                validate: (num) {}),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    if (page == 1)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('Datos del paciente'),
                            const SizedBox(height: 20),
                            InputWidget(
                                hintText: 'TA',
                                onSubmitted: (value) {},
                                validate: (num) {}),
                            const SizedBox(height: 20),
                            InputWidget(
                                hintText: 'FC',
                                onSubmitted: (value) {},
                                validate: (num) {}),
                            const SizedBox(height: 20),
                            InputWidget(
                                hintText: 'FR',
                                onSubmitted: (value) {},
                                validate: (num) {}),
                            const SizedBox(height: 20),
                            InputWidget(
                                hintText: 'Glucosa',
                                onSubmitted: (value) {},
                                validate: (num) {}),
                            const SizedBox(height: 20),
                            InputWidget(
                                hintText: 'Temperatura',
                                onSubmitted: (value) {},
                                validate: (num) {}),
                          ],
                        ),
                      ),
                    if (page == 2)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('Diagnostico',
                                style: TextStyle(fontSize: 20)),
                            const SizedBox(height: 20),
                            InputWidget(
                                hintText: 'Diagnostico',
                                onSubmitted: (value) {},
                                validate: (num) {}),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    if (page == 3)
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text('Medicamentos',
                                  style: TextStyle(fontSize: 20)),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: InputWidget(
                                      hintText: 'Sustancia activa',
                                      onSubmitted: (value) {},
                                      validate: (num) {},
                                      controller: _medicamentName,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        if (_medicamentName.text.isNotEmpty) {
                                          setState(() {
                                            addMedicament = true;
                                          });
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Scaffold(
                                                  appBar: const AppBarWidget(
                                                    isShowBack: true,
                                                    title: Text(
                                                        'Datos del medicamento ',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        )),
                                                  ),
                                                  body: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        InputWidget(
                                                          hintText:
                                                              'Sustancia activa ',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller:
                                                              _medicamentName,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        InputWidget(
                                                          hintText:
                                                              'Nombre Comercial',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller:
                                                              _tradename,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        InputWidget(
                                                          hintText:
                                                              'Presentación',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller:
                                                              _presentation,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        InputWidget(
                                                          hintText: 'Gramaje',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller: _gramage,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        InputWidget(
                                                          hintText: 'Cantidad ',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller: _cantidad,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        InputWidget(
                                                          hintText:
                                                              'Vía de administracion ',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller:
                                                              _administration,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        InputWidget(
                                                          hintText:
                                                              'Por cuantos días ',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller: _days,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        InputWidget(
                                                          hintText:
                                                              'Cada cuantas horas  ',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller: _hours,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            submit(
                                                                _medicamentName
                                                                    .text,
                                                                _tradename
                                                                    .text);
                                                            _medicamentName
                                                                .clear();
                                                            _tradename.clear();
                                                            logger.d(medicaments
                                                                .length);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              Text('Guardar'),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                                ;
                                              });
                                        }
                                      },
                                      icon: const Icon(
                                        FontAwesomeIcons.solidSquarePlus,
                                        color: Colors.blueAccent,
                                      ))
                                ],
                              ),
                              // const Text('os', style: TextStyle(fontSize: 15)),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: InputWidget(
                                      hintText: 'Nombre comercial',
                                      onSubmitted: (value) {},
                                      validate: (num) {},
                                      controller: _tradename,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        if (_tradename.text.isNotEmpty) {
                                          setState(() {
                                            addMedicament = true;
                                          });
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Scaffold(
                                                  appBar: const AppBarWidget(
                                                    isShowBack: true,
                                                    title: Text(
                                                        'Datos del medicamento ',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        )),
                                                  ),
                                                  body: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        InputWidget(
                                                          hintText:
                                                              'Nombre Generico',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller:
                                                              _medicamentName,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        InputWidget(
                                                          hintText:
                                                              'Nombre Comercial',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller:
                                                              _tradename,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        InputWidget(
                                                          hintText:
                                                              'Presentación',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller:
                                                              _presentation,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        InputWidget(
                                                          hintText: 'Dias ',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller: _days,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        InputWidget(
                                                          hintText: 'Horas ',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller: _hours,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        InputWidget(
                                                          hintText:
                                                              'Vía de administracion ',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller:
                                                              _administration,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        InputWidget(
                                                          hintText: 'Gramaje',
                                                          onSubmitted:
                                                              (value) {},
                                                          validate: (num) {},
                                                          controller: _gramage,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            submit(
                                                                _medicamentName
                                                                    .text,
                                                                _tradename
                                                                    .text);
                                                            _medicamentName
                                                                .clear();
                                                            _tradename.clear();
                                                            logger.d(medicaments
                                                                .length);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              Text('Guardar'),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                                ;
                                              });
                                        }
                                      },
                                      icon: const Icon(
                                        FontAwesomeIcons.solidSquarePlus,
                                        color: Colors.blueAccent,
                                      ))
                                ],
                              ),
                              const SizedBox(height: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    List.generate(medicaments.length, (index) {
                                  final med = medicaments[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Text('${med.name}(${med.tradename})'),
                                  );
                                }),
                              )
                            ],
                          ))
                  ])),
              Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: AnimatedSmoothIndicator(
                  activeIndex: page,
                  count: 4,
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                      index.toInt(),
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear,
                    );
                  },
                  duration: const Duration(milliseconds: 200),
                  effect: const WormEffect(
                    dotColor: Color.fromARGB(255, 175, 175, 175),
                    activeDotColor: Color.fromARGB(255, 103, 220, 250),
                    dotWidth: 10,
                    dotHeight: 10,
                    spacing: 20,
                  ),
                ),
              ),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 70, 24, 236)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side:
                                        const BorderSide(color: Colors.blue)))),
                        child: const Text(
                          'Regresar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        onPressed: () {
                          logger.d(page);
                          if (page > 0) {
                            setState(() {
                              page = page - 1;
                              generate = false;
                            });
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear,
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    generate == false
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 70, 24, 236)),
                                  shape: MaterialStateProperty
                                      .all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              side: const BorderSide(
                                                  color: Colors.blue)))),
                              child: const Text(
                                'Continuar',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              onPressed: () {
                                logger.d(page);

                                if (page < 3) {
                                  setState(() {
                                    page = page + 1;
                                  });
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.linear,
                                  );
                                }
                                if (page == 3) {
                                  setState(() {
                                    generate = true;
                                  });
                                }
                              },
                            ),
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 70, 24, 236)),
                                  shape: MaterialStateProperty
                                      .all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              side: const BorderSide(
                                                  color: Colors.blue)))),
                              child: const Text(
                                'Generar receta',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              onPressed: () {
                                logger.d(page);

                                if (page < 3) {
                                  setState(() {
                                    page = page + 1;
                                  });
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.linear,
                                  );
                                } else {
                                  setState(() {
                                    generate = true;
                                  });
                                }
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
