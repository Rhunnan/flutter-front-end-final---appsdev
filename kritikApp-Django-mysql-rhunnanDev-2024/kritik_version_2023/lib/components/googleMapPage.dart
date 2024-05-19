import 'package:flutter/material.dart';

class GoogleMapPage extends StatelessWidget {
  const GoogleMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 750,
        width: 360,
        child: Image.asset("assets/images/googleMap.jpg"),
      ),
    );
  }
}
