import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/models/types_model.dart';
import 'package:cuivi_medic/ui/providers/doctor_providers.dart';
import 'package:cuivi_medic/ui/providers/types_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  String? dropdownValue;
  String? dropdownValue2;
  String? aboutMe;
  String? identificationCard;
  List<dynamic>? specialities;

  var isInit = false;
  var _isLoading = false;

  @override
  void didChangeDependencies() async {
    if (!isInit) {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<DoctorProvider>(context)
          .professionalInformation(context)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      await Provider.of<TypesProvider>(context)
          .typesAilments(context)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      await Provider.of<TypesProvider>(context)
          .typesServices(context)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      await Provider.of<TypesProvider>(context)
          .typesSpecialities(context)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      isInit = true;
      super.didChangeDependencies();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final professional = Provider.of<DoctorProvider>(context);
    final types = Provider.of<TypesProvider>(context);
    types.ailments.add(TypesModel(id: 100, name: 'No info'));
    types.services.add(TypesModel(id: 100, name: 'No info'));
    dropdownValue = 'No info';
    dropdownValue2 = 'No info';
    professional.professional.forEach((element) {
      aboutMe = element.aboutMe;
      identificationCard = element.identificationCard;
      specialities = element.specialities;

      setState(() {});
    });
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text('Descripcion'),
                TextField(
                  decoration: InputDecoration(
                    labelText: aboutMe ?? 'Sin informacion',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Cedula'),
                TextField(
                  decoration: InputDecoration(
                    labelText: identificationCard ?? 'Sin informacion',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('ubicacion'),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Ubicacion',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: identificationCard,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Especialidad'),
                Column(
                    children: specialities != null
                        ? List.generate(specialities!.length, (index) {
                            final specialities = professional
                                .professional.first.specialities[index];
                            return const TextField(
                              decoration: InputDecoration(
                                labelText: '',
                                border: OutlineInputBorder(),
                              ),
                            );
                          })
                        : []),
                const SizedBox(height: 10),
                const Text('Servicios Medicos'),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Servicios medicos ',
                    border: OutlineInputBorder(),
                  ),
                ),
                DropdownButton<String>(
                  value: dropdownValue2,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue2 = newValue!;
                    });
                    logger.d(dropdownValue2);
                  },
                  items: types.services.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    logger.d(dropdownValue);
                  },
                  items: types.ailments.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
                const Text('Padecimientos que trata'),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Padecimientos que trata ',
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text('Actualizar Información'))
              ],
            ),
          );
  }
}
