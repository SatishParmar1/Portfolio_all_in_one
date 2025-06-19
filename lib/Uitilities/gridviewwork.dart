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
       /* boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],*/
      ),
      child: LayoutBuilder(
          builder: (context, constraints) {
            double imageSize = constraints.maxWidth; // Use full width
            double imageHeight = constraints.maxHeight * 0.7; // 70% of container height
            return InkWell(
              onTap: (){
                if(link.toString() != "") {
                  Urllancher().launchInBrowser(link);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      image,
                      height: imageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                        borderRadius:BorderRadius.circular(20) ),

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
                  SizedBox(height: 5,),
                  Text(
                          description,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: maxline,
                          textScaler: TextScaler.noScaling,
                          overflow: TextOverflow.ellipsis,
                        ),

                ],
              )
            );
          }
      ),
    );
  }
}
