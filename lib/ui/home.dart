import 'package:flutter/material.dart';
import 'package:news/models/categorymodel.dart';
import 'package:news/style/appcolors.dart';
import 'package:news/ui/category_details/category_details.dart';
import 'package:news/ui/category_details/category_fragment.dart';
import 'package:news/ui/search/searchScreen.dart';
import 'package:news/ui/home_drawer.dart';

import '../style/appstyle.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName="Home screen";
 HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){
        //   HomeDrawer();
        // }, icon: Icon(Icons.menu,color: Theme.of(context).primaryColor,)),
        centerTitle: true,
        title: Text(selectedCategory==null?"Home":selectedCategory!.title,
          style: AppStyles.medium20White
              .copyWith(color: Theme.of(context).primaryColor),),
        actions: [
          IconButton(onPressed: (){

            Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => SearchScreen(categoryModel: selectedCategory,),
            ),);
          }, icon: Icon(Icons.search_outlined,),color: Theme.of(context).primaryColor,)
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(goToHome: goToHome),),
      body:selectedCategory==null ?
      CategoryFragment(onClickViewAll: onViewAllClicked)
      :CategoryDetails(category: selectedCategory!,)
    );
  }

  CategoryModel? selectedCategory;

  void onViewAllClicked(CategoryModel newCategorySelected){
   selectedCategory=newCategorySelected;
   setState(() {

   });

  }
  void goToHome(){
    selectedCategory=null;
    setState(() {
  Navigator.pop(context);
    });
  }

}
