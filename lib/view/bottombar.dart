import 'package:flutter/material.dart';
import 'package:portfolio/view/homepage.dart';

class Bottombar extends StatelessWidget {
  final SidebarSection? currentSection;
  final void Function(SidebarSection section)? onSectionSelected;

  const Bottombar({super.key, this.currentSection, this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: BottomNavigationBar(
          currentIndex: _sectionToIndex(currentSection),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Skills',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Contact',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            final section = _indexToSection(index);
            onSectionSelected?.call(section);
          },
        ),
      ),
    );
  }

  int _sectionToIndex(SidebarSection? section) {
    switch (section) {
      case SidebarSection.home:
        return 0;
      case SidebarSection.about:
        return 1;
      case SidebarSection.skills:
        return 2;
      case SidebarSection.projects:
        return 3;
      case SidebarSection.contact:
        return 4;
      default:
        return 0;
    }
  }

  SidebarSection _indexToSection(int index) {
    switch (index) {
      case 0:
        return SidebarSection.home;
      case 1:
        return SidebarSection.about;
      case 2:
        return SidebarSection.skills;
      case 3:
        return SidebarSection.projects;
      case 4:
        return SidebarSection.contact;
      default:
        return SidebarSection.home;
    }
  }
}

