import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/container/primary_header_container.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // APPBAR
                  HomeAppBar(),

                  // SEARCHBAR

                  // CATEGORIES
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
