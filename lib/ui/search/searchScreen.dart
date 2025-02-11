import 'package:flutter/material.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/models/NewsDataResponse.dart';
import 'package:news/models/categorymodel.dart';
import 'package:news/style/appcolors.dart';
import 'package:news/style/appstyle.dart';
import 'package:news/ui/news/news_item.dart';

class SearchScreen extends StatefulWidget {
  final CategoryModel? categoryModel;
  SearchScreen({required this.categoryModel});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  late Future<List<Articles>> futureNews;
  List<Articles> allArticles = []; // Stores all articles in the category
  List<Articles> filteredArticles = []; // Stores filtered articles based on search
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Fetch all articles for the category when the screen loads
    futureNews = ApiManager.fetchCategoryArticles(widget.categoryModel?.title ?? '');
    futureNews.then((articles) {
      setState(() {
        allArticles = articles; // Store all articles
        filteredArticles = articles; // Initially, show all articles
      });
    }).catchError((error) {
      setState(() {
        filteredArticles = []; // Clear results if there's an error
      });
    });
  }

  void _searchNews(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      // Filter articles based on the search query
      filteredArticles = allArticles.where((article) {
        final title = article.title?.toLowerCase() ?? '';
        final description = article.description?.toLowerCase() ?? '';
        final content = article.content?.toLowerCase() ?? '';
        return title.contains(searchQuery) || description.contains(searchQuery)||content.contains(searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.only(top:  30,left: 16,right: 16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: AppStyles.medium16Grey.copyWith(color: Theme.of(context).primaryColor),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color:  Theme.of(context).primaryColor, width: 2)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color:  Theme.of(context).primaryColor, width: 2)),

              ),

              onChanged: _searchNews, // Pass the function here
            ),
          ),

          // Search Results
          Expanded(
            child: FutureBuilder<List<Articles>>(
              future: futureNews,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No articles found in this category.'));
                } else {
                  return ListView.builder(
                    itemCount: filteredArticles.length,
                    itemBuilder: (context, index) {
                      final article = filteredArticles[index];
                      return NewsItem(article: article);

                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}