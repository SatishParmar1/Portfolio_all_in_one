import 'package:flutter/material.dart';
import 'package:portfolio/Uitilities/url_lancher.dart';
import 'package:provider/provider.dart';

import '../Controllers/contact_controller.dart';

class Contactdata extends StatelessWidget {
  final bool isRow;
  Contactdata({super.key, this.isRow = false});

  Urllancher _urllancher = new Urllancher();
  @override
  Widget build(BuildContext context) {
    return Consumer<Contact_controller>(
      builder: (context,provider,child)
    {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: provider.contant.length,
        itemBuilder: (context, index) {
          final data = provider.contant[index];
          return Container(
            margin: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white12),
              borderRadius: BorderRadius.circular(10),
              /*   color: Color(0xFF0D0D0D)*/
            ),
            child: ListTile(
              hoverColor: Colors.grey.withValues(alpha: 0.2),
              leading: Icon(data['icon'], color: Colors.white70,),
              title: Text(
                data['name'],
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white70),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded, color: Colors.white70,),
              onTap: () {
                if(data['icon'] == Icons.call){
                  _urllancher.launchPhoneNumber("9785470525");
                }else if(data['icon']==Icons.alternate_email){
                  _urllancher.launchEmail(
                    'satishparmarparmar486@gmail.com',
                    subject: 'send to satish(Portfolio)',
                    body: 'hi,',
                  );
                }else{
                  _urllancher.launchWebUrl("https://www.google.com/maps/place/Jaipur");
                }

              },
            ),
          );
        },
      );
      },
    );
  }
}
