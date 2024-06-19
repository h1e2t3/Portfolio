import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Techtab extends StatefulWidget {
  const Techtab({super.key, required this.sectionKey});

  final GlobalKey sectionKey;

  @override
  _TechtabState createState() => _TechtabState();
}

class _TechtabState extends State<Techtab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      key: widget.sectionKey,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tech Stack',
            style: TextStyle(
              color: Colors.blue.shade300,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height:20),
          Text(
            'Change is inevitable, so I keep on exploring new technology, learn it in a minimal possible way and then build something out of it to see how well I did :)',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height:30),
          TechStackCategory(
            title: 'Mobile development',
            items: [
              'Flutter',
              'Dart',
            ], iconnn: [Icons.flutter_dash,FontAwesomeIcons.code],
          ),
          TechStackCategory(
            title: 'Server side',
            items: [
              'REST APIs',
            ], iconnn: [FontAwesomeIcons.server,],
          ),
          TechStackCategory(
            title: 'Databases',
            items: [
              'Firebase',
            ],iconnn: [FontAwesomeIcons.database,],
          ),
          TechStackCategory(
            title: 'Version controlling & management',
            items: [
              'GitHub',
            ],iconnn: [Icons.flutter_dash,],
          ),
          TechStackCategory(
            title: 'UI/UX Design',
            items: [
              'Figma',
            ],iconnn: [Icons.flutter_dash,],
          ),
        ],
      ),
    );
  }
}

class TechStackCategory extends StatefulWidget {
  final String title;
  final List<String> items;
  final List<IconData>? iconnn;

  TechStackCategory({required this.title, required this.items, required this.iconnn});

  @override
  _TechStackCategoryState createState() => _TechStackCategoryState();
}

class _TechStackCategoryState extends State<TechStackCategory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
            List.generate(widget.items.length, (index) {
              return TechStackItem(
                name: widget.items[index],
                icons: widget.iconnn != null && widget.iconnn!.length > index
                    ? widget.iconnn![index]
                    : null,
              );
            }),
          ),
        ],
      ),
    );
  }
}

class TechStackItem extends StatefulWidget {
  final String name;
  final IconData?icons;


  TechStackItem({required this.name, required this.icons});

  @override
  _TechStackItemState createState() => _TechStackItemState();
}

class _TechStackItemState extends State<TechStackItem> {
  bool _isHovered = false;
  String? howerdmenu;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter:(event) =>
          setState(() {
            howerdmenu = widget.name;
          }),
      onExit: (event) =>
          setState(() {
            howerdmenu =null;
          }),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: howerdmenu != null ? Colors.white : Colors.blue.shade300,
          boxShadow: [
            BoxShadow(blurRadius: 8,
                color: howerdmenu == widget.name
                    ? Colors.blue.shade300
                    : Colors.transparent,
                spreadRadius: 1)
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width:Get.width/8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icons,color: Colors.black,),
              SizedBox(width: 10,),
              Text(
                widget.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
