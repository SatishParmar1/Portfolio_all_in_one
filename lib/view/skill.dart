import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controllers/skill_controller.dart';
import '../Uitilities/gridviewskills.dart';
import '../textdata/alltext.dart';

class Skillpage extends StatelessWidget {
  const Skillpage({super.key});

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
      semmenticpadding = width*0.05;
      aboutme = width*0.06;
      maxline = 2;
    } else if (width < 1200) {
      // Tablet
      fontTitleSize = width * 0.05;
      fontSubtitleSize = width * 0.025;
      imageHeight = width * 0.5;
      semmenticpadding = width*0.05;1;
      aboutme = width*0.04;
      maxline = 2;
    } else {
      // Desktop
      fontTitleSize =70;
      fontSubtitleSize = 30;
      imageHeight = 900;
      semmenticpadding = width*0.05;
      aboutme = width*0.02;
      maxline = 2;
    }
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Text(Alltext.skill,style: TextStyle(fontWeight: FontWeight.bold,fontSize: aboutme,color: Colors.grey.shade600),),
              Divider(),
              SizedBox(height: 10,),
              Consumer<Skill_controller>(
                  builder: (context,provider,child) {
                    return GridView.builder(
                      shrinkWrap: true, // Allow grid to size to content
                      physics: NeverScrollableScrollPhysics(), // Disable scrolling
                      itemCount: provider.skills.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
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
                  }
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
