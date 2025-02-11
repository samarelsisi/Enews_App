import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsDataResponse.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/style/appcolors.dart';
import 'package:news/style/appstyle.dart';
import 'package:news/ui/category_details/webview.dart';
import 'package:news/ui/news/overflow_custom.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  Articles article;

  NewsItem({required this.article,super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
     String publishAt=article.publishedAt!;
    DateTime publishedDate = DateTime.parse(publishAt);

    return InkWell(
      onTap: (){
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      width: width * 0.95,
                      fit: BoxFit.cover,
                      imageUrl: article.urlToImage?.isNotEmpty == true
                          ? article.urlToImage!
                          : "https://via.placeholder.com/150",
                      progressIndicatorBuilder: (context, url, progress) =>
                          CircularProgressIndicator(value: progress.progress),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomOverflowText(text:article.content?? "No content available",),

                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.2, vertical: height * 0.02),
                      backgroundColor: AppColors.blackColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: AppColors.whiteColor, width: 2),
                      ),
                    ),
                    child: Text('View Full Articel', style: AppStyles.medium20White),
                    onPressed: ()
                    {
                    if (article.url != null && article.url!.isNotEmpty) {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => WebViewScreen(url: article.url!),
                    ),
                    );
                    }}

                    )

                ],
              ),
            );
          },
        );

      },
      child: Container(
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
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
      ),
    );
  }
}
