import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/home/screens/second/widgets/show_alergy.dart';
import 'package:cuivi_medic/ui/home/screens/third/screens/medicaments.dart';
import 'package:cuivi_medic/ui/models/expedient_model.dart';
import 'package:cuivi_medic/ui/models/medicament_model.dart';
import 'package:cuivi_medic/ui/models/medicine.dart';
import 'package:cuivi_medic/ui/models/patient_model.dart';
import 'package:cuivi_medic/ui/models/presentation_model.dart';
import 'package:cuivi_medic/ui/models/types_model.dart';
import 'package:cuivi_medic/ui/providers/medicament_provider.dart';
import 'package:cuivi_medic/ui/providers/types_provider.dart';
import 'package:cuivi_medic/ui/services/medicines_services.dart';
import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:cuivi_medic/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../models/medicament_prescription_model.dart';

const List<String> list = <String>['paciente', 'Two', 'Three', 'Four'];

class AddPrescription extends StatefulWidget {
  PatientModel? patient;
  List<PatientExpedientModel>? expedient;

  AddPrescription({Key? key, this.patient, this.expedient}) : super(key: key);

  @override
  State<AddPrescription> createState() => _AddPrescriptionState();
}

class _AddPrescriptionState extends State<AddPrescription> {
  List<Substance>? substanceMedicament = [];
  TypesModel? selectedItem;
  PresentationModel? presentationItem;

  int page = 0;
  bool generate = false;
  TextEditingController _patientId = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _allergy = TextEditingController();
  TextEditingController _birth = TextEditingController();
  TextEditingController _ta = TextEditingController();
  TextEditingController _fc = TextEditingController();
  TextEditingController _fr = TextEditingController();
  TextEditingController _glucose = TextEditingController();
  TextEditingController _temperature = TextEditingController();
  TextEditingController _diagnostic = TextEditingController();
  TextEditingController _medicamentId = TextEditingController();
  TextEditingController _medicamentName = TextEditingController();
  final TextEditingController _days = TextEditingController();
  final TextEditingController _hours = TextEditingController();
  final TextEditingController _presentation = TextEditingController();
  final TextEditingController _presentationId = TextEditingController();
  final TextEditingController _administration = TextEditingController();
  final TextEditingController _gramage = TextEditingController();
  final TextEditingController _cantidad = TextEditingController();
  bool addMedicament = false;
  List<Medicines> medicaments = [];
  bool medicament = false;
  bool valueswitch = false;
  String dropdownValue = list.first;
  var _isLoading = true;
  int? idAdministration;
  int? idPresentation;
  int? idSubstance;
  var isInit = false;
  int? presentation;

  @override
  void didChangeDependencies() async {
    if (!isInit) {
      Provider.of<TypesProvider>(context)
          .typesAdministration(context)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });

      Provider.of<MedicamentProvider>(context)
          .substanceProvider(context)
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
  // submit(String name, String tradename, int medicamentPresentationId,
  //     int grammage, int quantity, administrationFormId, days, hours) {
  //   setState(() {
  //     medicaments.add(MedicamentModel(
  //         name: name,
  //         tradename: tradename,
  //         medicamentPresentationId: medicamentPresentationId,
  //         grammage: grammage,
  //         quantity: quantity,
  //         administrationFormId: administrationFormId,
  //         days: days,
  //         hours: hours));
  //   });
  // }

  static List<PresentationModel> _kOptions = <PresentationModel>[];
  static String _displayStringForOption(PresentationModel option) =>
      option.name;
  static List<MedicamentsPrescription> _substance = <MedicamentsPrescription>[];
  static String _optionSubstance(MedicamentsPrescription option) =>
      option.name!;
  static List<Substance> _substanceMedicament = <Substance>[];
  static String _optionMedicament(Substance option) => option.name!;
  static List<MedicinePresentation> _medicamentPresentation =
      <MedicinePresentation>[];
  static String _presentationMedicament(MedicinePresentation option) =>
      option.name!;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final administration = Provider.of<TypesProvider>(context);
    final substance = Provider.of<MedicamentProvider>(context);
    if (widget.patient != null) {
      _name.text = widget.patient!.name!;
      _email.text = widget.patient!.email!;
    }
    ;
    _patientId.text = widget.patient!.patientId.toString();
    logger.d(_patientId.text);

