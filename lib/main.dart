import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:portfolio/protfoliomain_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProtfoliomainScreen(),
    );
  }
}
//Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(height:200,width:200,child: Image.asset(project.imageUrl,fit:BoxFit.cover,)),
//                   SizedBox(height: 10),
//                   Text(
//                     project.title,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),