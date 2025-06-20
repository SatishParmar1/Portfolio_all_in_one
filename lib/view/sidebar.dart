import 'package:flutter/material.dart';
import 'package:portfolio/view/skill.dart';

import '../textdata/alllink.dart';
class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      constraints: BoxConstraints(
        minWidth: 300,
        maxWidth: 300,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Alllink.logo),
          SizedBox(height: 50,),
          Container(
            padding: EdgeInsets.symmetric(horizontal:3),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Skillpage(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black87,
                    foregroundColor: Colors.white,
                  ),

                  child: Text('Skills',style: TextStyle(fontSize: 14),overflow: TextOverflow.clip,),
                ),
                Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
              ],
            ),
          ),
          SizedBox(height: 2,),
          Container(
            padding: EdgeInsets.symmetric(horizontal:3),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Skillpage(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black87,
                    foregroundColor: Colors.white,
                  ),

                  child: Text('Skills',style: TextStyle(fontSize: 14),overflow: TextOverflow.clip,),
                ),
                Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
