import 'package:cuivi_medic/ui/providers/doctor_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  _submitPersonal() {}
  _submitProfesional() {}
  var isInit = false;
  var _isLoading = false;
  @override
  void didChangeDependencies() async {
    if (!isInit) {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<DoctorProvider>(context).aboutMe(context).then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      isInit = true;

      super.didChangeDependencies();
    }
  }

  @override
  Widget build(BuildContext context) {
    final personal = Provider.of<DoctorProvider>(context);

    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text('Nombre'),
                TextField(
                  decoration: InputDecoration(
                    labelText: '${personal.add.first.name}',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Email'),
                TextField(
                  decoration: InputDecoration(
                    labelText: '${personal.add.first.email}',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Telefono'),
                TextField(
                  decoration: InputDecoration(
                    labelText: '${personal.add.first.phone}',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Numero de consultorio'),
                TextField(
                  decoration: InputDecoration(
                    labelText: '${personal.add.first.healthStaff.officePhone}',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Acerca de mi'),
                TextField(
                  decoration: InputDecoration(
                    labelText: personal.add.first.healthStaff.aboutMe!,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text('Actualizar Información'))
              ],
            ),
          );
  }
}
