import 'package:flutter/material.dart';
import 'package:portfolio/Controllers/education_controller.dart';
import 'package:provider/provider.dart';
class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Education_controller>(
      builder: (context,provider,child)
      {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: provider.educationdata.length,
          itemBuilder: (context, index) {
            final data = provider.educationdata[index];
            return Container(
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white12),
                borderRadius: BorderRadius.circular(10),
                /*   color: Color(0xFF0D0D0D)*/
              ),
              child: ListTile(
                hoverColor: Colors.grey.withValues(alpha: 0.2),
                leading: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.white),
                      shape: BoxShape.circle
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Image.asset(data['images'],fit: BoxFit.fill,),
                  ),
                ),
                title: Text(
                  data['title'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(data['subtitle'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white70),),
                    Text(data['date'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white70),),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded, color: Colors.white70,),
                onTap: () {},
              ),
            );
          },
        );
      },
    );
  }
}
