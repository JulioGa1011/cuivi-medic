import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/home/screens/third/screens/medicaments.dart';
import 'package:cuivi_medic/ui/models/medicament_model.dart';
import 'package:cuivi_medic/ui/models/patient_model.dart';
import 'package:cuivi_medic/ui/models/presentation_model.dart';
import 'package:cuivi_medic/ui/models/types_model.dart';
import 'package:cuivi_medic/ui/providers/patient_provider.dart';
import 'package:cuivi_medic/ui/providers/types_provider.dart';
import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:cuivi_medic/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

const List<String> list = <String>['paciente', 'Two', 'Three', 'Four'];

class AddPrescription extends StatefulWidget {
  PatientModel? patient;
  AddPrescription({Key? key, this.patient}) : super(key: key);

  @override
  State<AddPrescription> createState() => _AddPrescriptionState();
}

class _AddPrescriptionState extends State<AddPrescription> {
  TypesModel? selectedItem;
  PresentationModel? presentationItem;

  int page = 0;
  bool generate = false;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();

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
  bool medicament = false;
  bool valueswitch = false;
  String dropdownValue = list.first;
  var _isLoading = false;
  int? idAdministration;
  int? idPresentation;
  var isInit = false;

  @override
  void didChangeDependencies() async {
    if (!isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<TypesProvider>(context)
          .typesAdministration(context)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      Provider.of<TypesProvider>(context)
          .typesPresentation(context)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      isInit = true;
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    page = 0;
    super.initState();
    _pageController.addListener(() {
      setState(() {
        page = _pageController.page!.round();
      });
    });
  }

  final PageController _pageController = PageController();
  submit(String name, String tradename, int medicamentPresentationId,
      int grammage, int quantity, administrationFormId, days, hours) {
    setState(() {
      medicaments.add(MedicamentModel(
          name: name,
          tradename: tradename,
          medicamentPresentationId: medicamentPresentationId,
          grammage: grammage,
          quantity: quantity,
          administrationFormId: administrationFormId,
          days: days,
          hours: hours));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final administration = Provider.of<TypesProvider>(context);
    logger.d(administration.presentation.length);

    // final patients = Provider.of<PatientModel>(con7y992text);
    // logger.d(patients);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          children: [
            page == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Paciente',
                          style: TextStyle(color: Colors.indigo, fontSize: 20)),
                      Text('1/4')
                    ],
                  )
                : page == 1
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Signos vitales         ',
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 20)),
                          Text('2/4')
                        ],
                      )
                    : page == 2
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Diagn??stico',
                                  style: TextStyle(
                                      color: Colors.indigo, fontSize: 20)),
                              Text('3/4')
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Medicamentos',
                                  style: TextStyle(
                                      color: Colors.indigo, fontSize: 20)),
                              Text('4/4')
                            ],
                          ),
            SizedBox(height: 10),
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
                  activeDotColor: Colors.indigo,
                  dotWidth: 75,
                  dotHeight: 7,
                  spacing: 5,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    if (page == 0)
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //   children: [
                              //     Text('Paciente registrado'),
                              //     Switch(
                              //         value: valueswitch,
                              //         onChanged: (bool newValue) {
                              //           setState(() {
                              //             valueswitch = newValue;
                              //           });
                              //         })
                              //   ],
                              // ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      InputWidget(
                                        hintText: 'Nombre',
                                        onSubmitted: (value) {},
                                        validate: (num) {},
                                        controller: _name,
                                      ),
                                      const SizedBox(height: 20),
                                      InputWidget(
                                        hintText: 'Edad',
                                        onSubmitted: (value) {},
                                        validate: (num) {},
                                      ),
                                      const SizedBox(height: 20),
                                      InputWidget(
                                        hintText: 'Email',
                                        onSubmitted: (value) {},
                                        validate: (num) {},
                                        controller: _email,
                                      ),
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
                              )
                            ],
                          ),
                        ),
                      ),
                    if (page == 1)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
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
                            InputWidget(
                                maxLines: 10,
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
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                                side: const BorderSide(
                                                    color: Colors.indigo)))),
                                    onPressed: () {
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
                                              body: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    const SizedBox(height: 20),
                                                    InputWidget(
                                                      hintText:
                                                          'Sustancia activa ',
                                                      onSubmitted: (value) {},
                                                      validate: (num) {},
                                                      controller:
                                                          _medicamentName,
                                                    ),
                                                    const SizedBox(height: 20),
                                                    InputWidget(
                                                      hintText:
                                                          'Nombre Comercial',
                                                      onSubmitted: (value) {},
                                                      validate: (num) {},
                                                      controller: _tradename,
                                                    ),
                                                    const SizedBox(height: 20),
                                                    Container(
                                                      width: size.width,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.indigo,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        color: Colors.white,
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    size.width *
                                                                        .03),
                                                        child: DropdownButton<
                                                                PresentationModel>(
                                                            iconEnabledColor:
                                                                Color(
                                                                    0xff0F70B7),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            isExpanded: true,
                                                            value:
                                                                presentationItem,
                                                            hint: Text(
                                                              'Presentaci??n',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize:
                                                                    size.width *
                                                                        .035,
                                                              ),
                                                            ),
                                                            underline:
                                                                Container(),
                                                            items: administration
                                                                .presentation
                                                                .map(
                                                                    (PresentationModel
                                                                        value) {
                                                              return DropdownMenuItem<
                                                                      PresentationModel>(
                                                                  value: value,
                                                                  child: Text(
                                                                      value
                                                                          .name));
                                                            }).toList(),
                                                            onChanged:
                                                                (PresentationModel?
                                                                    presentation) {
                                                              setState(() {
                                                                presentationItem =
                                                                    presentation;
                                                                idPresentation =
                                                                    presentation!
                                                                        .id;
                                                              });
                                                            }),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20),
                                                    InputWidget(
                                                      hintText: 'Presentaci??n',
                                                      onSubmitted: (value) {},
                                                      validate: (num) {},
                                                      controller: _presentation,
                                                    ),
                                                    const SizedBox(height: 20),
                                                    InputWidget(
                                                      hintText: 'Gramaje',
                                                      onSubmitted: (value) {},
                                                      validate: (num) {},
                                                      controller: _gramage,
                                                    ),
                                                    const SizedBox(height: 20),
                                                    InputWidget(
                                                      hintText: 'Cantidad ',
                                                      onSubmitted: (value) {},
                                                      validate: (num) {},
                                                      controller: _cantidad,
                                                    ),
                                                    const SizedBox(height: 20),
                                                    Container(
                                                      width: size.width,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.indigo,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        color: Colors.white,
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    size.width *
                                                                        .03),
                                                        child: DropdownButton<
                                                                TypesModel>(
                                                            iconEnabledColor:
                                                                Color(
                                                                    0xff0F70B7),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            isExpanded: true,
                                                            value: selectedItem,
                                                            hint: Text(
                                                              'V??a de administraci??n',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize:
                                                                    size.width *
                                                                        .035,
                                                              ),
                                                            ),
                                                            underline:
                                                                Container(),
                                                            items: administration
                                                                .administration
                                                                .map((TypesModel
                                                                    value) {
                                                              return DropdownMenuItem<
                                                                      TypesModel>(
                                                                  value: value,
                                                                  child: Text(
                                                                      value
                                                                          .name));
                                                            }).toList(),
                                                            onChanged:
                                                                (TypesModel?
                                                                    newValue) {
                                                              setState(() {
                                                                selectedItem =
                                                                    newValue;
                                                                idAdministration =
                                                                    newValue!
                                                                        .id;
                                                              });
                                                            }),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20),
                                                    InputWidget(
                                                      hintText:
                                                          'Por cuantos d??as ',
                                                      onSubmitted: (value) {},
                                                      validate: (num) {},
                                                      controller: _days,
                                                    ),
                                                    const SizedBox(height: 20),
                                                    InputWidget(
                                                      hintText:
                                                          'Cada cuantas horas  ',
                                                      onSubmitted: (value) {},
                                                      validate: (num) {},
                                                      controller: _hours,
                                                    ),
                                                    const SizedBox(height: 20),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        //submit(
                                                        //  _medicamentName.text,
                                                        //_tradename.text);
                                                        //_medicamentName.clear();
                                                        //_tradename.clear();
                                                        medicaments.add(
                                                            MedicamentModel(
                                                          name: _medicamentName
                                                              .text,
                                                          tradename:
                                                              _tradename.text,
                                                          medicamentPresentationId:
                                                              idPresentation,
                                                          grammage: int.parse(
                                                              _gramage.text),
                                                          quantity: int.parse(
                                                              _cantidad.text),
                                                          administrationFormId:
                                                              idAdministration,
                                                          days: _days.text,
                                                          hours: _hours.text,
                                                        ));
                                                        setState(() {});
                                                        logger.d(
                                                            medicaments.length);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Guardar'),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                            ;
                                          });
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.add,
                                          color: Colors.indigo,
                                        ),
                                        Text(
                                          'Agregar medicamento',
                                          style:
                                              TextStyle(color: Colors.indigo),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Medicaments(
                                medicaments: medicaments,
                              ),

                              // const Text('os', style: TextStyle(fontSize: 15)),
                              const SizedBox(height: 20),
                            ],
                          ))
                  ])),
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 255, 255, 255)),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60.0),
                                  side: const BorderSide(color: Colors.grey)))),
                      child: const Text(
                        'Regresar',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.indigo),
                      ),
                      onPressed: () {
                        logger.d(page);
                        if (page > 0) {
                          setState(() {
                            page = page - 1;
                            generate = false;
                          });
                          /*_pageController.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear,
                          );*/
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  generate == false
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 64, 85, 208)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
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
                              if (page < 3) {
                                setState(() {
                                  page = page + 1;
                                });
                                /*_pageController.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.linear,
                                );*/
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
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.indigo),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
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
    );
  }
}
