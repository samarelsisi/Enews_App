import 'package:flutter/material.dart';
import 'package:news/models/categorymodel.dart';
import 'package:news/style/appcolors.dart';
import 'package:news/style/appstyle.dart';

class CategoryFragment extends StatelessWidget {
static const String routeName="category_fregment";
Function onClickViewAll;
 CategoryFragment({required this.onClickViewAll,super.key});

  @override
  Widget build(BuildContext context) {
    var categoryList=CategoryModel.getCategoryList();

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(padding: EdgeInsets.symmetric(horizontal:width*0.02,
        vertical:height *.02
    ),
    child: Column(
        children: [
          Text("Good Morning \n Here is Some News For You",
            style: AppStyles.medium20White.copyWith(color: Theme.of(context).primaryColor),
          ),
          SizedBox(
            height: height*.02,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: height*.012,);
              },
              itemBuilder: (context, index) {
              return Stack(
                alignment:index%2==0? Alignment.bottomRight:Alignment.bottomLeft,

                children: [
                  ClipRRect(
                    child: Image.asset(categoryList[index].imagePath),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(84),
                      color: AppColors.greyColor,
                    ),
                     width: width*.4
                      ,margin: EdgeInsets.only(bottom: height*.02),
                     // padding: EdgeInsets.symmetric(vertical: height*.012),
                    child:  InkWell(
                      onTap: (){
                        onClickViewAll(categoryList[index]);
                      },
                      child:index%2==0?
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width*.02,
                          ),
                          Text("View All",style: AppStyles.medium16Black,),
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColorLight,
                            radius: 30,
                            child: Icon(Icons.arrow_forward_ios_outlined,
                                color:Theme.of(context).primaryColor),
                          )
                        ],

                      )
                    :
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColorLight,
                            radius: 30,
                            child: Icon(Icons.arrow_back_ios,
                                color:Theme.of(context).primaryColor),
                          ),
                          Text("View All",style: AppStyles.medium16Black,),
                         SizedBox(
                           width: width*.02,
                         )
                        ],

                      ),
                    ),
                  )
                ],
              );

            },  itemCount: categoryList.length,),
          )
        ],
    ),
    );
  }
}
