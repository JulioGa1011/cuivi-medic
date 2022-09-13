import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/home/screens/second/screens/add_params.dart';
import 'package:cuivi_medic/ui/providers/params_provider.dart';
import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParamsPatient extends StatefulWidget {
  int paramId;
  String name;
  int id;
  String? initMeasure;
  ParamsPatient(
      {Key? key,
      required this.paramId,
      required this.name,
      this.initMeasure,
      required this.id})
      : super(key: key);

  @override
  State<ParamsPatient> createState() => _ParamsPatientState();
}

class _ParamsPatientState extends State<ParamsPatient> {
  var isInit = false;
  bool exist = false;

  var _isLoading = false;
  @override
  void didChangeDependencies() {
    if (!isInit) {
      setState(() {
        _isLoading = true;
      });
      // Provider.of<ParamsProvider>(context).typesProvider(context).then((value) {
      //   setState(() {
      //     _isLoading = false;
      //   });
      // });
      Provider.of<ParamsProvider>(context)
          .paramsProvider(context, widget.paramId)
          .then((value) {
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
    params.values.forEach((element) {
      if (element.clinicalParamId == widget.id)
        setState(() {
          exist = true;
        });
    });

    return Scaffold(
        appBar: const AppBarWidget(
          isShowBack: true,
          title: Text('Parametros clinicos del paciente'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : exist == true
                    ? ListView.builder(
                        itemCount: params.values.length,
                        itemBuilder: (context, index) {
                          final values = params.values[index];

                          return widget.id == values.clinicalParamId
                              ? Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: .01,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: const Color.fromARGB(
                                            255, 227, 236, 242),
                                      ),
                                      width: size.width,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              widget.name,
                                              // params.type.['name'],
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Valor: ${values.value!}${widget.initMeasure}'
                                              // ${params.values.first.value} ${params.type.parameter.unitMeasure ?? '
                                              ,
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              values.formattedUpdatedAt!,
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 36, 40, 44),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                )
                              : const SizedBox(height: 0);
                        })
                    : SizedBox(
                        child: Column(
                        children: const [
                          Text(
                              'El paciente no ha registrado nada por el momento'),
                          Image(
                            image: AssetImage(
                                'assets/images/undraw_No_data_re_kwbl.png'),
                          ),
                        ],
                      ))),
        floatingActionButton: FloatingActionButton(onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const AddParam();
              });
        }));
  }
}
