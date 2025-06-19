import 'package:flutter/material.dart';
import 'package:portfolio/Uitilities/url_lancher.dart';

class Workcard extends StatelessWidget {
  final String image;
  final String title;
  final Uri link;
  final String description;
  final int maxline;

  const Workcard({
    super.key,
    required this.image,
    required this.title,
    required this.link,
    required this.description,
    required this.maxline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: LayoutBuilder(
          builder: (context, constraints) {
            return InkWell(
              onTap: (){
                if(link.toString() != "") {
                  Urllancher().launchInBrowser(link);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    flex: 2,
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white54,
                      ),
                      textAlign: TextAlign.justify,
                      maxLines: maxline,
                      overflow: TextOverflow.ellipsis,
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

