import 'dart:ui';

import 'package:flutter/material.dart';

class AddTrame extends StatefulWidget {
  const AddTrame({super.key});

  @override
  State<AddTrame> createState() => _AddTrame();

}

class _AddTrame extends State<AddTrame> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            Text('Ajout d\'un trame')
          ],
        ),
      ),
    );
  }
}
