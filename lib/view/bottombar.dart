import 'package:flutter/material.dart';
import 'package:portfolio/view/homepage.dart';

class Bottombar extends StatelessWidget {
  final SidebarSection? currentSection;
  final void Function(SidebarSection section)? onSectionSelected;

  const Bottombar({super.key, this.currentSection, this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    final items = [
      _BottomBarItem(
        icon: Icons.home,
        label: 'Home',
        section: SidebarSection.home,
      ),
      _BottomBarItem(
        icon: Icons.person,
        label: 'About',
        section: SidebarSection.about,
      ),
      _BottomBarItem(
        icon: Icons.star,
        label: 'Skills',
        section: SidebarSection.skills,
      ),
      _BottomBarItem(
        icon: Icons.work,
        label: 'Projects',
        section: SidebarSection.projects,
      ),
      _BottomBarItem(
        icon: Icons.mail,
        label: 'Contact',
        section: SidebarSection.contact,
      ),
    ];

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[900]?.withOpacity(0.95),
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            final bool selected = currentSection == item.section;
            return _AnimatedBarIcon(
              icon: item.icon,
              label: item.label,
              selected: selected,
              onTap: () => onSectionSelected?.call(item.section),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _BottomBarItem {
  final IconData icon;
  final String label;
  final SidebarSection section;
  _BottomBarItem({
    required this.icon,
    required this.label,
    required this.section,
  });
}

class _AnimatedBarIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _AnimatedBarIcon({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Colors.white;
    final Color unselectedColor = Colors.white70;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: /*AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: selected
            ? BoxDecoration(
                color: selectedColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child:*/ Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              width: selected ? 44 : 36,
              height: selected ? 44 : 36,
              decoration: selected
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [selectedColor, Colors.black54],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: selectedColor.withOpacity(0.25),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    )
                  : null,
              child: Icon(
                icon,
                color: selected ? Colors.white : unselectedColor,
                size: selected ? 28 : 24,
              ),
            ),
          /*  const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: selected ? selectedColor : unselectedColor,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                fontSize: selected ? 14 : 12,
              ),
              child: Text(label),
            ),*/
          ],
        ),
     /* ),*/
    );
  }
}

