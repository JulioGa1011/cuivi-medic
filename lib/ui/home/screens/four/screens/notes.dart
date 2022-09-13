import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Notas medicas'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    labelText: ' Buscar',
                  ),
                  // controller: search,
                  textCapitalization: TextCapitalization.sentences,
                  onEditingComplete: () {
                    setState(() {
                      // search;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        Text('Notas'),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                color: Color(0xFF04589A),
                width: 4,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: const Text(
                    'TITULO DE LA NOTA',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Center(child: Text('Contenido de la nota ')),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
