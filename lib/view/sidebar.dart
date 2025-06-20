import 'package:flutter/material.dart';
import '../textdata/alllink.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

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
                    backgroundImage: AssetImage(Alllink.satishimage),
                  ),
                  const SizedBox(height: 20),
                  // Name
                  Text(
                    'Satish Kumar',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Tagline
                  Text(
                    'IoT & Flutter Developer',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 24),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(8),
          ),
          child:  Row(
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
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        // TODO: Implement launch URL
      },
      child: CircleAvatar(
        backgroundColor: Colors.grey[800],
        radius: 18,
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
