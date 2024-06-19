import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Webtab/about_tab.dart';

import 'Webtab/projects_tab.dart';
import 'Webtab/techTab.dart';

class ProtfoliomainScreen extends StatefulWidget {
  const ProtfoliomainScreen({super.key, this.sectionKey,});
  final GlobalKey ?sectionKey;

  @override
  State<ProtfoliomainScreen> createState() => _ProtfoliomainScreenState();
}

class _ProtfoliomainScreenState extends State<ProtfoliomainScreen> {
  IconData? hoveredIcon;
  String? howerdmenu;
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _techKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _communityKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: Duration(seconds: 2), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Get.width / 7),
              child: Text(
                '<HET KANSARA/>',
                style: GoogleFonts.yellowtail(
                    color: Colors.white, fontSize: 30),
              ),
            ),
            Container(
              width: Get.width / 1.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildMenuItem('About', () => _scrollToSection(_aboutKey)),
                  _buildMenuItem('Tech', () => _scrollToSection(_techKey)),
                  _buildMenuItem('Projects', () => _scrollToSection(_projectsKey)),
                  _buildMenuItem('Experience', () => _scrollToSection(_experienceKey)),
                  _buildMenuItem('Community', () => _scrollToSection(_communityKey)),
                ],
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF1E1E1E),
      body: SingleChildScrollView(
        child: Container(
          key: widget.sectionKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 140),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            "Full Stack Flutter Expert",
                            style: GoogleFonts.poppins(
                                color: Colors.blue.shade300,
                                fontSize: 26
                            ),
                          ),
                          const SizedBox(height:40),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Het\n',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Kansara',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height:20),
                          Text("Flutter Developer",style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w200,
                          ),),
                          SizedBox(height: 20),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _buildHoverIconButton(FontAwesomeIcons.linkedin),
                                  SizedBox(width: 10,),
                                  _buildHoverIconButton(FontAwesomeIcons.github),
                                  SizedBox(width: 10,),
                                  _buildHoverIconButton(FontAwesomeIcons.medium),
                                  SizedBox(width: 10,),
                                  _buildHoverIconButton(FontAwesomeIcons.facebook),
                                  SizedBox(width: 10,),
                                  _buildHoverIconButton(FontAwesomeIcons.instagram),
                                  SizedBox(width: 10,),
                                  _buildHoverIconButton(FontAwesomeIcons.twitter),
                                ],
                              )
                          ),
                          const SizedBox(height:80),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue.shade300,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: const Text(
                              "LET'S CHAT!",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height:100),
                          Text(
                            '~4 Years Experience    35+ Projects Completed in 10+ Countries    ~110k Content Reach & Views',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: Get.width / 20),
                    CircleAvatar(
                      radius: 280,
                      backgroundImage:AssetImage("assets/image/IMG_4668.png"),
                      // NetworkImage("https://images.news18.com/ibnlive/uploads/2024/03/virat-kohli-new-look-2024-03-6f105a11359bcf373307174cbcf039c9.jpg"), // Add your profile image here
                    ),
                  ],
                ),
              ),
              SizedBox(height:70,),
              Abouttabs(key:widget.key,sectionKey: _aboutKey),
              SizedBox(height:80,),
              Techtab(sectionKey:_techKey),
              SizedBox(height: Get.height,child: ProjectsTab(sectionKey: _projectsKey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, VoidCallback onPressed) {
    return MouseRegion(
      onEnter: (event) =>
          setState(() {
            howerdmenu = title;
          }),
      onExit: (event) =>
          setState(() {
            howerdmenu = null;
          }),
      child: Column(
        children: [
          TextButton(
              onPressed: onPressed,
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds:200), style: GoogleFonts.poppins(
                color: howerdmenu == title
                    ? Colors.blue.shade300
                    : Colors.white.withOpacity(0.67),
              ), child: Text(
                title,
              ),)
          ),
        ],
      ),
    );
  }

  Widget _buildHoverIconButton(IconData icon) {
    return MouseRegion(
      onEnter: (event) =>
          setState(() {
            hoveredIcon = icon;
          }),
      onExit: (event) =>
          setState(() {
            hoveredIcon = null;
          }),
      child: TweenAnimationBuilder(
        tween: Tween<double>(
            begin: 1.0, end: hoveredIcon == icon ? 1.2 : 1.0),
        duration: const Duration(milliseconds:200),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(blurRadius: 8,
                      color: hoveredIcon == icon
                          ? Colors.blue.shade300
                          : Colors.transparent,
                      spreadRadius: 1)
                ],
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: hoveredIcon == icon ? Colors.black : Colors
                    .black.withOpacity(0.30),
                child: IconButton(
                  icon: Icon(
                      icon,
                      color: Colors.blue.shade300
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
