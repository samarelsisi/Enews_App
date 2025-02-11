import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/apis/api_constant.dart';
import 'package:news/apis/endPoints.dart';
import 'package:news/models/NewsDataResponse.dart';
import 'package:news/models/SourceResponse.dart';

class ApiManager{
  static Future<SourceResponse?> getSources(String categoryId)async{
    Uri url=Uri.https(ApiConstant.baseUrl,EndPoints.sourceEndPoint ,{
      'apiKey':ApiConstant.apiKey,
      'category':categoryId
    });
    var response=await  http.get(url);
    try{
      return SourceResponse.fromJson(jsonDecode(response.body));
    }
 catch(e){
      throw e;
 }
  }
  // https://newsapi.org/v2/everything?q=bitcoin&apiKey=e1d81fe1fa424ba9afa92Future<NewsDataResponse>32c9c1b
  static Future<NewsDataResponse?> getNewsBySourceId(String sourceId)async{
    Uri url=Uri.https(ApiConstant.baseUrl,EndPoints.newsEndPoint,{
      'apiKey':ApiConstant.apiKey,
      'sources':sourceId
    });
   var response=await http.get(url);
   try{
    print(sourceId);
     return NewsDataResponse.fromJson(jsonDecode(response.body));

   }
   catch(e){
     throw e;
   }
  }
  static Future<List<Articles>> fetchCategoryArticles(String category) async {
  Uri url = Uri.https(ApiConstant.baseUrl,EndPoints.headEndPoint, {
  'apiKey': ApiConstant.apiKey, // Replace with your API key
  'category': category,
  });

  var response = await http.get(url);
  if (response.statusCode == 200) {
  var data = jsonDecode(response.body);
  return (data['articles'] as List).map((e) => Articles.fromJson(e)).toList();
  } else {
  throw Exception('Failed to load articles for category: $category');
  }
  }


}