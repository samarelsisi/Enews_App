import 'package:flutter/material.dart';
import 'package:news/style/appcolors.dart';
import 'package:news/style/appstyle.dart';
import 'package:news/style/assetmanager.dart';
import 'package:news/ui/drawer_item.dart';

class HomeDrawer extends StatelessWidget {
  Function goToHome;
   HomeDrawer({ required this.goToHome ,super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Column(

      children: [
        Container(
          width: double.infinity,
          color: AppColors.whiteColor,
          padding: EdgeInsets.symmetric(vertical: height*.13,horizontal: width*.2),
          child: Text("News App",style: AppStyles.bold20Black,),
        ),
        Divider(
          indent: width*.05,
          endIndent: width*.05,
        ),
        InkWell(
          onTap: (){
            goToHome();
          },
            child: DrawerItem(imagePath: ImageManager.home_icon, actionName: "Go To Home")),
        Divider(
          indent: width*.05,
          endIndent: width*.05,
        ),
        DrawerItem(imagePath: ImageManager.theme_icon, actionName: "Theme"),
        Container(
          width: width*.7,
          padding: EdgeInsets.symmetric(vertical: height*.015,horizontal: width*.02),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border:Border.all(
              color: AppColors.whiteColor
            ),
            borderRadius: BorderRadius.circular(16)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Dark",style: AppStyles.medium16White,),
              Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,)
            ],
          ),
        ),
        Divider(
          indent: width*.05,
          endIndent: width*.05,
        ),
        DrawerItem(imagePath: ImageManager.lang_icon, actionName: "Language"),
        Container(
          width: width*.7,
          padding: EdgeInsets.symmetric(vertical: height*.015,horizontal: width*.02),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border:Border.all(
                  color: AppColors.whiteColor
              ),
              borderRadius: BorderRadius.circular(16)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Language",style: AppStyles.medium16White,),
              Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,)
            ],
          ),
        ),
      ],
    );
  }
}
