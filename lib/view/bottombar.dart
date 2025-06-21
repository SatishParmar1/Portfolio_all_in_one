import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/view/skill.dart';
class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Contact',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Contact',
            ),
          ],
          onTap: (index) {
            if (index == 1) {

            }
          },
        ),
      ),
    );
  }
}
