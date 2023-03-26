import 'dart:ui';

import 'package:flutter/material.dart';

class Trame extends StatefulWidget {
  const Trame({super.key});

  @override
  State<Trame> createState() => _Trame();
}

class _Trame extends State<Trame> {

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.of(context).pop("/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(32, 1, 34, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 30.0),
              child: const Text(
                'FAVORIS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            // Expanded(
            //   child: ListView.separated(
            //     itemCount: _stoptrames.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       final ModelTrame trameList = _stoptrames[index];
            //       return Padding(
            //         padding: EdgeInsets.only(left: 5.0, right: 5.0),
            //         child: Card(
            //           color: const Color.fromRGBO(100, 100, 100, 0.5),
            //           child: Padding(
            //             padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            //             child: ListTile(
            //               onTap: () {},
            //               leading: const Icon(Icons.tram, color: Colors.white),
            //               title: Text(
            //                 trameList.stopname,
            //                 style: const TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 20,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //     separatorBuilder: (BuildContext context, int index) {
            //       return const Divider(height: 0);
            //     },
            //   ),
            // ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(15, 15, 15, 1),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoris',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(111, 0, 0, 1),
          onPressed: () {
            Navigator.of(context).pushNamed('/addTrame');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
