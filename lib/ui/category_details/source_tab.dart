import 'package:flutter/material.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/ui/category_details/sourcename.dart';
import 'package:news/ui/news/news_widget.dart';

class SourceTab extends StatefulWidget {
  final List<Sources> sourceList;

  const SourceTab({required this.sourceList, super.key});

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        DefaultTabController(
          length: widget.sourceList.length,
          child: TabBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            indicatorColor: Theme.of(context).primaryColor,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            dividerColor: Colors.transparent,
            tabs: widget.sourceList.map((source) {
              return Sourcename(
                isSelected: selectedIndex == widget.sourceList.indexOf(source),
                source: source,
              );
            }).toList(),

          ),
        ),
        SizedBox(
          height: height*.84,
          child: NewsWidget(source: widget.sourceList[selectedIndex]),
        ),
      ],
    );
  }
}