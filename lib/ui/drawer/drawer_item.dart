import 'package:flutter/material.dart';
import 'package:news/style/appstyle.dart';

class DrawerItem extends StatelessWidget {
  String imagePath;
  String actionName;

 DrawerItem({required this.imagePath, required this.actionName ,super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width*.03),
      child: Row(
        children: [
          Image.asset(imagePath),
          SizedBox(
            width:width*.03 ,
          ),
          Text(actionName,style: AppStyles.bold20White,),

        ],
      ),
    );
  }
}
