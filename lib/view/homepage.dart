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
import 'bottombar.dart';
import 'skill.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  static final homeKey = GlobalKey();
  static final aboutKey = GlobalKey();
  static final skillsKey = GlobalKey();
  static final projectsKey = GlobalKey();
  static final contactKey = GlobalKey();

  static final scrollController = ScrollController();

  static void scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  SidebarSection _currentSection = SidebarSection.home;

  @override
  void initState() {
    super.initState();
    Homepage.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    Homepage.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    double getOffset(GlobalKey key) {
      final ctx = key.currentContext;
      if (ctx == null) return double.infinity;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null) return double.infinity;
      final pos = box.localToGlobal(Offset.zero, ancestor: context.findRenderObject());
      return pos.dy;
    }

    final offsets = {
      SidebarSection.home: getOffset(Homepage.homeKey),
      SidebarSection.about: getOffset(Homepage.aboutKey),
      SidebarSection.skills: getOffset(Homepage.skillsKey),
      SidebarSection.projects: getOffset(Homepage.projectsKey),
      SidebarSection.contact: getOffset(Homepage.contactKey),
    };

    SidebarSection? visibleSection;
    double minDiff = double.infinity;
    offsets.forEach((section, offset) {
      final diff = (offset - 100).abs();
      if (offset < MediaQuery.of(context).size.height && diff < minDiff) {
        minDiff = diff;
        visibleSection = section;
      }
    });

    if (visibleSection != null && visibleSection != _currentSection) {
      setState(() {
        _currentSection = visibleSection!;
      });
    }
  }

  void _onSectionSelected(SidebarSection section) {
    setState(() {
      _currentSection = section;
    });
    switch (section) {
      case SidebarSection.home:
        Homepage.scrollToSection(Homepage.homeKey);
        break;
      case SidebarSection.about:
        Homepage.scrollToSection(Homepage.aboutKey);
        break;
      case SidebarSection.skills:
        Homepage.scrollToSection(Homepage.skillsKey);
        break;
      case SidebarSection.projects:
        Homepage.scrollToSection(Homepage.projectsKey);
        break;
      case SidebarSection.contact:
        Homepage.scrollToSection(Homepage.contactKey);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
                  onSectionSelected: _onSectionSelected,
                  currentSection: _currentSection,
                ),
              ),
            Expanded(
              flex: 7,
              child: width < 600
                  ? Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                controller: Homepage.scrollController,
                                physics: BouncingScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Home Section
                                    Container(
                                      key: Homepage.homeKey,
                                      child: Center(
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
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    // About Section
                                    Padding(
                                      key: Homepage.aboutKey,
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
                                          // Skills Section
                                          Text(
                                            Alltext.skill,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: aboutme,
                                                color: Colors.grey.shade600),
                                          ),
                                          Divider(),
                                          SizedBox(
                                            key: Homepage.skillsKey,
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
                                          // Projects Section
                                          Text(
                                            Alltext.myword,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: aboutme,
                                                color: Colors.grey.shade600),
                                          ),
                                          Divider(),
                                          SizedBox(
                                            key: Homepage.projectsKey,
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
                                          }),
                                          // Contact Section anchor
                                          SizedBox(
                                            key: Homepage.contactKey,
                                            height: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Bottombar(
                          currentSection: _currentSection,
                          onSectionSelected: _onSectionSelected,
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        SingleChildScrollView(
                          controller: Homepage.scrollController,
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Home Section
                              Container(
                                key: Homepage.homeKey,
                                child: Center(
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
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              // About Section
                              Padding(
                                key: Homepage.aboutKey,
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
                                    // Skills Section
                                    Text(
                                      Alltext.skill,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: aboutme,
                                          color: Colors.grey.shade600),
                                    ),
                                    Divider(),
                                    SizedBox(
                                      key: Homepage.skillsKey,
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
                                    // Projects Section
                                    Text(
                                      Alltext.myword,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: aboutme,
                                          color: Colors.grey.shade600),
                                    ),
                                    Divider(),
                                    SizedBox(
                                      key: Homepage.projectsKey,
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
                                    }),
                                    // Contact Section anchor
                                    SizedBox(
                                      key: Homepage.contactKey,
                                      height: 1,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              )
                            ],
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

// Enum for sidebar sections
enum SidebarSection { home, about, skills, projects, contact }
