

import 'package:news/style/assetmanager.dart';

class CategoryModel{
  String id;
  String title ;
  String imagePath;
  CategoryModel({required this.id,required this.title, required this.imagePath});
  // business entertainment general health science sports technology
  static List<CategoryModel>getCategoryList(){
    return [
      CategoryModel(id: "general", title: "general", imagePath:ImageManager.general_light),
      CategoryModel(id: "business", title: "Business", imagePath: ImageManager.business_light),
      CategoryModel(id: "sports", title: "Sports", imagePath: ImageManager.sport_light),
      CategoryModel(id: "technology", title: "Technology", imagePath: ImageManager.technology_light),
      CategoryModel(id: "entertainment", title: "Entertainment", imagePath: ImageManager.entertainment_light),
      CategoryModel(id: "health", title: "Health", imagePath: ImageManager.health_light),
      CategoryModel(id: "science", title: "Science", imagePath: ImageManager.science_light),

    ];
  }
}