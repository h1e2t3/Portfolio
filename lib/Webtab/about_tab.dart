import 'package:flutter/material.dart';

class Abouttabs extends StatefulWidget {
  const Abouttabs({super.key, required this.sectionKey});

  final GlobalKey sectionKey;

  @override
  State<Abouttabs> createState() => _AbouttabsState();
}

class _AbouttabsState extends State<Abouttabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      key: widget.sectionKey,
      padding: EdgeInsets.all(20),
      child: Text("About", style: TextStyle(fontSize: 26)),
    );
  }
}
