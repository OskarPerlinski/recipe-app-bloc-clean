import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/home/widgets/banner.dart';
import 'package:recipe_app/presentation/home/widgets/header.dart';
import 'package:recipe_app/presentation/home/widgets/quick_and_fast.dart';
import 'package:recipe_app/presentation/home/widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 20),
            SearchField(),
            SizedBox(height: 20),
            BannerExplore(),
            SizedBox(height: 20),
            QuickAndFast(),
          ],
        ),
      ),
    );
  }
}
