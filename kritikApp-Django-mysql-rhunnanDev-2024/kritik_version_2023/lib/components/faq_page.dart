import 'package:flutter/material.dart';


class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FAQ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
              '1.) Is this App operable?',
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff808080), fontSize: 25),
              textAlign: TextAlign.left,
              ),
            ),
            Text(
            "In some cases it does!",
            style: TextStyle(fontWeight: FontWeight.w300, color: Color(0xff808080), fontSize: 15),
            textAlign: TextAlign.left,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
              '2.) When does it release?',
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff808080), fontSize: 25),
              textAlign: TextAlign.left,
              ),
            ),
            Text(
            "Next year! but insert more FAQs here",
            style: TextStyle(fontWeight: FontWeight.w300, color: Color(0xff808080), fontSize: 15),
            textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
