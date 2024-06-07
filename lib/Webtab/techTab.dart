import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class Techtab extends StatefulWidget {
  const Techtab({super.key, required this.sectionKey});
  final GlobalKey sectionKey;

  @override
  State<Techtab> createState() => _TechtabState();
}

class _TechtabState extends State<Techtab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tech Stack',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Change is inevitable, so I keep on exploring new technology, learn it in a minimal possible way and then build something out of it to see how well I did :)',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TechStackCategory(
                title: 'Mobile development',
                items: [
                  'Flutter',
                  'Dart',
                ],
              ),
              TechStackCategory(
                title: 'Web development',
                items: [
                  'HTML5',
                  'CSS3',
                  'Bootstrap',
                  'Javascript',
                ],
              ),
              TechStackCategory(
                title: 'Server side',
                items: [
                  'Flask Restful',
                  'Node.js',
                  'Express.js',
                  'REST APIs',
                  'Dart Frog',
                ],
              ),
              TechStackCategory(
                title: 'Databases',
                items: [
                  'Firebase',
                  'MongoDB',
                  'Postgres SQL',
                ],
              ),
              TechStackCategory(
                title: 'Version controlling & management',
                items: [
                  'GitHub',
                  'Jira',
                  'Trello',
                  'Notion',
                ],
              ),
              TechStackCategory(
                title: 'UI/UX Design',
                items: [
                  'Figma',
                  'Adobe XD',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TechStackCategory extends StatelessWidget {
  final String title;
  final List<String> items;

  TechStackCategory({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
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
            children: items.map((item) => TechStackItem(name: item)).toList(),
          ),
        ],
      ),
    );
  }
}

class TechStackItem extends StatelessWidget {
  final String name;

  TechStackItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      hoverChild: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      onHover: (event) {},
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.greenAccent,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
