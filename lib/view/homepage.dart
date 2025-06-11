import 'package:flutter/material.dart';
import 'package:protfoliowebsite/textdata/alllink.dart';
import 'package:protfoliowebsite/textdata/alltext.dart';
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Example breakpoints
    double fontTitleSize;
    double fontSubtitleSize;
    double imageHeight;
    double semmenticpadding;
    double aboutme;

    if (width < 600) {
      // Mobile
      fontTitleSize = width * 0.08;
      fontSubtitleSize = width * 0.04;
      imageHeight = width * 0.9;
      semmenticpadding = width*0.05;
      aboutme = width*0.06;
    } else if (width < 1200) {
      // Tablet
      fontTitleSize = width * 0.05;
      fontSubtitleSize = width * 0.025;
      imageHeight = width * 0.5;
      semmenticpadding = width*0.05;1;
      aboutme = width*0.04;
    } else {
      // Desktop
      fontTitleSize =70;
      fontSubtitleSize = 30;
      imageHeight = 900;
      semmenticpadding = width*0.05;
      aboutme = width*0.02;
    }

    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (width >= 600)
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey,
                  constraints: BoxConstraints(
                    minWidth: 300,
                    maxWidth: 300,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        color: Colors.grey,
                      ),
                      Container(
                        height: 200,
                        color: Colors.grey,
                      ),
                      Container(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [Colors.grey, Colors.white],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(
                                Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                            blendMode: BlendMode.srcIn,
                            child: Text(
                              Alltext.satish,
                              style: TextStyle(
                                fontSize: fontTitleSize,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            Alltext.iotandflutter,
                            style: TextStyle(
                                fontSize: fontSubtitleSize, color: Colors.grey),
                          ),
                          SizedBox(height: 10),
                          Image.asset(
                            Alllink.satishimage,
                            height: imageHeight,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:semmenticpadding ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(Alltext.aboutme,style: TextStyle(fontWeight: FontWeight.bold,fontSize: aboutme,color: Colors.grey.shade600),),
                          Divider(),
                          SizedBox(height: 10,),
                          Text(Alltext.aboutmedata,style: TextStyle(fontSize: 20,color: Colors.grey.shade700),textAlign: TextAlign.justify,),
                          SizedBox(height: 30,),
                          Text(Alltext.aboutme,style: TextStyle(fontWeight: FontWeight.bold,fontSize: aboutme,color: Colors.grey.shade600),),
                          Divider(),
                          SizedBox(height: 10,),
                          Stack(
                            children: [
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                              ),

                              Container(
                                height: 35,
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical:0),
                                child: Text("Flutter",style:TextStyle(fontSize: 22,),),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),


                    SizedBox(height: 50,)

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