    substance.values.forEach(
      (element) {
        _substance.add(element);
        setState(() {});
      },
    );
    administration.presentation.forEach(((element) {
      _kOptions.add(element);
    }));
    // final patients = Provider.of<PatientModel>(con7y992text);
    // logger.d(patients);
    return _isLoading
        ? CircularProgressIndicator()
        : Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: [
                  page == 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Paciente',
                                style: TextStyle(
                                    color: Colors.indigo, fontSize: 20)),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Diagnóstico',
                                        style: TextStyle(
                                            color: Colors.indigo,
                                            fontSize: 20)),
                                    Text('3/4')
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Medicamentos',
                                        style: TextStyle(
                                            color: Colors.indigo,
                                            fontSize: 20)),
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
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 5),
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
                                              controller: _age,
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
                                              validate: (num) {},
                                              controller: _weight,
                                            ),
                                            const SizedBox(height: 20),
                                            InputWidget(
                                              hintText: 'Alergias',
                                              onSubmitted: (value) {},
                                              validate: (num) {},
                                              controller: _allergy,
                                            ),
                                            widget.expedient != null
                                                ? ShowAllergies(
                                                    expedient:
                                                        widget.expedient!)
                                                : SizedBox(),
                                            const SizedBox(height: 20),
                                            InputWidget(
                                              hintText: 'Fecha de nacimiento',
                                              onSubmitted: (value) {},
                                              validate: (num) {},
                                              controller: _birth,
                                            ),
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
                                    validate: (num) {},
                                    controller: _ta,
                                  ),
                                  const SizedBox(height: 20),
                                  InputWidget(
                                    hintText: 'FC',
                                    onSubmitted: (value) {},
                                    validate: (num) {},
                                    controller: _fc,
                                  ),
                                  const SizedBox(height: 20),
                                  InputWidget(
                                    hintText: 'FR',
                                    onSubmitted: (value) {},
                                    validate: (num) {},
                                    controller: _fr,
                                  ),
                                  const SizedBox(height: 20),
                                  InputWidget(
                                    hintText: 'Glucosa',
                                    onSubmitted: (value) {},
                                    validate: (num) {},
                                    controller: _glucose,
                                  ),
                                  const SizedBox(height: 20),
                                  InputWidget(
                                    hintText: 'Temperatura',
                                    onSubmitted: (value) {},
                                    validate: (num) {},
                                    controller: _temperature,
                                  ),
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
                                    validate: (num) {},
                                    controller: _diagnostic,
                                  ),
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
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7.0),
                                                      side: const BorderSide(
                                                          color:
                                                              Colors.indigo)))),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
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
                                                          const SizedBox(
                                                              height: 20),
                                                          // InputWidget(
                                                          //   hintText:
                                                          //       'Sustancia activa ',
                                                          //   onSubmitted: (value) {},
                                                          //   validate: (num) {},
                                                          //   controller:
                                                          //       _medicamentName,
                                                          // ),
                                                          // const SizedBox(height: 20),
                                                          Text(
                                                              "Sustancia activa"),
                                                          Container(
                                                              width: size.width,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .indigo,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        size.width *
                                                                            .03),
                                                                child: Autocomplete<
                                                                    MedicamentsPrescription>(
                                                                  displayStringForOption:
                                                                      _optionSubstance,
                                                                  optionsBuilder:
                                                                      (TextEditingValue
                                                                          textEditingValue) {
                                                                    if (textEditingValue
                                                                            .text ==
                                                                        ' ') {
                                                                      return const Iterable<
                                                                          MedicamentsPrescription>.empty();
                                                                    }
                                                                    return _substance.where(
                                                                        (MedicamentsPrescription
                                                                            option) {
                                                                      return option
                                                                          .toString()
                                                                          .contains(textEditingValue
                                                                              .text
                                                                              .toLowerCase());
                                                                    });
                                                                  },
                                                                  onSelected:
                                                                      (MedicamentsPrescription
                                                                          selection) async {
                                                                    setState(
                                                                        () {
                                                                      selection
                                                                          .substances!
                                                                          .forEach(
                                                                              (element) {
                                                                        _substanceMedicament
                                                                            .add(element);
                                                                      });
                                                                      selection
                                                                          .medicinePresentations!
                                                                          .forEach(
                                                                              (element) {
                                                                        _medicamentPresentation
                                                                            .add(element);
                                                                      });
                                                                      _medicamentId
                                                                              .text =
                                                                          selection
                                                                              .id
                                                                              .toString();
                                                                      _medicamentName
                                                                              .text =
                                                                          selection
                                                                              .name!;

                                                                      logger.d(
                                                                          selection
                                                                              .id);
                                                                      logger.d(selection
                                                                          .substances!
                                                                          .first
                                                                          .name);
                                                                    });
                                                                  },
                                                                ),
                                                              )),
                                                          // const SizedBox(height: 20),

                                                          // InputWidget(
                                                          //   hintText:
                                                          //       'Nombre Comercial',
                                                          //   onSubmitted: (value) {},
                                                          //   validate: (num) {},
                                                          //   controller: _tradename,
                                                          // ),
                                                          // const SizedBox(height: 20),
                                                          // Container(
                                                          //   width: size.width,
                                                          //   decoration: BoxDecoration(
                                                          //     border: Border.all(
                                                          //       color: Colors.indigo,
                                                          //       width: 1,
                                                          //     ),
                                                          //     borderRadius:
                                                          //         BorderRadius
                                                          //             .circular(10.0),
                                                          //     color: Colors.white,
                                                          //   ),
                                                          //   child: Padding(
                                                          //     padding: EdgeInsets
                                                          //         .symmetric(
                                                          //             horizontal:
                                                          //                 size.width *
                                                          //                     .03),
                                                          //     child: DropdownButton<
                                                          //             PresentationModel>(
                                                          //         iconEnabledColor:
                                                          //             Color(
                                                          //                 0xff0F70B7),
                                                          //         borderRadius:
                                                          //             BorderRadius
                                                          //                 .circular(
                                                          //                     10),
                                                          //         isExpanded: true,
                                                          //         value:
                                                          //             presentationItem,
                                                          //         hint: Text(
                                                          //           'Presentación',
                                                          //           style: TextStyle(
                                                          //             color: Colors
                                                          //                 .black54,
                                                          //             fontSize:
                                                          //                 size.width *
                                                          //                     .035,
                                                          //           ),
                                                          //         ),
                                                          //         underline:
                                                          //             Container(),
                                                          //         items: administration
                                                          //             .presentation
                                                          //             .map(
                                                          //                 (PresentationModel
                                                          //                     value) {
                                                          //           return DropdownMenuItem<
                                                          //                   PresentationModel>(
                                                          //               value: value,
                                                          //               child: Text(
                                                          //                   value
                                                          //                       .name));
                                                          //         }).toList(),
                                                          //         onChanged:
                                                          //             (PresentationModel?
                                                          //                 presentation) {
                                                          //           setState(() {
                                                          //             presentationItem =
                                                          //                 presentation;
                                                          //             idPresentation =
                                                          //                 presentation!
                                                          //                     .id;
                                                          //           });
                                                          //         }),
                                                          //   ),
                                                          // ),
                                                          const SizedBox(
                                                              height: 20),
                                                          // InputWidget(
                                                          //   hintText: 'Presentación',
                                                          //   onSubmitted: (value) {},
                                                          //   validate: (num) {},
                                                          //   controller: _presentation,
                                                          // ),

                                                          Text("Presentacion"),
                                                          Container(
                                                              width: size.width,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .indigo,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        size.width *
                                                                            .03),
                                                                child: Autocomplete<
                                                                    MedicinePresentation>(
                                                                  displayStringForOption:
                                                                      _presentationMedicament,
                                                                  optionsBuilder:
                                                                      (TextEditingValue
                                                                          textEditingValue) {
                                                                    if (textEditingValue
                                                                            .text ==
                                                                        ' ') {
                                                                      return const Iterable<
                                                                          MedicinePresentation>.empty();
                                                                    }
                                                                    return _medicamentPresentation.where(
                                                                        (MedicinePresentation
                                                                            option) {
                                                                      return option
                                                                          .toString()
                                                                          .contains(textEditingValue
                                                                              .text
                                                                              .toLowerCase());
                                                                    });
                                                                  },
                                                                  onSelected:
                                                                      (MedicinePresentation
                                                                          selection) {
                                                                    logger.d(
                                                                        selection
                                                                            .id);
                                                                    debugPrint(
                                                                        'You just selected ${_presentationMedicament(selection)}');
                                                                    _presentation
                                                                            .text =
                                                                        selection
                                                                            .name!;
                                                                    _presentationId
                                                                            .text =
                                                                        selection
                                                                            .id!
                                                                            .toString();
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              )),

                                                          const SizedBox(
                                                              height: 20),
                                                          // InputWidget(
                                                          //   hintText: 'Gramaje',
                                                          //   onSubmitted: (value) {},
                                                          //   validate: (num) {},
                                                          //   controller: _gramage,
                                                          // ),
                                                          // const SizedBox(height: 20),
                                                          InputWidget(
                                                            hintText:
                                                                'Cantidad ',
                                                            onSubmitted:
                                                                (value) {},
                                                            validate: (num) {},
                                                            controller:
                                                                _cantidad,
                                                          ),
                                                          // const SizedBox(height: 20),
                                                          // Container(
                                                          //   width: size.width,
                                                          //   decoration: BoxDecoration(
                                                          //     border: Border.all(
                                                          //       color: Colors.indigo,
                                                          //       width: 1,
                                                          //     ),
                                                          //     borderRadius:
                                                          //         BorderRadius
                                                          //             .circular(10.0),
                                                          //     color: Colors.white,
                                                          //   ),
                                                          //   child: Padding(
                                                          //     padding: EdgeInsets
                                                          //         .symmetric(
                                                          //             horizontal:
                                                          //                 size.width *
                                                          //                     .03),
                                                          //     child: DropdownButton<
                                                          //             TypesModel>(
                                                          //         iconEnabledColor:
                                                          //             Color(
                                                          //                 0xff0F70B7),
                                                          //         borderRadius:
                                                          //             BorderRadius
                                                          //                 .circular(
                                                          //                     10),
                                                          //         isExpanded: true,
                                                          //         value: selectedItem,
                                                          //         hint: Text(
                                                          //           'Forma farmaceutica',
                                                          //           style: TextStyle(
                                                          //             color: Colors
                                                          //                 .black54,
                                                          //             fontSize:
                                                          //                 size.width *
                                                          //                     .035,
                                                          //           ),
                                                          //         ),
                                                          //         underline:
                                                          //             Container(),
                                                          //         items: administration
                                                          //             .administration
                                                          //             .map((TypesModel
                                                          //                 value) {
                                                          //           return DropdownMenuItem<
                                                          //                   TypesModel>(
                                                          //               value: value,
                                                          //               child: Text(
                                                          //                   value
                                                          //                       .name));
                                                          //         }).toList(),
                                                          //         onChanged:
                                                          //             (TypesModel?
                                                          //                 newValue) {
                                                          //           setState(() {
                                                          //             selectedItem =
                                                          //                 newValue;
                                                          //             idAdministration =
                                                          //                 newValue!
                                                          //                     .id;
                                                          //           });
                                                          //         }),
                                                          //   ),
                                                          // ),
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
                                                              //submit(
                                                              //  _medicamentName.text,
                                                              //_tradename.text);
                                                              //_medicamentName.clear();
                                                              //_tradename.clear();
                                                              medicaments.add(Medicines(
                                                                  id: int.parse(
                                                                      _medicamentId
                                                                          .text),
                                                                  name: _medicamentName
                                                                      .text,
                                                                  namePresentation:
                                                                      _presentation
                                                                          .text,
                                                                  presentation:
                                                                      int.parse(
                                                                          _presentationId
                                                                              .text),
                                                                  quantity:
                                                                      int.parse(
                                                                          _cantidad
                                                                              .text),
                                                                  frequency:
                                                                      _hours
                                                                          .text,
                                                                  duration: _days
                                                                      .text));
                                                              setState(() {});
                                                              logger.d(
                                                                  medicaments
                                                                      .first
                                                                      .toJson());
                                                              Navigator.pop(
                                                                  context);
                                                              // MedicinesServices().createPrescriptions(
                                                              //     idPatient: widget
                                                              //         .patient!
                                                              //         .patientId!,
                                                              //     name: _name.text,
                                                              //     email: _email.text,
                                                              //     weight:
                                                              //         double.parse(
                                                              //             _weight
                                                              //                 .text),
                                                              //     allergies: _allergy
                                                              //         .text,
                                                              //     age: _age.text,
                                                              //     ta: _ta.text,
                                                              //     fc: _fc.text,
                                                              //     fr: _fr.text,
                                                              //     glucose:
                                                              //         _glucose.text,
                                                              //     temperature:
                                                              //         _temperature
                                                              //             .text,
                                                              //     diagnosis:
                                                              //         _diagnostic
                                                              //             .text,
                                                              //     observations: "",
                                                              //     idMedicament: int
                                                              //         .parse(
                                                              //             _medicamentId
                                                              //                 .text),
                                                              //     presentation:
                                                              //         presentation!,
                                                              //     frequency:
                                                              //         _days.text,
                                                              //     duration:
                                                              //         _hours.text);
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
                                          },
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons.add,
                                                color: Colors.indigo,
                                              ),
                                              Text(
                                                'Agregar medicamento',
                                                style: TextStyle(
                                                    color: Colors.indigo),
                                              ),
                                            ],
                                          )),
                                    ),
                                    const SizedBox(
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 255, 255, 255)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(60.0),
                                        side: const BorderSide(
                                            color: Colors.grey)))),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
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
                                    if (page < 3) {
                                      setState(() {
                                        page = page + 1;
                                      });
                                      _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.linear,
                                      );
                                    } else {
                                      logger.d('creando receta');
                                      MedicinesServices().createPrescriptions(
                                          idPatient: int.parse(_patientId.text),
                                          name: _name.text,
                                          email: _email.text,
                                          weight: double.parse(_weight.text),
                                          allergies: _allergy.text,
                                          age: _age.text,
                                          ta: _ta.text,
                                          fc: _fc.text,
                                          fr: _fr.text,
                                          glucose: _glucose.text,
                                          temperature: _temperature.text,
                                          diagnosis: _diagnostic.text,
                                          medicines: medicaments,
                                          context: context);

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
