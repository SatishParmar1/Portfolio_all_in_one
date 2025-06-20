import 'package:flutter/material.dart';
import '../textdata/alllink.dart';
import '../Uitilities/animated_button.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int selectedIndex = 0;

  void _onSelect(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

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
                  const SizedBox(height: 40),
                  // Profile Image
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(Alllink.logo),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 30),
                  // Navigation Links
                  _SidebarButton(
                    icon: Icons.home,
                    label: 'Home',
                    onTap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
                  _SidebarButton(
                    icon: Icons.person,
                    label: 'About Me',
                    onTap: () {},
                  ),
                  _SidebarButton(
                    icon: Icons.star,
                    label: 'Skills',
                    onTap: () {},
                  ),
                  _SidebarButton(
                    icon: Icons.work,
                    label: 'Projects',
                    onTap: () {},
                  ),
                  _SidebarButton(
                    icon: Icons.description,
                    label: 'Resume',
                    onTap: () {},
                  ),
                  _SidebarButton(
                    icon: Icons.mail,
                    label: 'Contact',
                    onTap: () {},
                  ),
                  const Spacer(),
                  // Social Icons
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _SocialIcon(
                          icon: Icons.linked_camera,
                          url: 'https://linkedin.com',
                        ),
                        const SizedBox(width: 16),
                        _SocialIcon(
                          icon: Icons.code,
                          url: 'https://github.com',
                        ),
                        const SizedBox(width: 16),
                        _SocialIcon(
                          icon: Icons.web,
                          url: 'https://yourwebsite.com',
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
  const _SidebarButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isNarrow = width < 700;
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
                  Icon(icon, color: Colors.white, size: 22),
                  const SizedBox(height: 6),
                  Text(
                    label,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Row(
                children: [
                  Icon(icon, color: Colors.white, size: 20),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      label,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;
  const _SocialIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onTap: () {
        // TODO: Implement launch URL
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
