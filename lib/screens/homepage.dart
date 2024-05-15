import 'package:flutter/material.dart';
import 'package:quotely/utills/global.dart';
import 'package:quotely/utills/utills.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Festify",
          style: TextStyalling.appbar_title,
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   style: IconButton.styleFrom(
          //     hoverColor: Colors.greenAccent,
          //   ),
          //   icon: const Icon(Icons.favorite_outlined),
          //   color: Colors.blueGrey,
          // ),
        ],
      ),
      body: ListView(
        children: Globaldata.allImage.map((e) {
          return GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).pushNamed("detailpage", arguments: e);
              });
            },
            child: Container(
              margin: const EdgeInsets.only(left: 15, bottom: 20, right: 15),
              height: 120,
              width: 380,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(e['images']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  "${e['name']}",
                  style: TextStyalling.tital,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
