import 'package:flutter/material.dart';
import 'package:portfolio/Controllers/experience_controller.dart';
import 'package:portfolio/Uitilities/url_lancher.dart';
import 'package:provider/provider.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  bool _showAll = false;
  Urllancher _urllancher = new Urllancher();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<Experience_Controller>(
      builder: (context, provider, child) {
        final experiences = provider.experiencedata;
        final showButton = experiences.length > 4;
        final visibleExperiences = _showAll ? experiences : experiences.take(4).toList();

        // Helper to build a single experience card
        Widget buildExperienceCard(Map<String, dynamic> data) {
          return Container(
            margin: EdgeInsets.only(bottom: 15, right: /*width >= 600 ? 15 :*/ 0),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              hoverColor: Colors.grey.withOpacity(0.2),
              leading: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    shape: BoxShape.circle
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  backgroundImage: AssetImage(data['images']), // Use AssetImage with backgroundImage
                ),
              ),
              title: Row(
                children: [
                  Text(
                    data['title'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white70),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data['subtitle'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white70),
                  ),
                  Text(
                    data['date'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white70),
                  ),
                ],
              ),
              trailing: Icon(
                  Icons.arrow_forward_ios_rounded, color: Colors.white70),
              onTap: () {

                _urllancher.launchWebUrl(data['url']);
              },
            ),
          );
        }

        Widget experienceList;
        if (width >= 1050) {
          // Web/Desktop: 2 per row using GridView
          experienceList = GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: visibleExperiences.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 90,
              crossAxisSpacing: 15,
              mainAxisSpacing: 0,
            ),
            itemBuilder: (context, index) {
              final data = visibleExperiences[index];
              return buildExperienceCard(data);
            },
          );
        } else {
          // Mobile: 1 per row
          experienceList = ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: visibleExperiences.length,
            itemBuilder: (context, index) {
              final data = visibleExperiences[index];
              return buildExperienceCard(data);
            },
          );
        }

        return Column(
          children: [
            experienceList,
            if (showButton)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showAll = !_showAll;
                    });
                  },
                  child: Text(_showAll ? 'Show Less' : 'Show More', style: const TextStyle(color: Colors.black)),
                ),
              ),
          ],
        );
      },
    );
  }
}
