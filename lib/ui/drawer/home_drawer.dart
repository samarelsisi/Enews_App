import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/style/appcolors.dart';
import 'package:news/style/appstyle.dart';
import 'package:news/style/assetmanager.dart';
import 'package:news/ui/drawer/drawer_item.dart';
import 'package:news/ui/drawer/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';
import 'language_bottom_sheet.dart';



class HomeDrawer extends StatefulWidget {
  Function goToHome;
   HomeDrawer({ required this.goToHome ,super.key});


  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  List<String> themeList=["Dark","Light"];
  String selectedTheme="Light";
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

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
            widget.goToHome();
          },
            child: DrawerItem(imagePath: ImageManager.home_icon, actionName: "go_to_home".tr())),
        Divider(
          indent: width*.05,
          endIndent: width*.05,
        ),
        DrawerItem(imagePath: ImageManager.theme_icon, actionName: "theme".tr()),
        InkWell(
          onTap: () {
            showThemeBottomSheet();
          }
          ,
          child: Container(
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
                Text( themeProvider.isDarkMode() ? "dark".tr() : "light".tr(),style: AppStyles.medium16White,),
                Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,)
              ],
            ),
          ),
        ),
        Divider(
          indent: width*.05,
          endIndent: width*.05,
        ),
        DrawerItem(imagePath: ImageManager.lang_icon, actionName: "language".tr()),
        InkWell(
          onTap: (){
           showLanguageBottomSheet();

    },
          child: Container(
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
                Text(context.locale.toString() == "en"?"english".tr():"arabic".tr(),style: AppStyles.medium16White,),
                Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,)
              ],
            ),
          ),
        ),
      ],
    );
  }
  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => const ThemeBottomSheet());
  }
  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => const LanguageBottomSheet());
  }
}
