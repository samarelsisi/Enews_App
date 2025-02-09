import 'package:flutter/material.dart';
import 'package:news/models/SourceResponse.dart';

class Sourcename extends StatelessWidget {
  bool isSelected;
  Sources source;
  Sourcename({required this.source,required this.isSelected ,super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(source.name ?? "", style:isSelected==false?
     TextStyle(
         fontWeight:
         FontWeight.w600,
        color: Theme.of(context).primaryColor):
    TextStyle(
        fontWeight:
        FontWeight.w800,
        color: Theme.of(context).primaryColor)
      ,);
  }

}
