import 'package:flutter/material.dart';
import '../view/sidebar.dart';

class ResponsiveScaffold extends StatelessWidget {
  final List<Widget> pages;
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const ResponsiveScaffold({
    super.key,
    required this.pages,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isWide = width >= 800;

    if (isWide) {
      // Web/Desktop: Sidebar + content
      return Scaffold(
        body: Row(
          children: [
            const Sidebar(),
            Expanded(child: pages[currentIndex]),
          ],
        ),
      );
    } else {
      // Mobile: Bottom bar + content
      return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTabSelected,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Skills'),
            BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Projects'),
            BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Resume'),
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Contact'),
          ],
        ),
      );
    }
  }
}
