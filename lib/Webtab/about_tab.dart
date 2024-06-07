import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        alignment: Alignment.centerLeft,
        key: widget.sectionKey,
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          "About Me",
          style: GoogleFonts.poppins(
            color: Colors.blue.shade300,
            fontSize: 33,
            fontWeight: FontWeight.w600,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Hello there! My name\nis HET\n",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
        ),
        Text(
          "“If you are not going to tell the world who you are, the world is not\ngoing to tell you, how good you are.”",
          style: GoogleFonts.poppins(
              color: Colors.white.withOpacity(0.30),
              fontStyle: FontStyle.italic,
              fontSize:12,
              ),),
            SizedBox(height: 40,),
            Text("Enthusiastic and skilled Flutter Develope with a solid understanding of Dart programming and a strong passion\nfor developing cross-platform mobile applications for Android and iOS. Experienced in translating UI/UX designs\nintoresponsive and visually appealing user interfaces, implementing efficient statemanagement solutions, and\nintegrating third-party APIs to enhance app functionality.",style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
            ),)
          ],
        ));
  }
}
