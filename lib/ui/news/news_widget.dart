import 'package:flutter/material.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/models/NewsDataResponse.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/style/appcolors.dart';
import 'package:news/ui/news/news_item.dart';

class NewsWidget extends StatefulWidget {
  final Sources source;

  const NewsWidget({required this.source, Key? key}) : super(key: key);

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  Future<NewsDataResponse?> _fetchNews() async {
    return ApiManager.getNewsBySourceId(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsDataResponse?>(
      future: _fetchNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.greyColor),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Something went wrong!"),
                ElevatedButton(
                  onPressed: () {
                    setState(() {}); // Refresh the FutureBuilder
                  },
                  child: const Text("Try again"),
                ),
              ],
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.status != 'ok') {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data?.message ?? "No data available"),
                ElevatedButton(
                  onPressed: () {
                    setState(() {}); // Refresh the FutureBuilder
                  },
                  child: const Text("Try again"),
                ),
              ],
            ),
          );
        }

        // If data is available and status is 'ok'
        var newsList = snapshot.data!.articles ?? [];
        if (newsList.isEmpty) {
          return const Center(
            child: Text("No articles found for this source."),
          );
        }

        return ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return NewsItem(article: newsList[index]);
          },
        );
      },
    );
  }
}