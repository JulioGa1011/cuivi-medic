import 'package:cuivi_medic/ui/home/screens/second/widgets/params_patient.dart';
import 'package:cuivi_medic/ui/providers/params_provider.dart';
import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Params extends StatefulWidget {
  int paramId;
  Params({Key? key, required this.paramId}) : super(key: key);

  @override
  State<Params> createState() => _ParamsState();
}

class _ParamsState extends State<Params> {
  var isInit = false;

  var _isLoading = false;
  @override
  void didChangeDependencies() {
    if (!isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ParamsProvider>(context).typesProvider(context).then((value) {
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
    final size = MediaQuery.of(context).size;

    final params = Provider.of<ParamsProvider>(context);

    return Scaffold(
        appBar: const AppBarWidget(
          isShowBack: true,
          title: Text('Parametros clinicos del paciente'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: params.type.length,
              itemBuilder: (context, index) {
                final type = params.type[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ParamsPatient(
                              paramId: widget.paramId,
                              id: type.id!,
                              name: type.name!,
                              initMeasure: type.unitMeasure ?? '',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: .01,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Color.fromARGB(255, 2, 146, 241),
                        ),
                        width: size.width,
                        height: size.height * 0.08,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${type.name!}',
                                // params.type.['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );
              }),
        ));
  }
}
