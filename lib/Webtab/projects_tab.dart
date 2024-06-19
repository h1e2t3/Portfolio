import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsTab extends StatefulWidget {
  const ProjectsTab({
    super.key,
    required this.sectionKey,
  });

  final GlobalKey sectionKey;

  @override
  State<ProjectsTab> createState() => _ProjectsTabState();
}

class _ProjectsTabState extends State<ProjectsTab> {
  Future<void> oprnurl(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalNonBrowserApplication,
    )) {
      throw Exception("Could not launch $url");
    }
  }

  bool shadow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade900,
      body: Container(
        height: Get.height,
        width: Get.width,
        key: widget.sectionKey,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:420,
            childAspectRatio: 1.25, // Adjust this ratio as needed
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return GestureDetector(
              onTap: () {
                oprnurl(project.githubUrl);
              },
              child: Container(
                height:Get.height/6,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 8,
                            color:Colors.blue.shade300,
                        spreadRadius: 1)
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      child: Image.asset(
                        project.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: Get.height /10,
                      width: Get.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        project.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

final List<Project> projects = [
  Project(
    title: 'Portfolio',
    imageUrl: 'assets/image/portfolio-main.png', // Add your image asset here
    githubUrl: 'https://github.com/h1e2t3/Portfolio',
  ),
  Project(
    title: 'FoodZone',
    imageUrl: 'assets/image/foodzone-main.png', // Add your image asset here
    githubUrl: 'https://github.com/h1e2t3/FoodZone',
  ),
  Project(
    title: 'Awesome Snackbar Content',
    imageUrl: 'assets/image/IMG_4668.png', // Add your image asset here
    githubUrl: 'https://github.com/your_github_repo_snackbar',
  ),
];

class Project {
  final String title;
  final String imageUrl;
  final String githubUrl;

  Project({
    required this.title,
    required this.imageUrl,
    required this.githubUrl,
  });
}
