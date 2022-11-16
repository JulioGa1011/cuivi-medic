import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/models/medicament_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Medicaments extends StatefulWidget {
  List<MedicamentModel> medicaments;
  Medicaments({super.key, required this.medicaments});

  @override
  State<Medicaments> createState() => _MedicamentsState();
}

class _MedicamentsState extends State<Medicaments> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return widget.medicaments.isNotEmpty
        ? Column(
            children: List.generate(widget.medicaments.length, (int index) {
            return Card(
              elevation: 20,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 247, 222, 186),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 60,
                      width: 60,
                      child: const Icon(
                        FontAwesomeIcons.capsules,
                        color: Colors.indigo,
                      ),
                    ),
                    Text(
                      widget.medicaments[index].tradename,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Cada ${widget.medicaments[index].hours} horas",
                      style: TextStyle(fontSize: 10),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 209, 187, 247),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          '${widget.medicaments[index].quantity}',
                          style: TextStyle(color: Colors.indigo),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }))
        : Container(
            child: Text("No hay medicamentos agregados "),
          );
  }
}
