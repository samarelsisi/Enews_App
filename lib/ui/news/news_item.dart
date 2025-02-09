import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsDataResponse.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/style/appstyle.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  Articles article;

  NewsItem({required this.article,super.key});

  @override
  Widget build(BuildContext context) {
     String publishAt=article.publishedAt!;
    DateTime publishedDate = DateTime.parse(publishAt);

    return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      padding:EdgeInsets.all(8),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.all(Radius.circular(16),
        )
            ,
    border: Border.all(
      color: Theme.of(context).primaryColor,
      width: 2
    )

      ),

      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage??"",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(article.title??"",style: AppStyles.regular14White.copyWith(color: Theme.of(context).primaryColor),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: Text("By :${article.author ??''}",style: AppStyles.regular14Gray,)),
              Text(timeago.format(publishedDate)??"",style: AppStyles.regular14Gray,)
            ],
          )
        ],

      ),
    );
  }
}
