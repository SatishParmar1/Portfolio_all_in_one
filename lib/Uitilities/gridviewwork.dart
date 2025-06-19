import 'package:flutter/material.dart';
import 'package:portfolio/Uitilities/url_lancher.dart';

class Workcard extends StatelessWidget {
  final String image;
  final String title;
  final Uri link;

  const Workcard({
    super.key,
    required this.image,
    required this.title,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      /*decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),*/
      child: LayoutBuilder(
          builder: (context, constraints) {
            double imageSize = constraints.maxWidth * 0.9; // 50% of container height
            return InkWell(
              onTap: (){
                if(link.toString() != "") {
                  Urllancher().launchInBrowser(link);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.asset(
                        image,
                        height: imageSize,
                        width: imageSize,
                        fit: BoxFit.cover,
                      ),
                    ),

                  Container(
                    width: imageSize-80,
                    decoration: BoxDecoration(
                     /* color: Colors.white24,*/
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )

            );
          }
      ),
    );
  }
}
