import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/models/categorymodel.dart';
import 'package:news/style/appstyle.dart';
import 'package:news/ui/category_details/source_tab.dart';
import 'package:news/ui/news/news_widget.dart';

class CategoryDetails extends StatefulWidget {

  CategoryModel category;

   CategoryDetails({required this.category,super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body: Column(
        children: [
          FutureBuilder(
            future: ApiManager.getSources(widget.category.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                );
              } else if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: const Text("Something Went Worng")),
                    ElevatedButton(onPressed: () {
                      ApiManager.getSources(widget.category.id);
                      setState(() {

                      });
                    }, child: const Text("Try again"))
                  ],
                );
              }
              if(snapshot.data!.status ! !="ok"){
                return Column(
                    children: [
                    Text(snapshot.data!.message!),
              ElevatedButton(onPressed: () {
                ApiManager.getSources(widget.category.id);
                setState(() {

                });
              }, child: const Text("Try again"))
              ],);
              }
              var sourceList=snapshot.data!.sources??[];
              return SourceTab(sourceList: sourceList);
            },

          )

        ],
      ),
    );
  }
}
