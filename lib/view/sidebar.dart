import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Uitilities/url_lancher.dart';
import '../textdata/alllink.dart';
import '../Uitilities/animated_button.dart';
import 'homepage.dart';

class Sidebar extends StatelessWidget {
  final void Function(SidebarSection section)? onSectionSelected;
  final SidebarSection? currentSection;

  const Sidebar({super.key, this.onSectionSelected, this.currentSection});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      constraints: const BoxConstraints(
        minWidth: 300,
        maxWidth: 300,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // Profile Image
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(20),
                        child: Image.asset(Alllink.logo)),
                  ),
                  const SizedBox(height: 10),
                  // Navigation Links
                  _SidebarButton(
                    icon: Icons.home,
                    label: 'Home',
                    selected: currentSection == SidebarSection.home,
                    onTap: () {
                      onSectionSelected?.call(SidebarSection.home);
                    },
                  ),
                  _SidebarButton(
                    icon: Icons.person,
                    label: 'About Me',
                    selected: currentSection == SidebarSection.about,
                    onTap: () {
                      onSectionSelected?.call(SidebarSection.about);
                    },
                  ),
                  _SidebarButton(
                    icon: Icons.star,
                    label: 'Skills',
                    selected: currentSection == SidebarSection.skills,
                    onTap: () {
                      onSectionSelected?.call(SidebarSection.skills);
                    },
                  ),
                  _SidebarButton(
                    icon: Icons.work,
                    label: 'Projects',
                    selected: currentSection == SidebarSection.projects,
                    onTap: () {
                      onSectionSelected?.call(SidebarSection.projects);
                    },
                  ),
                  _SidebarButton(
                    icon: Icons.mail,
                    label: 'Contact',
                    selected: currentSection == SidebarSection.contact,
                    onTap: () {
                      onSectionSelected?.call(SidebarSection.contact);
                    },
                  ),
                  const Spacer(),
                  // Social Icons
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16, // horizontal space between items
                      runSpacing: 16, // vertical space between lines (when it wraps)
                      direction: Axis.horizontal,
                      children: [
                        SocialIcon(
                          icon: Icons.linked_camera,
                          url: 'https://www.instagram.com/sa30_parmar/',
                        ),
                        SocialIcon(
                          icon: Icons.code,
                          url: 'https://github.com/SatishParmar1',
                        ),
                        SocialIcon(
                          icon: Icons.web,
                          url: 'https://www.linkedin.com/in/satish-parmar-ak978312',
                        ),
                      ],
                    ),


                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SidebarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;
  _SidebarButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isNarrow = width < 700;
    final Color color = selected ? Colors.black : Colors.white;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16),
      child: AnimatedButton(
        onTap: onTap,
        defaultColor: Colors.grey[850],
        hoverColor: Colors.black54,
        pressedColor: Colors.black,
        borderRadius: BorderRadius.circular(8),
        child: isNarrow
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: color, size: 22),
                  const SizedBox(height: 6),
                  Text(
                    label,
                    style: TextStyle(color: color, fontSize: 14, fontWeight: selected ? FontWeight.bold : FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Row(
              children: [
                Expanded(
                  child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 16, // horizontal space between items
                            runSpacing: 16, // vertical space between lines (when it wraps)
                            direction: Axis.horizontal,
                        children: [
                          Center(child: Icon(icon, color: color, size: 20)),

                          Center(
                            child: Text(
                              label,
                              style: TextStyle(color: color, fontSize: 16, fontWeight: selected ? FontWeight.bold : FontWeight.normal),
                            ),
                          ),
                        ]


                    ),
                ),
              ],
            ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;
   SocialIcon({required this.icon, required this.url});

  Urllancher _urllancher = new Urllancher();
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onTap: () {
        _urllancher.launchInBrowser(Uri.parse(url));
      },
      defaultColor: Colors.grey[800],
      hoverColor: Colors.blueGrey[700],
      pressedColor: Colors.black,
      borderRadius: BorderRadius.circular(20),
      padding: const EdgeInsets.all(0),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 18,
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
