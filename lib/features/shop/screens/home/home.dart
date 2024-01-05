import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/container/search_bar_container.dart';
import '../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ************** HEADER ************** //
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // APPBAR
                  HomeAppBar(),

                  SizedBox(height: TSizes.spaceBtwSections),

                  // SEARCHBAR
                  SearchContainer(
                    text: 'Search in Store',
                    icon: Iconsax.search_normal,
                  ),

                  SizedBox(height: TSizes.spaceBtwSections),

                  // CATEGORIES
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // HEADING
                        SectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.dark,
                        ),

                        SizedBox(height: TSizes.spaceBtwItems),

                        // CATEGORIES
                        HomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ************** BODY ************** //
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // PROMO SLIDER
                  PromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),

                  SizedBox(height: TSizes.spaceBtwSections),

                  // POPULAR PRODUCTS
                  ProductCardVertical(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
