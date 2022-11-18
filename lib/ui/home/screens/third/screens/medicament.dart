import 'package:cuivi_medic/ui/models/medicine.dart';
import 'package:cuivi_medic/ui/providers/types_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../main.dart';
import '../../../../../widgets/input_widget.dart';
import '../../../../models/medicament_model.dart';
import '../../../../models/presentation_model.dart';
import '../../../../models/types_model.dart';
import '../../../../providers/medicament_provider.dart';

class Medicament extends StatefulWidget {
  const Medicament({super.key});

  @override
  State<Medicament> createState() => _MedicamentState();
}

class _MedicamentState extends State<Medicament> {
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
  var _isLoading = false;
  int? idAdministration;
  int? idPresentation;
  int? idSubstance;
  var isInit = false;
  bool presentation = false;

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

  static List<PresentationModel> _kOptions = <PresentationModel>[];
  static String _displayStringForOption(PresentationModel option) =>
      option.name;
  static List<MedicamentsPrescription> _substance = <MedicamentsPrescription>[];
  static String _optionSubstance(TypesModel option) => option.name;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final administration = Provider.of<TypesProvider>(context);
    final substance = Provider.of<MedicamentProvider>(context);

    substance.values.forEach(
      (element) {
        _substance.add(element);
        setState(() {});
      },
    );
    administration.presentation.forEach(((element) {
      _kOptions.add(element);
    }));
    return Column(
      children: [
        InputWidget(
          hintText: 'Nombre Comercial',
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
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .03),
            child: DropdownButton<PresentationModel>(
                iconEnabledColor: Color(0xff0F70B7),
                borderRadius: BorderRadius.circular(10),
                isExpanded: true,
                value: presentationItem,
                hint: Text(
                  'Presentación',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: size.width * .035,
                  ),
                ),
                underline: Container(),
                items:
                    administration.presentation.map((PresentationModel value) {
                  return DropdownMenuItem<PresentationModel>(
                      value: value, child: Text(value.name));
                }).toList(),
                onChanged: (PresentationModel? presentation) {
                  setState(() {
                    presentationItem = presentation;
                    idPresentation = presentation!.id;
                  });
                }),
          ),
        ),
        const SizedBox(height: 20),
        // InputWidget(
        //   hintText: 'Presentación',
        //   onSubmitted: (value) {},
        //   validate: (num) {},
        //   controller: _presentation,
        // ),

        Text("Presentacion"),
        Container(
            width: size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.indigo,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .03),
              child: Autocomplete<PresentationModel>(
                displayStringForOption: _displayStringForOption,
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == ' ') {
                    return const Iterable<PresentationModel>.empty();
                  }
                  return administration.kOptions
                      .where((PresentationModel option) {
                    return option
                        .toString()
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (PresentationModel selection) {
                  logger.d(selection.id);
                  debugPrint(
                      'You just selected ${_displayStringForOption(selection)}');
                },
              ),
            )),

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
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .03),
            child: DropdownButton<TypesModel>(
                iconEnabledColor: Color(0xff0F70B7),
                borderRadius: BorderRadius.circular(10),
                isExpanded: true,
                value: selectedItem,
                hint: Text(
                  'Vía de administración',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: size.width * .035,
                  ),
                ),
                underline: Container(),
                items: administration.administration.map((TypesModel value) {
                  return DropdownMenuItem<TypesModel>(
                      value: value, child: Text(value.name));
                }).toList(),
                onChanged: (TypesModel? newValue) {
                  setState(() {
                    selectedItem = newValue;
                    idAdministration = newValue!.id;
                  });
                }),
          ),
        ),
        const SizedBox(height: 20),
        InputWidget(
          hintText: 'Por cuantos días ',
          onSubmitted: (value) {},
          validate: (num) {},
          controller: _days,
        ),
        const SizedBox(height: 20),
        InputWidget(
          hintText: 'Cada cuantas horas  ',
          onSubmitted: (value) {},
          validate: (num) {},
          controller: _hours,
        ),
      ],
    );
  }
}
