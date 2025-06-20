import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/Controllers/mywork_controller.dart';
import 'package:portfolio/Uitilities/gridviewwork.dart';
import 'package:portfolio/view/sidebar.dart';
import 'package:provider/provider.dart';

import '../Controllers/skill_controller.dart';
import '../Uitilities/gridviewskills.dart';
import '../textdata/alllink.dart';
import '../textdata/alltext.dart';
import 'skill.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Example breakpoints
    double fontTitleSize;
    double fontSubtitleSize;
    double imageHeight;
    double semmenticpadding;
    double aboutme;
    int maxline;

    if (width < 600) {
      // Mobile
      fontTitleSize = width * 0.08;
      fontSubtitleSize = width * 0.04;
      imageHeight = width * 0.9;
      semmenticpadding = width * 0.05;
      aboutme = width * 0.06;
      maxline = 2;
    } else if (width < 1200) {
      // Tablet
      fontTitleSize = width * 0.05;
      fontSubtitleSize = width * 0.025;
      imageHeight = width * 0.5;
      semmenticpadding = width * 0.05;
      aboutme = width * 0.04;
      maxline = 2;
    } else {
      // Desktop
      fontTitleSize = 70;
      fontSubtitleSize = 30;
      imageHeight = 900;
      semmenticpadding = width * 0.05;
      aboutme = width * 0.02;
      maxline = 2;
    }

    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (width >= 600)
              Expanded(
                flex: 1,
                child: Sidebar(
                ),
              ),
            Expanded(
              flex: 7,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              SizedBox(height: 50),
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [Colors.grey, Colors.white],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ).createShader(Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height)),
                                blendMode: BlendMode.srcIn,
                                child: Text(
                                  Alltext.satish,
                                  style: TextStyle(
                                    fontSize: fontTitleSize,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                Alltext.iotandflutter,
                                style: TextStyle(
                                    fontSize: fontSubtitleSize,
                                    color: Colors.grey),
                              ),
                              SizedBox(height: 10),
                              Image.asset(
                                Alllink.satishimage,
                                height: imageHeight,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: semmenticpadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                Alltext.aboutme,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: aboutme,
                                    color: Colors.grey.shade600),
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                Alltext.aboutmedata,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white54),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                Alltext.skill,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: aboutme,
                                    color: Colors.grey.shade600),
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Consumer<Skill_controller>(
                                  builder: (context, provider, child) {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: provider.skills.length,
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 120,
                                    mainAxisExtent: 125,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 1,
                                  ),
                                  itemBuilder: (context, index) {
                                    final skill = provider.skills[index];
                                    return SkillCard(
                                      image: skill['image'],
                                      title: skill['name'],
                                      color: skill['color'],
                                      description: skill['description'],
                                    );
                                  },
                                );
                              }),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                Alltext.myword,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: aboutme,
                                    color: Colors.grey.shade600),
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Consumer<MyworkController>(
                                  builder: (context, provider, child) {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: provider.work.length,
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 380,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    childAspectRatio:
                                        width < 600 ? 1 : 0.85,
                                  ),
                                  itemBuilder: (context, index) {
                                    final skill = provider.work[index];
                                    return Workcard(
                                      image: skill['image'],
                                      title: skill['name'],
                                      description: skill['description'],
                                      link: Uri.parse(skill['link']),
                                      maxline: maxline,
                                    );
                                  },
                                );
                              })
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                  if (width < 600)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: BottomNavigationBar(
                        items: [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.star),
                            label: 'Skills',
                          ),
                        ],
                        onTap: (index) {
                          if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Skillpage(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
