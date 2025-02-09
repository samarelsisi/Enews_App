import 'package:flutter/material.dart';
import 'package:news/ui/category_details/category_details.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName="Home screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CategoryDetails(),);
  }
}
