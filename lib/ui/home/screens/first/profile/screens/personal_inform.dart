import 'package:cuivi_medic/ui/providers/doctor_providers.dart';
import 'package:cuivi_medic/widgets/input_widget.dart';
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
                InputWidget(
                  onSubmitted: (p0) {},
                  validate: (p0) {},
                  hintText: '${personal.add.first.name}',
                ),
                const SizedBox(height: 10),
                const Text('Email'),
                InputWidget(
                  onSubmitted: (p0) {},
                  validate: (p0) {},
                  hintText: '${personal.add.first.email}',
                ),
                const SizedBox(height: 10),
                const Text('Telefono'),
                InputWidget(
                  onSubmitted: (p0) {},
                  validate: (p0) {},
                  hintText: '${personal.add.first.phone}',
                ),
                const SizedBox(height: 10),
                const Text('Numero de consultorio'),
                InputWidget(
                  onSubmitted: (p0) {},
                  validate: (p0) {},
                  hintText: '${personal.add.first.healthStaff.officePhone}',
                ),
                const SizedBox(height: 10),
                const Text('Acerca de mi'),
                InputWidget(
                  onSubmitted: (p0) {},
                  validate: (p0) {},
                  hintText: personal.add.first.healthStaff.aboutMe ?? "",
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 79, 98, 202)),
                    onPressed: () {},
                    child: const Text('Actualizar Información'))
              ],
            ),
          );
  }
}
