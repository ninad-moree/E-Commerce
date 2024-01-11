import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/container/search_bar_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ************** HEADER ************** //
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // APPBAR
                  const HomeAppBar(),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  // SEARCHBAR
                  const SearchContainer(
                    text: 'Search in Store',
                    icon: Iconsax.search_normal,
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  // CATEGORIES
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // HEADING
                        SectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: darkMode ? TColors.white : TColors.black,
                        ),

                        const SizedBox(height: TSizes.spaceBtwItems),

                        // CATEGORIES
                        const HomeCategories(),

                        const SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // ************** BODY ************** //
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // PROMO SLIDER
                  const PromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  // HEADING
                  SectionHeading(
                    title: 'Popular Products',
                    onPressed: () {},
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  // POPULAR PRODUCTS
                  GridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const ProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
