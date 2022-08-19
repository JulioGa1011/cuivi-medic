import 'package:cuivi_medic/ui/providers/doctor_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
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
    final personal = Provider.of<DoctorProvider>(context).add.first;

    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              const Text('Nombre'),
              TextField(
                decoration: InputDecoration(
                  labelText: '${personal.name}',
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Email'),
              TextField(
                decoration: InputDecoration(
                  labelText: '${personal.email}',
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Telefono'),
              TextField(
                decoration: InputDecoration(
                  labelText: '${personal.phone}',
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Numero de consultorio'),
              TextField(
                decoration: InputDecoration(
                  labelText: '${personal.healthStaff.officePhone}',
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Acerca de mi'),
              TextField(
                decoration: InputDecoration(
                  labelText:
                      personal.healthStaff.aboutMe!.split('>')[1].split('<')[0],
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
  }
}
