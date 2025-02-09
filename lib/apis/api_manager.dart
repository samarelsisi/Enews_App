import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/apis/api_constant.dart';
import 'package:news/apis/endPoints.dart';
import 'package:news/models/NewsDataResponse.dart';
import 'package:news/models/SourceResponse.dart';

class ApiManager{
  static Future<SourceResponse?> getSources()async{
    Uri url=Uri.https(ApiConstant.baseUrl,EndPoints.sourceEndPoint ,{
      'apiKey':ApiConstant.apiKey
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
}