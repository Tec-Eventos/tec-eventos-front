import 'package:flutter/material.dart';
import 'package:tec_eventos/cores.dart';


class info_evento extends StatefulWidget {
  const info_evento({super.key});

  @override
  State<info_evento> createState() => _info_eventoState();
}



class _info_eventoState extends State<info_evento> {

  @override
  Widget build(BuildContext context) {

    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(

            expandedHeight: displayHeight / 3,
            flexibleSpace: FlexibleSpaceBar(

              background: Image.network(
                "https://i0.wp.com/eztravel.com.br/wp-content/uploads/2022/01/elizeu-dias-seq9dyzse6c-unsplash.jpeg",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            floating: true,
            snap: true,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Cores.Branco,
                ),
              ),
          ),

        ],

        body: ListView(
          scrollDirection: Axis.vertical,

          children: [
            
          ],

        ),
        ),
      );
  }
}
