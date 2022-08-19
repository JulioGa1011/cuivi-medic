import 'package:cuivi_medic/ui/providers/doctor_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  var isInit = false;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (!isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<DoctorProvider>(context)
          .professionalInformation(context)
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
    final professional =
        Provider.of<DoctorProvider>(context).professional.first;
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              const Text('Descripcion'),
              TextField(
                decoration: InputDecoration(
                  labelText: professional.aboutMe!.split('>')[1].split('<')[0],
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Cedula'),
              TextField(
                decoration: InputDecoration(
                  labelText: '${professional.identificationCard}',
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
                  labelText: '${professional.identificationCard}',
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Especialidad'),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Especilidades',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Servicios Medicos'),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Servicios medicos ',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Padecimientos que trata'),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Padecimientos que trata ',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          );
  }
}
