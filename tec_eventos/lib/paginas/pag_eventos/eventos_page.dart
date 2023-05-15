import 'package:flutter/material.dart';


class EventosPage extends StatefulWidget {
  const EventosPage({Key? key}) : super(key: key);

  @override
  State<EventosPage> createState() => _EventosPageState();
}

class _EventosPageState extends State<EventosPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.amberAccent,
          )
      ],
    );
  }
}
